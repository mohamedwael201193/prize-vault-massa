import { connectMassa, normalizeNet, wantNetwork } from "@/lib/wallet";
import { create } from "zustand";

// Network label fallback helper
function labelFromUrl(url?: string): string {
  const s = (url || "").toLowerCase();
  if (s.includes("buildnet")) return "BuildNet";
  if (s.includes("mainnet")) return "Mainnet";
  return "Unknown";
}

type WalletState = {
  address: string | null;
  balance: bigint | null;
  connected: boolean;
  network: string | null;
  connect: () => Promise<void>;
  refreshBalance: () => Promise<void>;
  getContract: (addr: string) => any;
  getPublicProvider: () => any | null;
  requireNetwork: () => Promise<void>;
};

let session: Awaited<ReturnType<typeof connectMassa>> | null = null;

export const useWallet = create<WalletState>((set, get) => ({
  address: null,
  balance: null,
  connected: false,
  network: null,
  connect: async () => {
    session = await connectMassa();
    const infos = await session.wallet.networkInfos().catch(() => null);
    set({
      address: session.address,
      connected: true,
      network: infos?.networkName ?? null,
    });
    await get().refreshBalance();
  },
  refreshBalance: async () => {
    if (!session) return;
    const bal = await session.provider.balance(true);
    set({ balance: bal });
  },
  getContract: (addr: string) => {
    if (!session) throw new Error("Not connected");
    return session.sc(addr);
  },
  getPublicProvider: () => (session ? session.publicProvider : null),
  requireNetwork: async () => {
    if (!session) throw new Error("Not connected");
    const want = wantNetwork();
    let rawName = "";
    try {
      const infos = await session.wallet.networkInfos();
      rawName = (infos as any)?.networkName || "";
    } catch {}
    
    // Fallback to RPC URL if network name is unknown
    const fallback = labelFromUrl(session?.publicProvider?.url);
    const label = rawName || fallback;
    const cur = normalizeNet(label);

    // Update local state for UI pills/banners with proper label
    set({ network: label });

    if (cur === "unknown") {
      console.warn(
        `[wallet] Network could not be detected (got "${rawName || "empty"}"). Proceeding, but please ensure Massa Station is on ${
          want === "buildnet" ? "BuildNet" : "Mainnet"
        }.`
      );
      return; // don’t block — assertFinalSuccess will still catch wrong-network errors
    }
    if (cur !== want) {
      throw new Error(
        `Wallet network is ${rawName || cur}. Please switch to ${
          want === "buildnet" ? "BuildNet" : "Mainnet"
        } in Massa Station.`
      );
    }
  },
}));