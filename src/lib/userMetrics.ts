import { RISK_TIERS } from "@/config/riskTiers";

export interface UserMetrics {
  timeInVault: number; // days
  estimatedYield: number; // MAS
  prizesWon: number; // MAS
}

export function calculateUserMetrics(
  principalMas: number,
  firstDepositTime?: number, // timestamp
  selectedRiskTier: string = "conservative"
): UserMetrics {
  if (principalMas <= 0) {
    return {
      timeInVault: 0,
      estimatedYield: 0,
      prizesWon: 0,
    };
  }

  const tier =
    RISK_TIERS.find((t) => t.id === selectedRiskTier) || RISK_TIERS[0];

  // Calculate time in vault (days)
  const timeInVault = firstDepositTime
    ? Math.max(0, (Date.now() - firstDepositTime) / (1000 * 60 * 60 * 24))
    : 1; // Default to 1 day if no deposit time

  // Parse expected APY (handle ranges like "8-12%")
  const apyStr = tier.expectedAPY;
  const apyMatch = apyStr.match(/(\d+(?:\.\d+)?)-?(\d+(?:\.\d+)?)?%/);
  const baseAPY = apyMatch ? parseFloat(apyMatch[1]) : 5;
  const maxAPY = apyMatch && apyMatch[2] ? parseFloat(apyMatch[2]) : baseAPY;
  const avgAPY = (baseAPY + maxAPY) / 2;

  // Calculate estimated yield from staking (compound interest)
  const dailyRate = avgAPY / 100 / 365;
  const estimatedYield =
    principalMas * (Math.pow(1 + dailyRate, timeInVault) - 1);

  // Estimate prizes won based on tier multiplier and time
  // Assumes drawing every ~48 seconds as per the autonomous system
  const drawsPerDay = (24 * 60 * 60) / 48; // ~1800 draws per day
  const totalDraws = timeInVault * drawsPerDay;

  // Rough prize estimation: higher tier = better chance and bigger prizes
  const baseWinChance = 0.001; // 0.1% per draw base chance
  const tierWinChance = baseWinChance * tier.prizeMultiplier;
  const avgPrizeSize = 0.1 * tier.prizeMultiplier; // MAS per win

  const prizesWon = Math.min(
    totalDraws * tierWinChance * avgPrizeSize,
    principalMas * 0.1 // Cap at 10% of principal for realism
  );

  return {
    timeInVault: Math.round(timeInVault * 10) / 10, // Round to 1 decimal
    estimatedYield: Math.max(0, estimatedYield),
    prizesWon: Math.max(0, prizesWon),
  };
}

export function formatMAS(amount: number, decimals = 3): string {
  if (amount === 0) return "0";
  if (amount < 0.001) return "< 0.001";
  return amount.toFixed(decimals);
}

export function formatAPY(current: number, target: string): string {
  const match = target.match(/(\d+(?:\.\d+)?)-?(\d+(?:\.\d+)?)?%/);
  const targetMin = match ? parseFloat(match[1]) : 0;
  const targetMax = match && match[2] ? parseFloat(match[2]) : targetMin;

  if (current >= targetMax) return "🎯 Target Reached";
  if (current >= targetMin) return "📈 On Track";
  return "🔄 Building Up";
}
