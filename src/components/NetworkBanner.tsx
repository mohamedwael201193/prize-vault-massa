import { Alert, AlertDescription, AlertTitle } from "@/components/ui/alert";
import { useWallet } from "@/hooks/useWallet";
import { getRpcUrl } from "@/lib/sanity";
import { useEffect, useState } from "react";

export function NetworkBanner() {
  const { wallet } = (window as any)._massaCtx ?? {};
  const { getPublicProvider } = useWallet();
  const [msg, setMsg] = useState<string | null>(null);

  useEffect(() => {
    // Skip network banner for DeWeb deployment
    const isDeWebDeployment = window.location.hostname.includes('massa-deweb.xyz') || 
                             window.location.hostname.includes('autoprize');
    
    if (isDeWebDeployment) {
      setMsg(null);
      return;
    }

    (async () => {
      try {
        const station = await import("@massalabs/wallet-provider");
        void station.getWallets();
      } catch {}
      const want = (getRpcUrl().toLowerCase().includes("buildnet")) ? "BuildNet" : "Mainnet";
      try {
        const infos = await (wallet?.networkInfos?.() ?? Promise.resolve(null));
        const have = String(infos?.networkName || "").toLowerCase();
        if (want.toLowerCase() !== have && have) {
          setMsg(`Wallet network is ${infos?.networkName}. Please switch to ${want} in Massa Station.`);
        }
      } catch {}
    })();
  }, [getPublicProvider]);

  if (!msg) return null;
  return (
    <Alert variant="destructive" className="mb-3">
      <AlertTitle>Network mismatch</AlertTitle>
      <AlertDescription>{msg}</AlertDescription>
    </Alert>
  );
}
