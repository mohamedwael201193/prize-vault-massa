export interface RiskTier {
  id: string;
  name: string;
  description: string;
  protectionLevel: number; // percentage of principal protected
  riskLevel: number; // percentage at risk
  expectedAPY: string;
  prizeMultiplier: number;
  color: string;
  icon: string;
}

export const RISK_TIERS: RiskTier[] = [
  {
    id: "conservative",
    name: "Conservative",
    description: "Maximum safety with moderate rewards",
    protectionLevel: 95,
    riskLevel: 5,
    expectedAPY: "3-8%",
    prizeMultiplier: 1.5,
    color: "text-green-500",
    icon: "🛡️",
  },
  {
    id: "moderate",
    name: "Moderate",
    description: "Balanced risk for better prizes",
    protectionLevel: 90,
    riskLevel: 10,
    expectedAPY: "5-12%",
    prizeMultiplier: 2.5,
    color: "text-blue-500",
    icon: "⚖️",
  },
  {
    id: "aggressive",
    name: "Aggressive",
    description: "Higher risk for maximum rewards",
    protectionLevel: 80,
    riskLevel: 20,
    expectedAPY: "8-20%",
    prizeMultiplier: 4.0,
    color: "text-red-500",
    icon: "🚀",
  },
];

export const getRiskTier = (id: string): RiskTier | undefined => {
  return RISK_TIERS.find((tier) => tier.id === id);
};

export const getDefaultRiskTier = (): RiskTier => {
  return RISK_TIERS[1]; // Moderate as default
};
