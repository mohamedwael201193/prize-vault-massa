// src/lib/wallet.ts
import { getWallets, Wallet } from "@massalabs/wallet-provider";
import * as web3 from "@massalabs/massa-web3";

export type Connected = {
  wallet: Wallet;
  provider: any;           // wallet-provider Provider (account)
  address: string;
  sc: (addr: string) => any; // SmartContract instance
  publicProvider: any;     // public (read-only) provider/client
};

function inferNetworkName(url: string | undefined): "buildnet" | "mainnet" | "unknown" {
  const u = (url || "").toLowerCase();
  if (u.includes("buildnet")) return "buildnet";
  if (u.includes("mainnet")) return "mainnet";
  return "unknown";
}

// Create a public provider compatible with the installed @massalabs/massa-web3
function makePublicProvider(rpcUrl?: string): any {
  const net = inferNetworkName(rpcUrl);
  const W: any = web3;

  // Preferred: JsonRpcPublicProvider (new API)
  if (W.JsonRpcPublicProvider) {
    const P = W.JsonRpcPublicProvider;
    if (net === "buildnet" && typeof P.buildnet === "function") return P.buildnet();
    if (net === "mainnet" && typeof P.mainnet === "function") return P.mainnet();
    if (typeof P.fromRpcUrl === "function" && rpcUrl) return P.fromRpcUrl(rpcUrl);
    // Last resort default
    if (typeof P.buildnet === "function") return P.buildnet();
  }

  // Legacy fallback: JsonRPCClient (older docs)
  if (W.JsonRPCClient) {
    const C = W.JsonRPCClient;
    if (net === "buildnet" && typeof C.buildnet === "function") return C.buildnet();
    if (net === "mainnet" && typeof C.mainnet === "function") return C.mainnet();
  }

  // As a final fallback, return undefined; reads will use the wallet provider
  console.warn("[wallet] No public provider constructor found in massa-web3; falling back to wallet provider for reads.");
  return undefined;
}

export async function connectMassa(): Promise<Connected> {
  // Discover wallets (some versions export providers(), we keep getWallets())
  let wallets: Wallet[] = [];
  try {
    wallets = await getWallets();
  } catch {
    const mod: any = await import("@massalabs/wallet-provider");
    wallets = (await mod.providers?.()) || [];
  }
  if (!wallets || wallets.length === 0) {
    throw new Error("No Massa wallet found. Please install/open Massa Station or Bearby.");
  }

  const station = wallets.find(w => w.name() === "MASSASTATION") ?? wallets[0];
  const accounts = await station.accounts();
  if (!accounts || accounts.length === 0) throw new Error("No accounts available in the wallet.");

  const provider = accounts[0];
  const rpcUrl = import.meta.env.VITE_MASSA_RPC || "https://buildnet.massa.net/api/v2";
  const publicProvider = makePublicProvider(rpcUrl);

  // Network check (case-insensitive)
  try {
    const info: any = await station.networkInfos();
    const walletNet = String(info?.networkName || "").toLowerCase();
    const want = inferNetworkName(rpcUrl);
    if (want !== "unknown" && walletNet !== want) {
      console.warn(`Wallet network is not ${want}. Please switch to ${want === "buildnet" ? "BuildNet" : "Mainnet"} in Massa Station.`);
    }
  } catch (e) {
    console.warn("Could not read wallet network info:", e);
  }

  const SmartContract = (web3 as any).SmartContract;
  return {
    wallet: station,
    provider,
    address: provider.address,
    sc: (addr: string) => new SmartContract(provider, addr),
    publicProvider,
  };
}

// Unit helpers (keep Mas as before)
export const Mas = (web3 as any).Mas;
export const toMas = (n: number | string) => Mas.fromString(String(n));

export function wantNetwork(): "buildnet" | "mainnet" {
  const want = (import.meta.env.VITE_NETWORK_NAME ?? "BuildNet").toLowerCase();
  return want.includes("build") ? "buildnet" : "mainnet";
}
export function normalizeNet(name: string | undefined): "buildnet" | "mainnet" | "unknown" {
  const n = (name ?? "").toLowerCase();
  if (n.includes("build")) return "buildnet";
  if (n.includes("main")) return "mainnet";
  return "unknown";
}