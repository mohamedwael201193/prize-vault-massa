// Token configuration for Massa Bridge tokens
// Reference: https://docs.massa.net/docs/massaBridge/home

export interface TokenConfig {
  symbol: string;
  name: string;
  address: string;
  decimals: number;
  origin: "ethereum" | "bsc";
  icon: string;
  enabled: boolean;
}

// Bridged tokens available on Massa BuildNet/Mainnet
export const SUPPORTED_TOKENS: TokenConfig[] = [
  {
    symbol: "MAS",
    name: "Massa",
    address: "native", // Native token
    decimals: 9,
    origin: "ethereum",
    icon: "💎",
    enabled: true,
  },
  {
    symbol: "USDC.e",
    name: "USD Coin (Ethereum)",
    address: "AS1hCJXjndR4c9vekLWsXGnrdigp4AaZ7uYG3UKFzzKnWVsrNLPJ",
    decimals: 6,
    origin: "ethereum",
    icon: "💵",
    enabled: true,
  },
  {
    symbol: "WETH.e",
    name: "Wrapped Ether (Ethereum)",
    address: "AS124vf3YfAJCSCQVYKczzuWWpXrximFpbTmX4rheLs5uNSftiiRY",
    decimals: 18,
    origin: "ethereum",
    icon: "⚡",
    enabled: true,
  },
  {
    symbol: "DAI.e",
    name: "Dai Stablecoin (Ethereum)",
    address: "AS1ZGF1upwp9kPRvDKLxFAKRebgg7b3RWDnhgV7VvdZkZsUL7Nuv",
    decimals: 18,
    origin: "ethereum",
    icon: "💰",
    enabled: true,
  },
  {
    symbol: "WBTC.e",
    name: "Wrapped Bitcoin (Ethereum)",
    address: "AS12fr54YtBY575Dfhtt7yftpT8KXgXb1ia5Pn1LofoLFLf9WcjGL",
    decimals: 8,
    origin: "ethereum",
    icon: "₿",
    enabled: true,
  },
  {
    symbol: "USDT.b",
    name: "Tether USD (BSC)",
    address: "AS12LKs9txoSSy8JgFJgV96m8k5z9pgzjYMYSshwN67mFVuj3bdUV",
    decimals: 18,
    origin: "bsc",
    icon: "💵",
    enabled: true,
  },
  {
    symbol: "WETH.b",
    name: "Wrapped Ether (BSC)",
    address: "AS125oPLYRTtfVjpWisPZVTLjBhCFfQ1jDsi75XNtRm1NZux54eCj",
    decimals: 18,
    origin: "bsc",
    icon: "⚡",
    enabled: true,
  },
];

// Get token by symbol
export function getTokenBySymbol(symbol: string): TokenConfig | undefined {
  return SUPPORTED_TOKENS.find((t) => t.symbol === symbol);
}

// Get token by address
export function getTokenByAddress(address: string): TokenConfig | undefined {
  return SUPPORTED_TOKENS.find((t) => t.address === address);
}

// Get enabled tokens
export function getEnabledTokens(): TokenConfig[] {
  return SUPPORTED_TOKENS.filter((t) => t.enabled);
}

// Get tokens by origin chain
export function getTokensByOrigin(origin: "ethereum" | "bsc"): TokenConfig[] {
  return SUPPORTED_TOKENS.filter((t) => t.origin === origin && t.enabled);
}

// Convert amount based on token decimals
export function toTokenUnits(amount: number, decimals: number): bigint {
  return BigInt(Math.floor(amount * Math.pow(10, decimals)));
}

// Convert from token units to display amount
export function fromTokenUnits(units: bigint, decimals: number): number {
  return Number(units) / Math.pow(10, decimals);
}

// Format token amount for display
export function formatTokenAmount(
  amount: number,
  symbol: string,
  maxDecimals = 4
): string {
  const formatted = amount.toFixed(maxDecimals);
  // Remove trailing zeros
  return `${parseFloat(formatted)} ${symbol}`;
}
