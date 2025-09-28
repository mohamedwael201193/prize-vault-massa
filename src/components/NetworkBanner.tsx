import { Alert, AlertDescription, AlertTitle } from "@/components/ui/alert";
import { useEffect, useState } from "react";
import { getRpcUrl } from "@/lib/sanity";
import { useWallet } from "@/hooks/useWallet";

export function NetworkBanner() {
  const { wallet } = (window as any)._massaCtx ?? {};
  const { getPublicProvider } = useWallet();
  const [msg, setMsg] = useState<string | null>(null);

  useEffect(() => {
    (async () => {
      try {
        const station = (await import("@massalabs/wallet-provider")).then(m => m.getWallets()).catch(() => null);
        void station;
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
    <Alert variant="warning" className="mb-3">
      <AlertTitle>Network mismatch</AlertTitle>
      <AlertDescription>{msg}</AlertDescription>
    </Alert>
  );
}
