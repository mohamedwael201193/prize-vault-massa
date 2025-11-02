import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { RISK_TIERS } from "@/config/riskTiers";
import { getEnabledTokens } from "@/config/tokens";
import { toast } from "@/hooks/use-toast";
import { useWallet } from "@/hooks/useWallet";
import { GAS_SAFE_CALL } from "@/lib/gas";
import { assertFinalSuccess } from "@/lib/ops";
import { getVaultAddr } from "@/lib/sanity";
import { useVaultStore } from "@/state/vaultStore";
import { Args, Mas } from "@massalabs/massa-web3";
import { motion } from "framer-motion";
import {
  ArrowRight,
  Coins,
  ExternalLink,
  Loader2,
  RefreshCw,
  TrendingUp,
} from "lucide-react";
import { useEffect, useState } from "react";

const VAULT = getVaultAddr();

// Use real bridged tokens from Massa Bridge
const SUPPORTED_TOKENS = getEnabledTokens();

interface MultiTokenDepositProps {
  selectedRiskTier: string;
  onDeposit?: (amount: number) => void;
}

export function MultiTokenDeposit({
  selectedRiskTier,
  onDeposit,
}: MultiTokenDepositProps) {
  const { connected, connect, getContract, refreshBalance, requireNetwork } =
    useWallet();
  const refetch = useVaultStore((s) => s.refetch);
  const [pending, setPending] = useState(false);
  const [loadingQuote, setLoadingQuote] = useState(false);

  const [selectedToken, setSelectedToken] = useState("MAS");
  const [amount, setAmount] = useState("");
  const [estimatedMAS, setEstimatedMAS] = useState("0");
  const [slippage, setSlippage] = useState(1); // 1% default slippage

  const selectedTier =
    RISK_TIERS.find((t) => t.id === selectedRiskTier) || RISK_TIERS[0];

  // Get quote when amount or token changes
  useEffect(() => {
    if (selectedToken === "MAS") {
      setEstimatedMAS(amount || "0");
      return;
    }

    if (!amount || parseFloat(amount) <= 0) {
      setEstimatedMAS("0");
      return;
    }

    const fetchQuote = async () => {
      setLoadingQuote(true);
      try {
        // Mock quote for now - will be replaced with actual DEX integration
        const inputAmount = parseFloat(amount);
        // Assume 1 USDC = 0.1 MAS (mock rate)
        const mockRate = selectedToken === "USDC" ? 0.1 : 0.05;
        const estimated = inputAmount * mockRate;
        setEstimatedMAS(estimated.toFixed(4));
      } catch (error) {
        console.error("Failed to get quote:", error);
        setEstimatedMAS("0");
      } finally {
        setLoadingQuote(false);
      }
    };

    const debounce = setTimeout(fetchQuote, 500);
    return () => clearTimeout(debounce);
  }, [amount, selectedToken]);

  async function handleDeposit() {
    if (!amount || parseFloat(amount) <= 0) {
      toast({
        title: "Invalid Amount",
        description: "Please enter a valid amount",
        variant: "destructive",
      });
      return;
    }

    setPending(true);
    try {
      if (!connected) await connect();
      await requireNetwork();

      const contractAddr = getVaultAddr();
      const sc = getContract(contractAddr);

      // Determine which tier function to call
      let depositFunction = "depositConservative";
      if (selectedRiskTier === "moderate") depositFunction = "depositModerate";
      else if (selectedRiskTier === "aggressive")
        depositFunction = "depositAggressive";

      let masAmount;

      // If depositing non-MAS token, need to convert first
      if (selectedToken !== "MAS") {
        // Get token configuration
        const tokenConfig = SUPPORTED_TOKENS.find(
          (t) => t.symbol === selectedToken
        );

        if (!tokenConfig) {
          toast({
            title: "Invalid Token",
            description: "Token configuration not found",
            variant: "destructive",
          });
          setPending(false);
          return;
        }

        toast({
          title: "Multi-Token Support Coming Soon",
          description: `${selectedToken} deposits require DEX integration. Use MAS directly or bridge your tokens to MAS first at bridge.buildnet.massa.net`,
        });
        setPending(false);
        return;
      } else {
        // Direct MAS deposit
        masAmount = Mas.fromString(amount);
      }

      // Call tier-specific deposit function
      const op = await sc.call(depositFunction, new Args(), {
        coins: masAmount,
        fee: Mas.fromString("0.01"),
        maxGas: GAS_SAFE_CALL,
      });

      await assertFinalSuccess(op, "deposit");

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

      // Force refetch vault stats to update TVL (bypass grace period by waiting)
      setTimeout(async () => {
        await refetch();
      }, 3000); // 3 second delay ensures blockchain is updated

      toast({
        title: "🎉 Deposit Successful!",
        description: `Deposited ${amount} ${selectedToken} to ${selectedTier.name} tier`,
      });
      onDeposit?.(parseFloat(amount));
      setAmount("");
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

  if (!connected) {
    return (
      <Card className="border-2 border-slate-700/50 bg-slate-900/80 backdrop-blur-xl">
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Coins className="h-5 w-5 text-electric-blue-400" />
            Multi-Token Deposit
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="text-center py-6">
            <p className="text-slate-400 mb-4">
              Connect your wallet to deposit
            </p>
            <Button
              onClick={connect}
              size="lg"
              className="w-full bg-gradient-to-r from-cyber-purple-600 to-electric-blue-600 hover:from-cyber-purple-500 hover:to-electric-blue-500"
            >
              Connect Wallet
            </Button>
          </div>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card className="border-2 border-slate-700/50 bg-slate-900/80 backdrop-blur-xl">
      <CardHeader>
        <div className="flex items-center justify-between">
          <CardTitle className="flex items-center gap-2">
            <Coins className="h-5 w-5 text-electric-blue-400" />
            Multi-Token Deposit
          </CardTitle>
          <Badge variant="secondary" className={`${selectedTier.color}`}>
            {selectedTier.icon} {selectedTier.name}
          </Badge>
        </div>
        <p className="text-sm text-slate-400">
          Deposit any supported bridged token from Ethereum or BSC
        </p>
      </CardHeader>
      <CardContent className="space-y-4">
        {/* Token Selector */}
        <div className="space-y-2">
          <Label>Select Token</Label>
          <Select value={selectedToken} onValueChange={setSelectedToken}>
            <SelectTrigger className="bg-slate-800/50 border-slate-700">
              <SelectValue />
            </SelectTrigger>
            <SelectContent>
              {SUPPORTED_TOKENS.map((token) => (
                <SelectItem key={token.symbol} value={token.symbol}>
                  <span className="flex items-center gap-2">
                    <span>{token.icon}</span>
                    <span>{token.symbol}</span>
                    <span className="text-slate-400 text-xs">
                      - {token.name}
                    </span>
                    {token.origin &&
                      (token.origin === "ethereum" ||
                        token.origin === "bsc") && (
                        <Badge
                          variant="outline"
                          className="text-[10px] px-1 py-0 h-4"
                        >
                          {token.origin}
                        </Badge>
                      )}
                  </span>
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
          <p className="text-xs text-slate-500">
            All tokens bridged via{" "}
            <a
              href="https://bridge.buildnet.massa.net"
              target="_blank"
              rel="noopener noreferrer"
              className="text-electric-blue-400 hover:underline inline-flex items-center gap-1"
            >
              Massa Bridge <ExternalLink className="h-3 w-3" />
            </a>
          </p>
        </div>

        {/* Amount Input */}
        <div className="space-y-2">
          <Label>Amount</Label>
          <div className="relative">
            <Input
              type="number"
              step="0.01"
              min="0"
              placeholder={`Enter ${selectedToken} amount...`}
              value={amount}
              onChange={(e) => setAmount(e.target.value)}
              className="bg-slate-800/50 border-slate-700 pr-16"
            />
            <span className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 text-sm font-medium">
              {selectedToken}
            </span>
          </div>
        </div>

        {/* Conversion Display */}
        {selectedToken !== "MAS" && amount && parseFloat(amount) > 0 && (
          <motion.div
            initial={{ opacity: 0, y: -10 }}
            animate={{ opacity: 1, y: 0 }}
            className="p-4 rounded-xl bg-gradient-to-r from-electric-blue-500/10 to-cyber-purple-500/10 border border-electric-blue-500/30"
          >
            <div className="flex items-center justify-between mb-2">
              <span className="text-sm text-slate-400">You will receive</span>
              {loadingQuote && (
                <RefreshCw className="h-4 w-4 text-electric-blue-400 animate-spin" />
              )}
            </div>
            <div className="flex items-center gap-2">
              <TrendingUp className="h-5 w-5 text-electric-blue-400" />
              <span className="text-2xl font-bold text-white">
                ~{estimatedMAS} MAS
              </span>
            </div>
            <p className="text-xs text-slate-500 mt-2">
              Estimated with {slippage}% slippage tolerance
            </p>
          </motion.div>
        )}

        {/* Tier Info */}
        <div className="grid grid-cols-2 gap-3 p-3 rounded-xl bg-slate-800/30">
          <div>
            <p className="text-xs text-slate-500">Expected APY</p>
            <p className="text-sm font-bold text-electric-blue-400">
              {selectedTier.expectedAPY}
            </p>
          </div>
          <div>
            <p className="text-xs text-slate-500">Prize Multiplier</p>
            <p className="text-sm font-bold text-hot-pink-400">
              {selectedTier.prizeMultiplier}x
            </p>
          </div>
        </div>

        {/* Deposit Button */}
        <Button
          onClick={handleDeposit}
          disabled={!amount || parseFloat(amount) <= 0 || pending}
          size="lg"
          className="w-full bg-gradient-to-r from-cyber-purple-600 to-electric-blue-600 hover:from-cyber-purple-500 hover:to-electric-blue-500 font-bold"
        >
          {pending ? (
            <>
              <Loader2 className="mr-2 h-5 w-5 animate-spin" />
              Processing...
            </>
          ) : (
            <>
              Deposit to {selectedTier.name}
              <ArrowRight className="ml-2 h-5 w-5" />
            </>
          )}
        </Button>

        {selectedToken !== "MAS" && (
          <div className="p-3 rounded-lg bg-slate-800/30 border border-slate-700/50">
            <p className="text-xs text-slate-400 text-center">
              💡 Multi-token support coming soon! For now, bridge your tokens to
              MAS at{" "}
              <a
                href="https://bridge.buildnet.massa.net"
                target="_blank"
                rel="noopener noreferrer"
                className="text-electric-blue-400 hover:underline"
              >
                bridge.buildnet.massa.net
              </a>
            </p>
          </div>
        )}
      </CardContent>
    </Card>
  );
}
