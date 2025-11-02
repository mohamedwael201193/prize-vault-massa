import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { useToast } from "@/components/ui/use-toast";
import { useWallet } from "@/hooks/useWallet";
import {
  approveToken,
  EAGLEFI_ROUTER,
  getSwapQuote,
  SwapQuote,
  swapTokens,
  TOKEN_ADDRESSES,
  validateSlippage,
} from "@/lib/dex/eaglefi";
import { motion } from "framer-motion";
import {
  AlertTriangle,
  ArrowDown,
  ArrowLeftRight,
  Info,
  Loader2,
  Settings,
} from "lucide-react";
import { useEffect, useState } from "react";

interface TokenOption {
  symbol: string;
  address: string;
  decimals: number;
  icon?: string;
}

const SUPPORTED_TOKENS: TokenOption[] = [
  { symbol: "MAS", address: TOKEN_ADDRESSES.MAS, decimals: 9 },
  { symbol: "USDC.s", address: TOKEN_ADDRESSES.USDC, decimals: 6 },
  { symbol: "WETH.s", address: TOKEN_ADDRESSES.WETH, decimals: 18 },
  { symbol: "WETH.bt", address: TOKEN_ADDRESSES["WETH.bt"], decimals: 18 },
  { symbol: "tDAI.s", address: TOKEN_ADDRESSES.DAI, decimals: 18 },
  { symbol: "USDT.bt", address: TOKEN_ADDRESSES.USDT, decimals: 6 },
  { symbol: "WBTC.s", address: TOKEN_ADDRESSES.WBTC, decimals: 8 },
];

export function SwapWidget() {
  const wallet = useWallet();
  const { toast } = useToast();
  const [tokenIn, setTokenIn] = useState<TokenOption>(SUPPORTED_TOKENS[1]); // USDC
  const [tokenOut, setTokenOut] = useState<TokenOption>(SUPPORTED_TOKENS[0]); // MAS
  const [amountIn, setAmountIn] = useState<string>("");
  const [quote, setQuote] = useState<SwapQuote | null>(null);
  const [loading, setLoading] = useState(false);
  const [swapping, setSwapping] = useState(false);
  const [slippage, setSlippage] = useState<number>(1); // 1%
  const [showSettings, setShowSettings] = useState(false);
  const [error, setError] = useState<string>("");

  // Fetch quote when amount or tokens change
  useEffect(() => {
    const fetchQuote = async () => {
      if (!amountIn || parseFloat(amountIn) === 0 || !wallet.connected) {
        setQuote(null);
        return;
      }

      try {
        setLoading(true);
        setError("");

        const amountInBigInt = BigInt(
          Math.floor(parseFloat(amountIn) * Math.pow(10, tokenIn.decimals))
        );

        const quoteData = await getSwapQuote(
          wallet.getContract,
          tokenIn.address,
          amountInBigInt,
          tokenOut.address,
          slippage * 100 // Convert to basis points
        );

        setQuote(quoteData);

        // Validate slippage
        const validation = validateSlippage(quoteData.priceImpact);
        if (!validation.valid && validation.warning) {
          setError(validation.warning);
        }
      } catch (err) {
        console.error("Failed to fetch quote:", err);
        setError("Failed to fetch swap quote");
      } finally {
        setLoading(false);
      }
    };

    const debounce = setTimeout(fetchQuote, 500);
    return () => clearTimeout(debounce);
  }, [amountIn, tokenIn, tokenOut, slippage, wallet.connected]);

  // Swap tokens
  const handleSwap = async () => {
    if (!wallet.connected || !quote) return;

    try {
      setSwapping(true);
      setError("");

      const amountInBigInt = BigInt(quote.amountIn);
      const minAmountOut = BigInt(quote.minimumAmountOut);
      const deadline = BigInt(Date.now() + 600_000); // 10 minutes

      // Approve token if not native MAS
      if (tokenIn.address !== TOKEN_ADDRESSES.MAS) {
        await approveToken(
          wallet.getContract,
          tokenIn.address,
          EAGLEFI_ROUTER,
          amountInBigInt
        );
      }

      // Execute swap
      const result = await swapTokens(wallet.getContract, {
        tokenIn: tokenIn.address,
        tokenInAmount: amountInBigInt,
        tokenOut: tokenOut.address,
        minAmountOut,
        deadline,
        recipient: wallet.address,
        slippageTolerance: slippage * 100,
      });

      // Show success toast
      toast({
        title: "✅ Swap Successful!",
        description: (
          <div className="space-y-2">
            <p className="text-sm">
              Swapped {amountIn} {tokenIn.symbol} →{" "}
              {(
                parseFloat(quote.amountOut) / Math.pow(10, tokenOut.decimals)
              ).toFixed(6)}{" "}
              {tokenOut.symbol}
            </p>
            <div className="flex flex-col gap-1">
              <span className="text-xs text-gray-400">Transaction ID:</span>
              <code className="text-xs bg-black/30 px-2 py-1 rounded border border-cyan-500/20 break-all select-all font-mono">
                {result.txId}
              </code>
              <span className="text-xs text-gray-500 italic">
                Click to select and copy
              </span>
            </div>
          </div>
        ),
        duration: 10000,
      });

      setAmountIn("");
      setQuote(null);
    } catch (err) {
      console.error("Swap failed:", err);
      const errorMessage = err instanceof Error ? err.message : "Swap failed";
      setError(errorMessage);

      // Show error toast
      toast({
        title: "❌ Swap Failed",
        description: errorMessage,
        variant: "destructive",
        duration: 5000,
      });
    } finally {
      setSwapping(false);
    }
  };

  // Flip tokens
  const handleFlipTokens = () => {
    setTokenIn(tokenOut);
    setTokenOut(tokenIn);
    setAmountIn("");
    setQuote(null);
  };

  return (
    <Card className="border-slate-800 bg-slate-900/50 backdrop-blur">
      <CardHeader>
        <div className="flex items-center justify-between">
          <CardTitle className="flex items-center gap-2">
            <ArrowLeftRight className="h-5 w-5 text-blue-400" />
            Token Swap
          </CardTitle>
          <Button
            variant="ghost"
            size="sm"
            onClick={() => setShowSettings(!showSettings)}
            className="h-8 w-8 p-0"
          >
            <Settings className="h-4 w-4" />
          </Button>
        </div>
      </CardHeader>
      <CardContent className="space-y-4">
        {/* Settings Panel */}
        {showSettings && (
          <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: "auto" }}
            className="p-4 bg-slate-800/50 rounded-lg space-y-3"
          >
            <div>
              <label className="text-sm text-slate-400 mb-2 block">
                Slippage Tolerance
              </label>
              <div className="flex gap-2">
                {[0.5, 1, 2, 5].map((value) => (
                  <Button
                    key={value}
                    variant={slippage === value ? "default" : "outline"}
                    size="sm"
                    onClick={() => setSlippage(value)}
                    className="flex-1"
                  >
                    {value}%
                  </Button>
                ))}
              </div>
            </div>
          </motion.div>
        )}

        {/* Token In */}
        <div className="space-y-2">
          <label className="text-sm text-slate-400">From</label>
          <div className="flex gap-2">
            <Input
              type="number"
              placeholder="0.0"
              value={amountIn}
              onChange={(e) => setAmountIn(e.target.value)}
              className="flex-1 bg-slate-800/50 border-slate-700 text-lg"
              disabled={!wallet.connected}
            />
            <Select
              value={tokenIn.symbol}
              onValueChange={(symbol) => {
                const token = SUPPORTED_TOKENS.find((t) => t.symbol === symbol);
                if (token) setTokenIn(token);
              }}
            >
              <SelectTrigger className="w-[120px] bg-slate-800/50 border-slate-700">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                {SUPPORTED_TOKENS.filter(
                  (t) => t.symbol !== tokenOut.symbol
                ).map((token) => (
                  <SelectItem key={token.symbol} value={token.symbol}>
                    {token.symbol}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
        </div>

        {/* Flip Button */}
        <div className="flex justify-center">
          <Button
            variant="ghost"
            size="sm"
            onClick={handleFlipTokens}
            className="h-10 w-10 rounded-full bg-slate-800 hover:bg-slate-700"
          >
            <ArrowDown className="h-5 w-5" />
          </Button>
        </div>

        {/* Token Out */}
        <div className="space-y-2">
          <label className="text-sm text-slate-400">To (estimated)</label>
          <div className="flex gap-2">
            <Input
              type="text"
              value={
                quote
                  ? (
                      Number(quote.amountOut) / Math.pow(10, tokenOut.decimals)
                    ).toFixed(6)
                  : "0.0"
              }
              readOnly
              className="flex-1 bg-slate-800/30 border-slate-700 text-lg text-slate-400"
            />
            <Select
              value={tokenOut.symbol}
              onValueChange={(symbol) => {
                const token = SUPPORTED_TOKENS.find((t) => t.symbol === symbol);
                if (token) setTokenOut(token);
              }}
            >
              <SelectTrigger className="w-[120px] bg-slate-800/50 border-slate-700">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                {SUPPORTED_TOKENS.filter(
                  (t) => t.symbol !== tokenIn.symbol
                ).map((token) => (
                  <SelectItem key={token.symbol} value={token.symbol}>
                    {token.symbol}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
        </div>

        {/* Quote Info */}
        {quote && (
          <motion.div
            initial={{ opacity: 0, y: -10 }}
            animate={{ opacity: 1, y: 0 }}
            className="p-3 bg-slate-800/50 rounded-lg space-y-2 text-sm"
          >
            <div className="flex justify-between text-slate-400">
              <span>Price Impact</span>
              <span
                className={
                  quote.priceImpact > 5 ? "text-yellow-400" : "text-green-400"
                }
              >
                {quote.priceImpact.toFixed(2)}%
              </span>
            </div>
            <div className="flex justify-between text-slate-400">
              <span>Minimum Received</span>
              <span>
                {(
                  Number(quote.minimumAmountOut) /
                  Math.pow(10, tokenOut.decimals)
                ).toFixed(6)}{" "}
                {tokenOut.symbol}
              </span>
            </div>
            <div className="flex justify-between text-slate-400">
              <span>Route</span>
              <span className="text-xs">{quote.route.length} hops</span>
            </div>
          </motion.div>
        )}

        {/* Error/Warning */}
        {error && (
          <div className="flex items-start gap-2 p-3 bg-yellow-500/10 border border-yellow-500/20 rounded-lg">
            <AlertTriangle className="h-5 w-5 text-yellow-400 flex-shrink-0 mt-0.5" />
            <p className="text-sm text-yellow-400">{error}</p>
          </div>
        )}

        {/* Info */}
        {!wallet.connected && (
          <div className="flex items-start gap-2 p-3 bg-blue-500/10 border border-blue-500/20 rounded-lg">
            <Info className="h-5 w-5 text-blue-400 flex-shrink-0 mt-0.5" />
            <p className="text-sm text-blue-400">
              Connect your wallet to swap tokens
            </p>
          </div>
        )}

        {/* Swap Button */}
        <Button
          onClick={handleSwap}
          disabled={
            !wallet.connected || !quote || swapping || loading || !!error
          }
          className="w-full bg-gradient-to-r from-blue-500 to-cyan-500 hover:from-blue-600 hover:to-cyan-600"
          size="lg"
        >
          {swapping ? (
            <>
              <Loader2 className="mr-2 h-5 w-5 animate-spin" />
              Swapping...
            </>
          ) : loading ? (
            <>
              <Loader2 className="mr-2 h-5 w-5 animate-spin" />
              Fetching Quote...
            </>
          ) : !wallet.connected ? (
            "Connect Wallet"
          ) : !quote ? (
            "Enter Amount"
          ) : (
            "Swap Tokens"
          )}
        </Button>
      </CardContent>
    </Card>
  );
}
