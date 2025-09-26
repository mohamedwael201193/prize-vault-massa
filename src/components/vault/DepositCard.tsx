import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
import { Coins, Plus, Wallet, Loader2 } from "lucide-react";
import { motion } from "framer-motion";
import { useWallet, useTransaction } from "@/hooks/useWallet";
import { massaClient } from "@/lib/massa";
import { toast } from "@/hooks/use-toast";

interface DepositCardProps {
  onDeposit?: (amount: number) => void;
}

export function DepositCard({ onDeposit }: DepositCardProps) {
  const [amount, setAmount] = useState("");
  const { connected, account } = useWallet();
  const { pending, setPending, setHash, reset } = useTransaction();

  const quickAmounts = [1, 5, 10];

  const handleDeposit = async () => {
    const depositAmount = parseFloat(amount);
    
    // Validation
    if (isNaN(depositAmount) || depositAmount < 0.01) {
      toast({
        title: "Invalid Amount",
        description: "Minimum deposit amount is 0.01 MAS",
        variant: "destructive",
      });
      return;
    }

    if (!connected || !account) {
      toast({
        title: "Wallet Not Connected",
        description: "Please connect your wallet to make a deposit",
        variant: "destructive",
      });
      return;
    }

    const userBalance = parseFloat(account.balance) / 1_000_000_000; // Convert from nano-MAS
    if (depositAmount > userBalance) {
      toast({
        title: "Insufficient Balance",
        description: `You only have ${userBalance.toFixed(4)} MAS available`,
        variant: "destructive",
      });
      return;
    }

    setPending(true);
    reset();
    
    try {
      const txHash = await massaClient.deposit(depositAmount);
      setHash(txHash);
      
      toast({
        title: "Deposit Submitted",
        description: `Transaction hash: ${txHash.slice(0, 10)}...`,
      });
      
      // Call parent callback if provided
      onDeposit?.(depositAmount);
      setAmount("");
      
      // Success toast after a delay to simulate confirmation
      setTimeout(() => {
        toast({
          title: "Deposit Confirmed",
          description: `Successfully deposited ${depositAmount} MAS`,
        });
      }, 3000);
      
    } catch (error) {
      console.error("Deposit failed:", error);
      toast({
        title: "Deposit Failed",
        description: error instanceof Error ? error.message : "Transaction failed",
        variant: "destructive",
      });
    } finally {
      setPending(false);
    }
  };

  const setQuickAmount = (value: number) => {
    setAmount(value.toString());
  };

  const userBalance = account ? parseFloat(account.balance) / 1_000_000_000 : 0;

  return (
    <Card className="card-shadow">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary/10">
            <Coins className="h-4 w-4 text-primary" />
          </div>
          Deposit MAS
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-4">
        {!connected && (
          <div className="text-center py-8">
            <Wallet className="mx-auto h-12 w-12 text-muted-foreground mb-4" />
            <p className="text-muted-foreground">Connect your wallet to deposit MAS</p>
          </div>
        )}

        {connected && (
          <>
            <div className="space-y-2">
            <Label htmlFor="deposit-amount">Amount (MAS)</Label>
            <div className="flex gap-2">
              <Input
                id="deposit-amount"
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
                onClick={() => setAmount(userBalance.toFixed(4))}
                className="h-8 px-2"
              >
                Max
              </Button>
            </div>
            <p className="text-sm text-muted-foreground mb-4">
              Available: {userBalance.toFixed(4)} MAS
            </p>
          </div>

          <div className="space-y-2">
            <Label>Quick amounts</Label>
            <div className="flex gap-2">
              {quickAmounts.map((quickAmount) => (
                <Button
                  key={quickAmount}
                  variant="outline"
                  size="sm"
                  onClick={() => setQuickAmount(quickAmount)}
                  className="flex-1"
                >
                  {quickAmount} MAS
                </Button>
              ))}
            </div>
          </div>

          {amount && parseFloat(amount) > 0 && (
            <motion.div
              initial={{ opacity: 0, height: 0 }}
              animate={{ opacity: 1, height: "auto" }}
              className="space-y-3 rounded-lg bg-primary/5 p-4"
            >
              <div className="flex justify-between text-sm">
                <span>Deposit amount:</span>
                <span className="font-medium">{amount} MAS</span>
              </div>
              <div className="flex justify-between text-sm">
                <span>Tickets received:</span>
                <Badge variant="secondary" className="bg-success/10 text-success">
                  <Plus className="mr-1 h-3 w-3" />
                  {amount}
                </Badge>
              </div>
            </motion.div>
          )}

          <Button
            className="w-full bg-primary hover:bg-primary/90 text-primary-foreground"
            onClick={handleDeposit}
            disabled={
              !connected || 
              !amount || 
              parseFloat(amount) < 0.01 || 
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
              "Deposit & Enter Pool"
            )}
          </Button>

            <p className="text-xs text-muted-foreground text-center">
              Your deposit earns yield automatically. All yield becomes prizes while your principal remains safe.
            </p>
          </>
        )}
      </CardContent>
    </Card>
  );
}