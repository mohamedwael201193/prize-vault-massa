import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
import { Coins, Plus } from "lucide-react";
import { motion } from "framer-motion";

interface DepositCardProps {
  onDeposit: (amount: number) => void;
  isWalletConnected: boolean;
  userBalance: number;
}

export function DepositCard({ onDeposit, isWalletConnected, userBalance }: DepositCardProps) {
  const [amount, setAmount] = useState("");
  const [isLoading, setIsLoading] = useState(false);

  const quickAmounts = [1, 5, 10];

  const handleDeposit = async () => {
    if (!amount || !isWalletConnected) return;

    const depositAmount = parseFloat(amount);
    if (depositAmount <= 0 || depositAmount > userBalance) return;

    setIsLoading(true);
    
    // Simulate transaction delay
    setTimeout(() => {
      onDeposit(depositAmount);
      setAmount("");
      setIsLoading(false);
    }, 2000);
  };

  const setQuickAmount = (value: number) => {
    setAmount(value.toString());
  };

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
        {!isWalletConnected && (
          <div className="rounded-lg bg-muted/50 p-4 text-center">
            <p className="text-sm text-muted-foreground">
              Connect your wallet to start depositing
            </p>
          </div>
        )}

        <div className="space-y-2">
          <Label htmlFor="deposit-amount">Amount (MAS)</Label>
          <Input
            id="deposit-amount"
            type="number"
            placeholder="0.00"
            value={amount}
            onChange={(e) => setAmount(e.target.value)}
            disabled={!isWalletConnected}
          />
          <div className="flex justify-between items-center">
            <span className="text-sm text-muted-foreground">
              Available: {userBalance} MAS
            </span>
            <Button
              variant="ghost"
              size="sm"
              onClick={() => setAmount(userBalance.toString())}
              disabled={!isWalletConnected}
            >
              Max
            </Button>
          </div>
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
                disabled={!isWalletConnected}
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
          onClick={handleDeposit}
          disabled={!isWalletConnected || !amount || parseFloat(amount) <= 0 || isLoading}
          className="w-full"
          size="lg"
        >
          {isLoading ? "Depositing..." : "Deposit & Enter Pool"}
        </Button>

        <p className="text-xs text-muted-foreground text-center">
          Your deposit earns yield automatically. All yield becomes prizes while your principal remains safe.
        </p>
      </CardContent>
    </Card>
  );
}