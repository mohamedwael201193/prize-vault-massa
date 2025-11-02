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
import { Args, Mas, parseUnits } from "@massalabs/massa-web3";
import { motion } from "framer-motion";
import { ArrowLeft, ArrowUpRight, Loader2, Wallet } from "lucide-react";
import { useState } from "react";

const VAULT = getVaultAddr();

interface WithdrawCardProps {
  onWithdraw?: (amount: number) => void;
  userBalanceMas: number;
  selectedRiskTier?: string;
}

export function WithdrawCard({
  onWithdraw,
  userBalanceMas,
  selectedRiskTier = "aggressive",
}: WithdrawCardProps) {
  const [amount, setAmount] = useState("");
  const {
    connected,
    connect,
    getContract,
    refreshBalance,
    requireNetwork,
    balance,
  } = useWallet();
  const refetch = useVaultStore((s) => s.refetch);
  const [pending, setPending] = useState(false);

  // Convert wallet balance from nanoMAS to MAS for display
  const walletBalanceMas = balance ? Number(balance) / 1_000_000_000 : 0;

  async function handleWithdrawMas(masAmount: number) {
    setPending(true);
    try {
      if (!connected) await connect();
      await requireNetwork();

      // Check wallet has enough MAS to pay transaction fees (0.01 MAS minimum)
      const feeRequired = 0.01; // Transaction fee in MAS
      if (walletBalanceMas < feeRequired) {
        throw new Error(
          `Insufficient wallet balance for transaction fee. Need at least ${feeRequired} MAS in wallet, but have ${walletBalanceMas.toFixed(
            4
          )} MAS.`
        );
      }

      const sc = getContract(VAULT);

      // Use simple withdraw function (no risk tiers in current contract)
      // Use parseUnits for precise conversion (avoid float precision issues)
      const shares = parseUnits(String(masAmount), 9); // bigint

      // Handle BigInt serialization safely
      const args = new Args();
      try {
        // Try BigInt first (preferred)
        args.addU64(shares);
      } catch {
        // Fallback: convert to Number only if safe
        if (shares > BigInt(Number.MAX_SAFE_INTEGER)) {
          throw new Error("Amount too large for this client version.");
        }
        args.addU64(BigInt(Number(shares)));
      }

      const op = await sc.call("withdraw", args, {
        fee: Mas.fromString("0.01"),
        maxGas: GAS_SAFE_CALL,
      });
      await assertFinalSuccess(op, "withdraw");

      // Parse events and apply optimistic updates
      const evts = await (op.getFinalEvents?.() ?? []);
      console.debug("[UI] Withdraw events:", evts);
      useVaultStore.getState().mutateAfterEvent(evts);

      // Refresh wallet balance
      await refreshBalance();

      // Force refetch vault stats to update TVL (bypass grace period)
      setTimeout(async () => {
        console.log("[WithdrawCard] Forcing TVL update after withdrawal...");
        await refetch(undefined, true); // Pass forceUpdate=true to bypass grace period
      }, 3000); // 3 second delay ensures blockchain is updated

      // Prevent immediate refetch from overriding optimistic update
      // Mark this transaction as recent to prevent blockchain override
      const store = useVaultStore.getState();
      (store as any).lastWithdrawTime = Date.now();

      console.debug(
        "[UI] Withdraw complete with optimistic update protection."
      );

      toast({
        title: "Withdrawal Confirmed",
        description: `Successfully withdrew ${masAmount} MAS`,
      });
      onWithdraw?.(masAmount);
    } catch (e) {
      console.error("Withdrawal failed:", e);
      toast({
        title: "Withdrawal Failed",
        description: e instanceof Error ? e.message : "Transaction failed",
        variant: "destructive",
      });
    } finally {
      setPending(false);
    }
  }

  return (
    <Card className="card-shadow">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-secondary/10">
            <ArrowUpRight className="h-4 w-4 text-secondary" />
          </div>
          Withdraw MAS
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-4">
        {!connected && (
          <div className="text-center py-8">
            <Wallet className="mx-auto h-12 w-12 text-muted-foreground mb-4" />
            <p className="text-muted-foreground">
              Connect your wallet to withdraw
            </p>
          </div>
        )}

        {connected && userBalanceMas === 0 && (
          <div className="text-center py-8">
            <ArrowLeft className="mx-auto h-12 w-12 text-muted-foreground mb-4" />
            <p className="text-muted-foreground">No shares to withdraw</p>
            <p className="text-xs text-muted-foreground mt-2">
              Make a deposit first to earn shares
            </p>
          </div>
        )}

        {connected && userBalanceMas > 0 && (
          <>
            <div className="space-y-2">
              <Label htmlFor="withdraw-amount">Amount to Withdraw (MAS)</Label>
              <div className="flex gap-2">
                <Input
                  id="withdraw-amount"
                  type="number"
                  placeholder="0.00"
                  value={amount}
                  onChange={(e) => setAmount(e.target.value)}
                  step="0.01"
                  min="0.01"
                />
                <Button
                  size="sm"
                  variant="outline"
                  onClick={() => setAmount(userBalanceMas.toString())}
                  className="h-8 px-2"
                >
                  Max
                </Button>
              </div>
              <p className="text-sm text-muted-foreground mb-4">
                Available: {userBalanceMas.toFixed(4)} MAS
              </p>
            </div>

            {amount && parseFloat(amount) > 0 && (
              <motion.div
                initial={{ opacity: 0, height: 0 }}
                animate={{ opacity: 1, height: "auto" }}
                className="space-y-3 rounded-lg bg-secondary/5 p-4"
              >
                <div className="text-sm space-y-2">
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">
                      Withdraw Amount:
                    </span>
                    <span className="font-medium">{amount} MAS</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">
                      Transaction Fee:
                    </span>
                    <span className="font-medium">~0.01 MAS</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">
                      Current Wallet:
                    </span>
                    <span className="font-medium">
                      {walletBalanceMas.toFixed(4)} MAS
                    </span>
                  </div>
                  <div className="flex justify-between border-t border-border/40 pt-2">
                    <span className="text-muted-foreground">
                      Remaining Vault:
                    </span>
                    <span className="font-medium">
                      {(userBalanceMas - parseFloat(amount || "0")).toFixed(4)}{" "}
                      MAS
                    </span>
                  </div>
                </div>
              </motion.div>
            )}

            {connected && walletBalanceMas < 0.01 && (
              <motion.div
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                className="p-3 bg-orange-50 border border-orange-200 rounded-lg"
              >
                <div className="flex items-center gap-2 text-sm text-orange-700">
                  <Wallet className="h-4 w-4" />
                  <span>
                    <strong>Low Wallet Balance:</strong> Need at least 0.01 MAS
                    in wallet for transaction fees. Current wallet:{" "}
                    {walletBalanceMas.toFixed(4)} MAS
                  </span>
                </div>
              </motion.div>
            )}

            <Button
              className="w-full bg-secondary hover:bg-secondary/90 text-secondary-foreground"
              onClick={() => handleWithdrawMas(parseFloat(amount))}
              disabled={
                !connected ||
                !amount ||
                parseFloat(amount) <= 0 ||
                parseFloat(amount) > userBalanceMas ||
                walletBalanceMas < 0.01 || // Need at least 0.01 MAS for transaction fee
                pending
              }
            >
              {pending ? (
                <>
                  <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                  Processing...
                </>
              ) : !connected ? (
                "Connect Wallet"
              ) : walletBalanceMas < 0.01 ? (
                "Insufficient Wallet Balance for Fees"
              ) : !amount || parseFloat(amount) <= 0 ? (
                "Enter Withdrawal Amount"
              ) : parseFloat(amount) > userBalanceMas ? (
                "Exceeds Vault Balance"
              ) : (
                "Withdraw from Pool"
              )}
            </Button>

            <p className="text-xs text-muted-foreground text-center">
              Instant withdrawals available anytime. No fees, no penalties.
            </p>
          </>
        )}
      </CardContent>
    </Card>
  );
}
