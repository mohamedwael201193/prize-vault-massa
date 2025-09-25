import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { ArrowUpRight, Minus } from "lucide-react";
import { motion } from "framer-motion";

interface WithdrawCardProps {
  onWithdraw: (amount: number) => void;
  userBalance: number;
  isWalletConnected: boolean;
}

export function WithdrawCard({ onWithdraw, userBalance, isWalletConnected }: WithdrawCardProps) {
  const [amount, setAmount] = useState("");
  const [isLoading, setIsLoading] = useState(false);

  const handleWithdraw = async () => {
    if (!amount || !isWalletConnected) return;

    const withdrawAmount = parseFloat(amount);
    if (withdrawAmount <= 0 || withdrawAmount > userBalance) return;

    setIsLoading(true);
    
    // Simulate transaction delay
    setTimeout(() => {
      onWithdraw(withdrawAmount);
      setAmount("");
      setIsLoading(false);
    }, 2000);
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
        {!isWalletConnected && (
          <div className="rounded-lg bg-muted/50 p-4 text-center">
            <p className="text-sm text-muted-foreground">
              Connect your wallet to withdraw funds
            </p>
          </div>
        )}

        {userBalance === 0 && isWalletConnected && (
          <div className="rounded-lg bg-muted/50 p-4 text-center">
            <p className="text-sm text-muted-foreground">
              No funds to withdraw. Make a deposit first.
            </p>
          </div>
        )}

        <div className="space-y-2">
          <Label htmlFor="withdraw-amount">Amount (MAS)</Label>
          <Input
            id="withdraw-amount"
            type="number"
            placeholder="0.00"
            value={amount}
            onChange={(e) => setAmount(e.target.value)}
            disabled={!isWalletConnected || userBalance === 0}
          />
          <div className="flex justify-between items-center">
            <span className="text-sm text-muted-foreground">
              Deposited: {userBalance} MAS
            </span>
            <Button
              variant="ghost"
              size="sm"
              onClick={() => setAmount(userBalance.toString())}
              disabled={!isWalletConnected || userBalance === 0}
            >
              Max
            </Button>
          </div>
        </div>

        {amount && parseFloat(amount) > 0 && (
          <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: "auto" }}
            className="space-y-3 rounded-lg bg-secondary/5 p-4"
          >
            <div className="flex justify-between text-sm">
              <span>Withdraw amount:</span>
              <span className="font-medium">{amount} MAS</span>
            </div>
            <div className="flex justify-between text-sm">
              <span>Lost tickets:</span>
              <span className="text-destructive flex items-center">
                <Minus className="mr-1 h-3 w-3" />
                {amount}
              </span>
            </div>
          </motion.div>
        )}

        <Button
          onClick={handleWithdraw}
          disabled={!isWalletConnected || !amount || parseFloat(amount) <= 0 || userBalance === 0 || isLoading}
          variant="outline"
          className="w-full"
          size="lg"
        >
          {isLoading ? "Withdrawing..." : "Withdraw Funds"}
        </Button>

        <p className="text-xs text-muted-foreground text-center">
          Instant withdrawals available anytime. No fees, no penalties.
        </p>
      </CardContent>
    </Card>
  );
}