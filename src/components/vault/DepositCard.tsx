import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { toast } from "@/hooks/use-toast";
import { useWallet } from "@/hooks/useWallet";
import { GAS_SAFE_CALL } from "@/lib/gas";
import { assertFinalSuccess } from "@/lib/ops";
import { getVaultAddr } from "@/lib/sanity";
import { useVaultStore } from "@/state/vaultStore";
import { Args, Mas } from "@massalabs/massa-web3";
import { ArrowDownRight, Loader2, Plus, Wallet } from "lucide-react";
import { useState } from "react";

const VAULT = getVaultAddr();

interface DepositCardProps {
  onDeposit?: (amount: number) => void;
}

export function DepositCard({ onDeposit }: DepositCardProps) {
  // Add debug logging to confirm component mounts
  console.debug("[UI] DepositCard mounted");
  
  const [amount, setAmount] = useState("");
  const { connected, connect, getContract, refreshBalance, requireNetwork } = useWallet();
  const refetch = useVaultStore((s) => s.refetch);
  const [pending, setPending] = useState(false);

  async function handleDeposit(masNumber: number) {
    setPending(true);
    try {
      if (!connected) await connect();
      await requireNetwork();
      
      // Add validation for contract address
      const contractAddr = getVaultAddr();
      console.debug('[UI] Using contract address:', contractAddr);
      
      const sc = getContract(contractAddr);
      const op = await sc.call("deposit", new Args(), {
        coins: Mas.fromString(String(masNumber)),
        fee: Mas.fromString("0.01"),
        maxGas: GAS_SAFE_CALL,
      });
      await assertFinalSuccess(op, "deposit");
      
      // Parse events and apply optimistic updates
      const evts = await (op.getFinalEvents?.() ?? []);
      console.debug("[UI] Deposit events:", evts);
      useVaultStore.getState().mutateAfterEvent(evts);
      
      // Refresh wallet balance
      await refreshBalance();
      
      // Let optimistic update persist, user can manually refetch via diagnostics panel
      console.debug("[UI] Deposit complete, optimistic update applied. Use diagnostics 'Force Refetch' to confirm blockchain state.");
      
      toast({
        title: "Deposit Confirmed",
        description: `Successfully deposited ${masNumber} MAS`,
      });
      onDeposit?.(masNumber);
    } catch (e) {
      console.error("Deposit failed:", e);
      toast({
        title: "Deposit Failed",
        description: e instanceof Error ? e.message : "Transaction failed",
        variant: "destructive",
      });
    } finally {
      setPending(false);
    }
  }

  // Always render the card, handle connection state inside
  return (
    <Card className="card-shadow">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary/10">
            <Plus className="h-4 w-4 text-primary" />
          </div>
          Deposit MAS
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-4">
        {!connected ? (
          <div className="text-center py-4">
            <Wallet className="h-8 w-8 mx-auto mb-2 text-muted-foreground" />
            <p className="text-muted-foreground mb-4">Connect your wallet to deposit</p>
            <Button onClick={connect} className="w-full">
              Connect Wallet
            </Button>
          </div>
        ) : (
          <div className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="deposit-amount">Amount (MAS)</Label>
              <Input
                id="deposit-amount"
                type="number"
                step="0.1"
                min="0"
                placeholder="Enter amount..."
                value={amount}
                onChange={(e) => setAmount(e.target.value)}
              />
            </div>
            <Button
              onClick={() => {
                const num = parseFloat(amount);
                if (num > 0) handleDeposit(num);
              }}
              disabled={!amount || parseFloat(amount) <= 0 || pending}
              className="w-full"
            >
              {pending ? (
                <>
                  <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                  Depositing...
                </>
              ) : (
                <>
                  <ArrowDownRight className="mr-2 h-4 w-4" />
                  Deposit {amount || "0"} MAS
                </>
              )}
            </Button>
          </div>
        )}
      </CardContent>
    </Card>
  );
}
