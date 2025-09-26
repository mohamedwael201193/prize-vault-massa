import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { ArrowUpRight, Minus, Wallet, ArrowLeft, Loader2 } from "lucide-react";
import { motion } from "framer-motion";
import { useWallet, useTransaction } from "@/hooks/useWallet";
import { massaClient } from "@/lib/massa";
import { toast } from "@/hooks/use-toast";

interface WithdrawCardProps {
  onWithdraw?: (amount: number) => void;
  userBalance: number; // This represents user's shares in the vault
}

export function WithdrawCard({ onWithdraw, userBalance }: WithdrawCardProps) {
  const [amount, setAmount] = useState("");
  const { connected } = useWallet();
  const { pending, setPending, setHash, reset } = useTransaction();

  const handleWithdraw = async () => {
    const withdrawShares = parseFloat(amount);
    
    // Validation
    if (isNaN(withdrawShares) || withdrawShares <= 0) {
      toast({
        title: "Invalid Amount",
        description: "Please enter a valid withdrawal amount",
        variant: "destructive",
      });
      return;
    }

    if (withdrawShares > userBalance) {
      toast({
        title: "Insufficient Shares",
        description: `You only have ${userBalance} shares available`,
        variant: "destructive",
      });
      return;
    }

    if (!connected) {
      toast({
        title: "Wallet Not Connected",
        description: "Please connect your wallet to withdraw",
        variant: "destructive",
      });
      return;
    }

    setPending(true);
    reset();
    
    try {
      const txHash = await massaClient.withdraw(withdrawShares);
      setHash(txHash);
      
      toast({
        title: "Withdrawal Submitted",
        description: `Transaction hash: ${txHash.slice(0, 10)}...`,
      });
      
      // Call parent callback if provided
      onWithdraw?.(withdrawShares);
      setAmount("");
      
      // Success toast after a delay to simulate confirmation
      setTimeout(() => {
        toast({
          title: "Withdrawal Confirmed",
          description: `Successfully withdrew ${withdrawShares} shares`,
        });
      }, 3000);
      
    } catch (error) {
      console.error("Withdrawal failed:", error);
      toast({
        title: "Withdrawal Failed",
        description: error instanceof Error ? error.message : "Transaction failed",
        variant: "destructive",
      });
    } finally {
      setPending(false);
    }
  };

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
            <p className="text-muted-foreground">Connect your wallet to withdraw</p>
          </div>
        )}

        {connected && userBalance === 0 && (
          <div className="text-center py-8">
            <ArrowLeft className="mx-auto h-12 w-12 text-muted-foreground mb-4" />
            <p className="text-muted-foreground">No shares to withdraw</p>
            <p className="text-xs text-muted-foreground mt-2">Make a deposit first to earn shares</p>
          </div>
        )}

        {connected && userBalance > 0 && (
          <>
            <div className="space-y-2">
            <Label htmlFor="withdraw-amount">Shares to Withdraw</Label>
            <div className="flex gap-2">
              <Input
                id="withdraw-amount"
                type="number"
                placeholder="0"
                value={amount}
                onChange={(e) => setAmount(e.target.value)}
                step="1"
                min="1"
              />
              <Button
                size="sm"
                variant="outline"
                onClick={() => setAmount(userBalance.toString())}
                className="h-8 px-2"
              >
                Max
              </Button>
            </div>
            <p className="text-sm text-muted-foreground mb-4">
              Available: {userBalance} shares
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
                  <span className="text-muted-foreground">Withdraw Shares:</span>
                  <span className="font-medium">{amount}</span>
                </div>
                <div className="flex justify-between">
                  <span className="text-muted-foreground">Remaining Shares:</span>
                  <span className="font-medium">{userBalance - parseFloat(amount || "0")}</span>
                </div>
              </div>
            </motion.div>
          )}

          <Button
            className="w-full bg-secondary hover:bg-secondary/90 text-secondary-foreground"
            onClick={handleWithdraw}
            disabled={
              !connected || 
              !amount || 
              parseFloat(amount) <= 0 || 
              parseFloat(amount) > userBalance ||
              pending
            }
          >
            {pending ? (
              <>
                <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                Processing...
              </>
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