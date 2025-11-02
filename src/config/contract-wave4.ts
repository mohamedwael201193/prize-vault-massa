// Wave 4 Contract Configuration
// Auto-generated on 2025-11-01T18:14:40.856Z

export const WAVE4_CONTRACT_ADDRESS = "AS1DCtQW7HiA9JEgEBYaBJgpjXkxqNCAj7nMtFpyvYRxherrRnQW";
export const BUILDNET_URL = "https://buildnet.massa.net";
export const DRAW_PERIODS = 5400;
export const TICK_PERIODS = 225;

// Risk Tier Configuration
export const RISK_TIERS = {
  CONSERVATIVE: {
    protection: 95,
    risk: 5,
    multiplier: 1.0,
    apy: "3-5%"
  },
  MODERATE: {
    protection: 90,
    risk: 10,
    multiplier: 1.5,
    apy: "5-12%"
  },
  AGGRESSIVE: {
    protection: 80,
    risk: 20,
    multiplier: 2.0,
    apy: "8-20%"
  }
} as const;
