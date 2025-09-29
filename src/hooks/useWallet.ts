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
  disconnect: () => void;
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
  network: "BuildNet", // Default to BuildNet to avoid UI errors
  connect: async () => {
    try {
      console.log('🔗 Starting wallet connection...');
      session = await connectMassa();
      console.log('✅ Massa connection established');
      
      // Force BuildNet for DeWeb deployment
      const isDeWebDeployment = window.location.hostname.includes('massa-deweb.xyz') || 
                               window.location.hostname.includes('autoprize');
      
      if (isDeWebDeployment) {
        set({
          address: session.address,
          connected: true,
          network: "BuildNet",
        });
      } else {
        try {
          const infos = await session.wallet.networkInfos();
          console.log('📡 Network info:', infos);
          set({
            address: session.address,
            connected: true,
            network: (infos as any)?.networkName ?? (infos as any)?.name ?? "BuildNet", // Default to BuildNet
          });
        } catch (networkError) {
          console.warn('⚠️ Could not get network info, defaulting to BuildNet:', networkError);
          set({
            address: session.address,
            connected: true,
            network: "BuildNet",
          });
        }
      }
      
      console.log('✅ Wallet connected:', session.address);
      await get().refreshBalance();
    } catch (error) {
      console.error('❌ Wallet connection failed:', error);
      throw error;
    }
  },
  disconnect: () => {
    session = null;
    set({
      address: null,
      balance: null,
      connected: false,
      network: "BuildNet",
    });
    // Clear any cached wallet data from localStorage and sessionStorage
    localStorage.clear();
    sessionStorage.clear();
    
    // Also clear any massa-specific storage
    try {
      ['wallet-connect', 'massa-wallet', 'massa-session', 'connected-wallet'].forEach(key => {
        localStorage.removeItem(key);
        sessionStorage.removeItem(key);
      });
    } catch (e) {
      console.log('Error clearing storage:', e);
    }
    
    console.log('🔌 Wallet fully disconnected - all storage cleared');
    
    // Force page reload to ensure clean state
    setTimeout(() => {
      window.location.reload();
    }, 100);
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