import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Collapsible, CollapsibleContent, CollapsibleTrigger } from "@/components/ui/collapsible";
import { AddressCopy } from "@/components/ui/copy-to-clipboard";
import { useWallet } from "@/hooks/useWallet";
import { getVaultAddr } from "@/lib/sanity";
import { useVaultStore } from "@/state/vaultStore";
import { Bug, ChevronDown, RefreshCw } from "lucide-react";
import { useEffect, useRef, useState } from "react";

export function DiagnosticsPanel() {
  const [isOpen, setIsOpen] = useState(false);
  const [refreshing, setRefreshing] = useState(false);
  const [lastEvents, setLastEvents] = useState<any[]>([]);
  
  const { address, network, balance } = useWallet();
  const { stats, user, refetch, mutateAfterEvent } = useVaultStore();
  const originalMutateRef = useRef(mutateAfterEvent);

  // Intercept mutateAfterEvent to track events
  useEffect(() => {
    const originalMutate = originalMutateRef.current;
    useVaultStore.setState({
      mutateAfterEvent: (events) => {
        console.debug("[Diagnostics] Captured events:", events);
        setLastEvents(prev => [...(events || []), ...prev].slice(0, 3)); // Keep last 3
        originalMutate(events);
      }
    });
  }, []);
  
  const rpcUrl = import.meta.env.VITE_MASSA_RPC || "https://buildnet.massa.net/api/v2";
  const vaultAddr = getVaultAddr();

  const handleForceRefetch = async () => {
    setRefreshing(true);
    try {
      await refetch();
    } catch (e) {
      console.error("Refetch failed:", e);
    } finally {
      setRefreshing(false);
    }
  };

  const formatBalance = (bal: bigint | null) => {
    if (bal === null) return "Unknown";
    return `${Number(bal) / 1e9} MAS`;
  };

  return (
    <div className="fixed bottom-4 left-4 z-50">
      <Collapsible open={isOpen} onOpenChange={setIsOpen}>
        <CollapsibleTrigger asChild>
          <Button
            variant="outline"
            size="sm"
            className="mb-2 bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60"
          >
            <Bug className="h-4 w-4 mr-2" />
            Debug Panel
            <ChevronDown className={`h-4 w-4 ml-2 transition-transform ${isOpen ? "rotate-180" : ""}`} />
          </Button>
        </CollapsibleTrigger>
        <CollapsibleContent>
          <Card className="w-80 bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60">
            <CardHeader className="pb-3">
              <CardTitle className="text-sm flex items-center justify-between">
                Diagnostics
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={handleForceRefetch}
                  disabled={refreshing}
                >
                  <RefreshCw className={`h-4 w-4 ${refreshing ? "animate-spin" : ""}`} />
                </Button>
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-3 text-xs">
              <div>
                <strong>Wallet Info:</strong>
                <div className="mt-1 space-y-1 text-muted-foreground">
                  <div className="flex items-center gap-2">
                    Address: {address ? <AddressCopy address={address} className="text-xs" /> : "Not connected"}
                  </div>
                  <div>Network: {network || "Unknown"}</div>
                  <div>Balance: {formatBalance(balance)}</div>
                </div>
              </div>
              
              <div>
                <strong>Configuration:</strong>
                <div className="mt-1 space-y-1 text-muted-foreground">
                  <div>RPC URL: {rpcUrl}</div>
                  <div className="flex items-center gap-2">
                    Vault Address: {vaultAddr ? <AddressCopy address={vaultAddr} className="text-xs" /> : "Unknown"}
                  </div>
                </div>
              </div>
              
              <div>
                <strong>Vault Stats:</strong>
                <div className="mt-1 space-y-1 text-muted-foreground">
                  <div>TVL: {stats?.tvlMas?.toFixed(2) || "0"} MAS</div>
                  <div>Prize Pool: {stats?.prizePoolMas?.toFixed(2) || "0"} MAS</div>
                  <div>Participants: {stats?.participants || "0"}</div>
                  <div>Next Draw Period: {stats?.nextDrawPeriod || "Unknown"}</div>
                </div>
              </div>
              
              <div>
                <strong>User Position:</strong>
                <div className="mt-1 space-y-1 text-muted-foreground">
                  <div>Principal: {user?.principalMas?.toFixed(2) || "0"} MAS</div>
                  <div>Shares: {user?.sharesNum || "0"}</div>
                  <div>Effective Tickets: {user?.sharesNum || "0"}</div>
                </div>
              </div>
              
              <div>
                <strong>Last Events:</strong>
                <div className="mt-1 space-y-1 text-muted-foreground">
                  {lastEvents.length === 0 ? (
                    <div>No events yet</div>
                  ) : (
                    lastEvents.map((evt, i) => (
                      <div key={i} className="truncate text-xs">
                        {String(evt?.data ?? 'unknown')}
                      </div>
                    ))
                  )}
                </div>
              </div>
            </CardContent>
          </Card>
        </CollapsibleContent>
      </Collapsible>
    </div>
  );
}