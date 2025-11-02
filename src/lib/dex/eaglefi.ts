import { Args, Mas, SmartContract } from "@massalabs/massa-web3";

// EagleFi DEX Contract Addresses (Massa BuildNet)
// Updated to match working addresses from piggybank project
export const EAGLEFI_ROUTER =
  "AS1Kf2KVdYghv9PeVcgQKVBpuVAqdvfwwMbGuffByxJbSMLqLvVo";
export const EAGLEFI_FACTORY =
  "AS12AhgNHNydcESphMopqWzcRbwZKfeGpvH17vh9xejnEySDWiagC";

// Token Addresses on Massa BuildNet (from actual wallet)
export const TOKEN_ADDRESSES = {
  MAS: "AS12U4TZfNK7qoLyEERBBRDMu8nm5MKoRzPXDXans4v9wdATZedz9",
  USDC: "AS12k8viVmqPtRuXzCm6rKXjLgpQWqbuMjc37YHhB452KSUUb9FgL", // Sepolia USDC (USDC.s)
  WETH: "AS1gt69gqYD92dqPyE6DBRJ7KjpnQHqFzFs2YCkBcSnuxX5bGhBC", // sepolia WETH (WETH.s)
  "WETH.bt": "AS12RmCXTA9NZaTBUBnRJuH66AGNmtEfEoqXKxLdmrTybS6GFJPFs", // Wrapped Ether (WETH.bt)
  DAI: "AS12LpYyAjYRJfYhyu7fkrS224gMdvFHVEeVWoeHZzMdhis7UZ3Eb", // Sepolia tDAI (tDAI.s)
  USDT: "AS12ix1Qfpue7BB8q6mWVtjNdNE9UV3x4MaUo7WhdUubov8sJ3CuP", // Wrapped Binance USD (USDT.bt)
  WBTC: "AS1ZXy3nvqXAMm2w6viAg7frte6cZfJM8hoMvWf4KoKDzvLzYKqE", // Sepolia WBTC (WBTC.s)
  WMAS: "AS12U4TZfNK7qoLyEERBBRDMu8nm5MKoRzPXDXans4v9wdATZedz9", // Same as MAS
};

// Legacy exports for backward compatibility
export const USDC_TOKEN = TOKEN_ADDRESSES.USDC;
export const WMAS_TOKEN = TOKEN_ADDRESSES.WMAS;

export interface SwapParams {
  tokenIn: string;
  tokenInAmount: bigint;
  tokenOut: string;
  minAmountOut: bigint;
  deadline: bigint;
  recipient: string;
  slippageTolerance?: number; // in basis points (100 = 1%)
}

export interface SwapResult {
  amountOut: bigint;
  txId: string;
  priceImpact?: number;
}

export interface SwapQuote {
  amountIn: string;
  amountOut: string;
  priceImpact: number;
  route: string[];
  minimumAmountOut: string;
}

/**
 * Swap tokens via EagleFi DEX
 */
export async function swapTokens(
  getContract: (address: string) => SmartContract,
  params: SwapParams
): Promise<SwapResult> {
  const router = getContract(EAGLEFI_ROUTER);

  try {
    // Build swap arguments
    const swapArgs = new Args()
      .addString(params.tokenIn)
      .addU64(params.tokenInAmount)
      .addString(params.tokenOut)
      .addU64(params.minAmountOut)
      .addU64(params.deadline)
      .addString(params.recipient);

    // Execute swap
    const op = await router.call("swapExactTokensForTokens", swapArgs, {
      fee: Mas.fromString("0.01"),
      maxGas: BigInt(2_000_000_000),
    });

    // Wait for confirmation
    const events = await op.getFinalEvents();
    const swapEvent = events.find(
      (e: any) => e.data && e.data.includes("swap:")
    );

    let amountOut = BigInt(0);
    if (swapEvent) {
      const parts = swapEvent.data.split(":");
      amountOut = BigInt(parts[parts.length - 1] || "0");
    }

    return {
      amountOut,
      txId: op.id,
    };
  } catch (error) {
    console.error("Swap failed:", error);
    throw new Error(`Token swap failed: ${error}`);
  }
}

/**
 * Get quote for token swap with price impact calculation
 */
export async function getSwapQuote(
  getContract: (address: string) => SmartContract,
  tokenIn: string,
  amountIn: bigint,
  tokenOut: string,
  slippageTolerance: number = 100 // 1% default
): Promise<SwapQuote> {
  const router = getContract(EAGLEFI_ROUTER);

  try {
    // Build route - direct or through MAS for better liquidity
    const route = calculateOptimalRoute(tokenIn, tokenOut);

    const quoteArgs = new Args().addU256(amountIn);
    // Add each address in route separately
    route.forEach((addr) => quoteArgs.addString(addr));

    const result = await router.read("getAmountsOut", quoteArgs);

    // Parse the result - it's an object with returnValue property
    let amounts: any;
    if (typeof result === "string") {
      amounts = JSON.parse(result);
    } else if (result && typeof result === "object") {
      // ReadSCData object - extract the actual data
      amounts = (result as any).returnValue || result;
      if (typeof amounts === "string") {
        amounts = JSON.parse(amounts);
      }
    } else {
      throw new Error("Unexpected result format from router");
    }

    console.log("[EagleFi] Router response:", { result, amounts, route });

    // Validate amounts array
    if (!Array.isArray(amounts) || amounts.length === 0) {
      throw new Error(
        `Router returned invalid amounts data. The token pair may not have liquidity on EagleFi DEX.`
      );
    }

    const finalAmount = amounts[amounts.length - 1];
    if (finalAmount === undefined || finalAmount === null) {
      throw new Error(
        `Router returned empty amount for this token pair. No liquidity available.`
      );
    }

    const amountOut = BigInt(finalAmount);
    const minimumAmountOut =
      (amountOut * BigInt(10000 - slippageTolerance)) / BigInt(10000);

    // Calculate price impact
    const priceImpact = calculatePriceImpact(amountIn, amountOut);

    return {
      amountIn: amountIn.toString(),
      amountOut: amountOut.toString(),
      priceImpact,
      route,
      minimumAmountOut: minimumAmountOut.toString(),
    };
  } catch (error) {
    console.error("[EagleFi] Quote failed:", error);

    // Provide helpful error message
    const errorMsg = error instanceof Error ? error.message : String(error);
    if (errorMsg.includes("liquidity") || errorMsg.includes("amounts")) {
      throw new Error(
        `No liquidity available for this token pair on EagleFi DEX. Try a different token or check if the DEX has this trading pair deployed.`
      );
    }

    throw new Error(
      `Unable to get swap quote from EagleFi router: ${errorMsg}`
    );
  }
}

/**
 * Swap USDC to MAS for depositing into vault
 */
export async function swapUSDCtoMAS(
  getContract: (address: string) => SmartContract,
  usdcAmount: bigint,
  minMasOut: bigint,
  recipient: string
): Promise<SwapResult> {
  const deadline = BigInt(Date.now() + 600_000); // 10 minutes

  return swapTokens(getContract, {
    tokenIn: USDC_TOKEN,
    tokenInAmount: usdcAmount,
    tokenOut: WMAS_TOKEN,
    minAmountOut: minMasOut,
    deadline,
    recipient,
  });
}

/**
 * Calculate slippage-protected minimum output
 */
export function calculateMinOutput(
  expectedAmount: bigint,
  slippagePercent: number = 1
): bigint {
  const slippageBps = BigInt(Math.floor(slippagePercent * 100));
  const minAmount =
    (expectedAmount * (BigInt(10000) - slippageBps)) / BigInt(10000);
  return minAmount;
}

/**
 * Approve token spending (required before swaps)
 */
export async function approveToken(
  getContract: (address: string) => SmartContract,
  tokenAddress: string,
  spender: string,
  amount: bigint
): Promise<string> {
  const token = getContract(tokenAddress);

  const approveArgs = new Args().addString(spender).addU256(amount);

  const op = await token.call("approve", approveArgs, {
    fee: Mas.fromString("0.01"),
    maxGas: BigInt(500_000_000),
  });

  return op.id;
}

/**
 * Calculate optimal swap route
 */
export function calculateOptimalRoute(
  tokenIn: string,
  tokenOut: string
): string[] {
  // Direct route if pair exists with MAS
  if (tokenIn === TOKEN_ADDRESSES.MAS || tokenOut === TOKEN_ADDRESSES.MAS) {
    return [tokenIn, tokenOut];
  }

  // Route through MAS for better liquidity
  return [tokenIn, TOKEN_ADDRESSES.MAS, tokenOut];
}

/**
 * Calculate price impact percentage
 */
export function calculatePriceImpact(
  amountIn: bigint,
  amountOut: bigint
): number {
  if (amountIn === BigInt(0)) return 0;

  const impact = Number(amountOut) / Number(amountIn);
  return Math.abs((1 - impact) * 100);
}

/**
 * Get token balance
 */
export async function getTokenBalance(
  getContract: (address: string) => SmartContract,
  tokenAddress: string,
  userAddress: string
): Promise<bigint> {
  try {
    const token = getContract(tokenAddress);
    const args = new Args().addString(userAddress);

    const balance = await token.read("balanceOf", args);
    return BigInt(balance.toString());
  } catch (error) {
    console.error("Failed to get token balance:", error);
    return BigInt(0);
  }
}

/**
 * Check if slippage is acceptable (< 5% warning threshold)
 */
export function validateSlippage(priceImpact: number): {
  valid: boolean;
  warning?: string;
} {
  if (priceImpact > 10) {
    return {
      valid: false,
      warning:
        "Price impact too high (>10%). Transaction may fail or result in significant loss.",
    };
  }

  if (priceImpact > 5) {
    return {
      valid: true,
      warning: "High price impact (>5%). Consider reducing trade size.",
    };
  }

  return { valid: true };
}
