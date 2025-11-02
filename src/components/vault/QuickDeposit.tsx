import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { RISK_TIERS } from "@/config/riskTiers";
import { toast } from "@/hooks/use-toast";
import { useWallet } from "@/hooks/useWallet";
import { GAS_SAFE_CALL } from "@/lib/gas";
import { assertFinalSuccess } from "@/lib/ops";
import { getVaultAddr } from "@/lib/sanity";
import { useVaultStore } from "@/state/vaultStore";
import { Args, Mas } from "@massalabs/massa-web3";
import { ArrowRight, Loader2, Shield, TrendingUp, Zap } from "lucide-react";
import { useState } from "react";

const VAULT = getVaultAddr();

// Quick deposit amounts based on risk tolerance
const QUICK_AMOUNTS = [
  {
    amount: 1,
    label: "Try it",
    tier: "conservative",
    icon: "🆕",
    description: "Perfect for first-time users",
  },
  {
    amount: 10,
    label: "Standard",
    tier: "moderate",
    icon: "💰",
    description: "Most popular choice",
  },
  {
    amount: 50,
    label: "Boost",
    tier: "aggressive",
    icon: "🚀",
    description: "For serious participants",
  },
];

interface QuickDepositProps {
  selectedRiskTier: string;
  onDeposit?: (amount: number) => void;
}

export function QuickDeposit({
  selectedRiskTier,
  onDeposit,
}: QuickDepositProps) {
  const { connected, connect, getContract, refreshBalance, requireNetwork } =
    useWallet();
  const refetch = useVaultStore((s) => s.refetch);
  const [pending, setPending] = useState<number | null>(null);
  const [customAmount, setCustomAmount] = useState<string>("");

  const selectedTier =
    RISK_TIERS.find((t) => t.id === selectedRiskTier) || RISK_TIERS[0];

  async function handleQuickDeposit(masNumber: number) {
    setPending(masNumber);
    try {
      if (!connected) await connect();
      await requireNetwork();

      const contractAddr = getVaultAddr();
      const sc = getContract(contractAddr);

      // Call tier-specific deposit function based on selected tier
      let depositFunction = "depositConservative";
      if (selectedRiskTier === "moderate") {
        depositFunction = "depositModerate";
      } else if (selectedRiskTier === "aggressive") {
        depositFunction = "depositAggressive";
      }

      const op = await sc.call(depositFunction, new Args(), {
        coins: Mas.fromString(String(masNumber)),
        fee: Mas.fromString("0.01"),
        maxGas: GAS_SAFE_CALL,
      });
      await assertFinalSuccess(op, depositFunction);

      // Parse events and apply optimistic updates
      const evts = await (op.getFinalEvents?.() ?? []);
      useVaultStore.getState().mutateAfterEvent(evts);

      // Store first deposit time for metrics
      const address = (window as any).massa?.account?.address;
      if (
        address &&
        !localStorage.getItem(`autoprize-first-deposit-${address}`)
      ) {
        localStorage.setItem(
          `autoprize-first-deposit-${address}`,
          Date.now().toString()
        );
      }

      await refreshBalance();

      // Force refetch vault stats to update TVL (bypass grace period)
      setTimeout(async () => {
        console.log("[QuickDeposit] Forcing TVL update after deposit...");
        await refetch(undefined, true); // Pass forceUpdate=true to bypass grace period
      }, 3000); // 3 second delay ensures blockchain is updated

      toast({
        title: "🎉 Deposit Confirmed!",
        description: `${masNumber} MAS deposited successfully`,
      });
      onDeposit?.(masNumber);
    } catch (e) {
      console.error("Quick deposit failed:", e);
      toast({
        title: "Deposit Failed",
        description: e instanceof Error ? e.message : "Transaction failed",
        variant: "destructive",
      });
    } finally {
      setPending(null);
    }
  }

  if (!connected) {
    return (
      <Card className="border-2 border-primary/20 bg-gradient-to-br from-primary/5 to-secondary/5">
        <CardHeader className="text-center">
          <CardTitle className="flex items-center justify-center gap-2 text-xl">
            <Zap className="h-6 w-6 text-primary" />
            Quick Start - 3 Easy Steps
          </CardTitle>
          <p className="text-muted-foreground">
            Get started in seconds with our streamlined onboarding
          </p>
        </CardHeader>
        <CardContent className="space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-center">
            <div className="flex flex-col items-center space-y-2">
              <div className="flex h-8 w-8 items-center justify-center rounded-full bg-blue-100 text-blue-600 font-bold">
                1
              </div>
              <p className="font-medium">Connect Wallet</p>
              <p className="text-sm text-muted-foreground">
                Link your Massa wallet
              </p>
            </div>
            <div className="flex flex-col items-center space-y-2">
              <div className="flex h-8 w-8 items-center justify-center rounded-full bg-green-100 text-green-600 font-bold">
                2
              </div>
              <p className="font-medium">Choose Amount</p>
              <p className="text-sm text-muted-foreground">
                Pick quick deposit option
              </p>
            </div>
            <div className="flex flex-col items-center space-y-2">
              <div className="flex h-8 w-8 items-center justify-center rounded-full bg-purple-100 text-purple-600 font-bold">
                3
              </div>
              <p className="font-medium">Start Earning</p>
              <p className="text-sm text-muted-foreground">
                Watch your rewards grow
              </p>
            </div>
          </div>

          <Button onClick={connect} size="lg" className="w-full">
            <ArrowRight className="mr-2 h-5 w-5" />
            Connect Wallet & Start Earning
          </Button>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card className="border-2 border-primary/20 bg-gradient-to-br from-primary/5 to-secondary/5">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <Zap className="h-5 w-5 text-primary" />
          Quick Deposit
          <Badge variant="secondary" className="ml-auto">
            {selectedTier.icon} {selectedTier.name}
          </Badge>
        </CardTitle>
        <div className="grid grid-cols-3 gap-2 text-sm">
          <div className="flex items-center gap-1">
            <Shield className="h-3 w-3 text-green-500" />
            <span>{selectedTier.protectionLevel}% Protected</span>
          </div>
          <div className="flex items-center gap-1">
            <TrendingUp className="h-3 w-3 text-blue-500" />
            <span>{selectedTier.expectedAPY} APY</span>
          </div>
          <div className="text-right">
            <span className="text-primary font-medium">
              {selectedTier.prizeMultiplier}x Prizes
            </span>
          </div>
        </div>
      </CardHeader>
      <CardContent>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-3">
          {QUICK_AMOUNTS.map((option) => (
            <Button
              key={option.amount}
              variant={pending === option.amount ? "default" : "outline"}
              disabled={pending !== null}
              onClick={() => handleQuickDeposit(option.amount)}
              className="h-auto p-4 flex flex-col items-center space-y-2 hover:shadow-lg transition-all"
            >
              {pending === option.amount ? (
                <Loader2 className="h-6 w-6 animate-spin" />
              ) : (
                <span className="text-2xl">{option.icon}</span>
              )}
              <div className="text-center">
                <div className="font-bold">{option.amount} MAS</div>
                <div className="text-xs text-muted-foreground">
                  {option.label}
                </div>
                <div className="text-xs opacity-75">{option.description}</div>
              </div>
            </Button>
          ))}
        </div>

        {/* Custom Amount Input */}
        <div className="mt-6 space-y-3 pt-6 border-t">
          <div className="text-sm font-medium text-center">
            Or enter custom amount:
          </div>
          <div className="flex gap-2">
            <Input
              type="number"
              placeholder="Enter amount (MAS)"
              value={customAmount}
              onChange={(e) => setCustomAmount(e.target.value)}
              min="0.1"
              step="0.1"
              className="text-lg"
              disabled={pending !== null}
            />
            <Button
              onClick={() => {
                const amount = parseFloat(customAmount);
                if (amount > 0) {
                  handleQuickDeposit(amount);
                  setCustomAmount("");
                } else {
                  toast({
                    title: "Invalid Amount",
                    description: "Please enter a valid amount greater than 0",
                    variant: "destructive",
                  });
                }
              }}
              disabled={
                pending !== null ||
                !customAmount ||
                parseFloat(customAmount) <= 0
              }
              className="px-8"
            >
              {pending !== null && parseFloat(customAmount) === pending ? (
                <Loader2 className="h-4 w-4 animate-spin" />
              ) : (
                "Deposit"
              )}
            </Button>
          </div>
          <p className="text-xs text-center text-muted-foreground">
            Minimum deposit: 0.1 MAS
          </p>
        </div>

        <div className="mt-4 p-3 bg-secondary/20 rounded-lg">
          <p className="text-sm text-center">
            <span className="font-medium">Expected Monthly Return:</span>{" "}
            <span className="text-primary font-bold">
              {(
                (parseFloat(selectedTier.expectedAPY.split("-")[0]) / 12) *
                10
              ).toFixed(1)}
              % -
              {(
                (parseFloat(
                  selectedTier.expectedAPY.split("-")[1] ||
                    selectedTier.expectedAPY
                ) /
                  12) *
                10
              ).toFixed(1)}
              %
            </span>{" "}
            on 10 MAS deposit
          </p>
        </div>
      </CardContent>
    </Card>
  );
}
