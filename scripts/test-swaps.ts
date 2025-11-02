/**
 * Test all token swap paths on EagleFi DEX
 * Run: npx tsx scripts/test-swaps.ts
 */

import { Args } from "@massalabs/massa-web3";
import {
  calculateOptimalRoute,
  getSwapQuote,
  TOKEN_ADDRESSES,
  validateSlippage,
} from "../src/lib/dex/eaglefi";

interface SwapTest {
  name: string;
  tokenIn: string;
  tokenOut: string;
  amountIn: bigint;
  expectedSuccess: boolean;
}

const SWAP_TESTS: SwapTest[] = [
  {
    name: "USDC → MAS",
    tokenIn: TOKEN_ADDRESSES.USDC,
    tokenOut: TOKEN_ADDRESSES.MAS,
    amountIn: BigInt(100 * 1e6), // 100 USDC
    expectedSuccess: true,
  },
  {
    name: "WETH → MAS",
    tokenIn: TOKEN_ADDRESSES.WETH,
    tokenOut: TOKEN_ADDRESSES.MAS,
    amountIn: BigInt(1 * 1e17), // 0.1 WETH
    expectedSuccess: true,
  },
  {
    name: "DAI → MAS",
    tokenIn: TOKEN_ADDRESSES.DAI,
    tokenOut: TOKEN_ADDRESSES.MAS,
    amountIn: BigInt(100 * 1e18), // 100 DAI
    expectedSuccess: true,
  },
  {
    name: "USDT → MAS",
    tokenIn: TOKEN_ADDRESSES.USDT,
    tokenOut: TOKEN_ADDRESSES.MAS,
    amountIn: BigInt(100 * 1e6), // 100 USDT
    expectedSuccess: true,
  },
  {
    name: "MAS → USDC",
    tokenIn: TOKEN_ADDRESSES.MAS,
    tokenOut: TOKEN_ADDRESSES.USDC,
    amountIn: BigInt(1000 * 1e9), // 1000 MAS
    expectedSuccess: true,
  },
  {
    name: "USDC → WETH (Multi-hop)",
    tokenIn: TOKEN_ADDRESSES.USDC,
    tokenOut: TOKEN_ADDRESSES.WETH,
    amountIn: BigInt(100 * 1e6), // 100 USDC
    expectedSuccess: true,
  },
  {
    name: "DAI → USDC (Multi-hop)",
    tokenIn: TOKEN_ADDRESSES.DAI,
    tokenOut: TOKEN_ADDRESSES.USDC,
    amountIn: BigInt(100 * 1e18), // 100 DAI
    expectedSuccess: true,
  },
];

async function runSwapTests() {
  console.log("🧪 Testing All Swap Paths on EagleFi DEX");
  console.log("=".repeat(50));

  // Mock provider for testing (read-only)
  const mockProvider = {
    read: async (method: string, args: Args) => {
      console.log(`   📖 Called ${method} with ${args}`);
      // Return mock data for testing
      return JSON.stringify([100000000n, 95000000n]); // Mock amounts
    },
  };

  const mockGetContract = (address: string) => {
    return {
      read: mockProvider.read,
    } as any;
  };

  let passed = 0;
  let failed = 0;

  for (const test of SWAP_TESTS) {
    console.log(`\n📊 Testing: ${test.name}`);
    console.log(`   From: ${getTokenSymbol(test.tokenIn)}`);
    console.log(`   To: ${getTokenSymbol(test.tokenOut)}`);
    console.log(`   Amount: ${formatAmount(test.amountIn, test.tokenIn)}`);

    try {
      // Calculate route
      const route = calculateOptimalRoute(test.tokenIn, test.tokenOut);
      console.log(`   Route: ${route.map(getTokenSymbol).join(" → ")}`);

      // Get quote
      const quote = await getSwapQuote(
        mockGetContract,
        test.tokenIn,
        test.amountIn,
        test.tokenOut,
        100 // 1% slippage
      );

      console.log(
        `   Expected Out: ${formatAmount(
          BigInt(quote.amountOut),
          test.tokenOut
        )}`
      );
      console.log(
        `   Min Out: ${formatAmount(
          BigInt(quote.minimumAmountOut),
          test.tokenOut
        )}`
      );
      console.log(`   Price Impact: ${quote.priceImpact.toFixed(2)}%`);

      // Validate slippage
      const validation = validateSlippage(quote.priceImpact);
      if (!validation.valid) {
        console.log(`   ⚠️  Warning: ${validation.warning}`);
      }

      if (test.expectedSuccess) {
        console.log(`   ✅ PASS: Quote received successfully`);
        passed++;
      } else {
        console.log(`   ❌ FAIL: Expected failure but got success`);
        failed++;
      }
    } catch (error) {
      if (!test.expectedSuccess) {
        console.log(`   ✅ PASS: Expected failure occurred`);
        passed++;
      } else {
        console.log(
          `   ❌ FAIL: ${
            error instanceof Error ? error.message : String(error)
          }`
        );
        failed++;
      }
    }
  }

  console.log("\n" + "=".repeat(50));
  console.log(`\n📈 Test Results:`);
  console.log(`   ✅ Passed: ${passed}/${SWAP_TESTS.length}`);
  console.log(`   ❌ Failed: ${failed}/${SWAP_TESTS.length}`);
  console.log(
    `   Success Rate: ${((passed / SWAP_TESTS.length) * 100).toFixed(1)}%`
  );

  if (failed === 0) {
    console.log("\n🎉 All tests passed!");
  } else {
    console.log("\n⚠️  Some tests failed. Review the output above.");
  }
}

function getTokenSymbol(address: string): string {
  const symbols: { [key: string]: string } = {
    [TOKEN_ADDRESSES.MAS]: "MAS",
    [TOKEN_ADDRESSES.USDC]: "USDC",
    [TOKEN_ADDRESSES.WETH]: "WETH",
    [TOKEN_ADDRESSES.DAI]: "DAI",
    [TOKEN_ADDRESSES.USDT]: "USDT",
  };
  return symbols[address] || "UNKNOWN";
}

function formatAmount(amount: bigint, tokenAddress: string): string {
  const decimals: { [key: string]: number } = {
    [TOKEN_ADDRESSES.MAS]: 9,
    [TOKEN_ADDRESSES.USDC]: 6,
    [TOKEN_ADDRESSES.WETH]: 18,
    [TOKEN_ADDRESSES.DAI]: 18,
    [TOKEN_ADDRESSES.USDT]: 6,
  };

  const dec = decimals[tokenAddress] || 9;
  const value = Number(amount) / Math.pow(10, dec);
  return `${value.toFixed(4)} ${getTokenSymbol(tokenAddress)}`;
}

// Run tests
runSwapTests().catch(console.error);
