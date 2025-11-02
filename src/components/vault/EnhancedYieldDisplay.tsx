import { Badge } from "@/components/ui/badge";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { RISK_TIERS } from "@/config/riskTiers";
import { Award, Calendar, DollarSign, TrendingUp } from "lucide-react";

interface EnhancedYieldDisplayProps {
  selectedTier: string;
  totalDeposited: number;
  timeInVault: number; // in days
  estimatedYield: number;
  prizesWon: number;
  className?: string;
}

export function EnhancedYieldDisplay({
  selectedTier,
  totalDeposited,
  timeInVault,
  estimatedYield,
  prizesWon,
  className,
}: EnhancedYieldDisplayProps) {
  const tier = RISK_TIERS.find((t) => t.id === selectedTier) || RISK_TIERS[0];
  const projectedAnnualYield =
    (totalDeposited *
      (tier.expectedAPY.split("-")[1]
        ? parseFloat(tier.expectedAPY.split("-")[1])
        : parseFloat(tier.expectedAPY))) /
    100;
  const currentAPY =
    timeInVault > 0
      ? ((estimatedYield + prizesWon) / totalDeposited) *
        (365 / timeInVault) *
        100
      : 0;

  return (
    <div
      className={`grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 ${className}`}
    >
      {/* Current Yield */}
      <Card className="relative overflow-hidden">
        <CardHeader className="pb-2">
          <div className="flex items-center gap-2">
            <TrendingUp className={`h-5 w-5 ${tier.color}`} />
            <CardTitle className="text-lg">Current APY</CardTitle>
          </div>
        </CardHeader>
        <CardContent>
          <div className="text-3xl font-bold text-green-600">
            {currentAPY.toFixed(2)}%
          </div>
          <CardDescription className="mt-1">
            Target: {tier.expectedAPY}
          </CardDescription>
          <Progress
            value={Math.min(
              (currentAPY /
                parseFloat(
                  tier.expectedAPY.split("-")[1] || tier.expectedAPY
                )) *
                100,
              100
            )}
            className="mt-2 h-2"
          />
        </CardContent>
      </Card>

      {/* Yield Earned */}
      <Card className="relative overflow-hidden">
        <CardHeader className="pb-2">
          <div className="flex items-center gap-2">
            <DollarSign className="h-5 w-5 text-blue-500" />
            <CardTitle className="text-lg">Yield Earned</CardTitle>
          </div>
        </CardHeader>
        <CardContent>
          <div className="text-3xl font-bold text-blue-600">
            {estimatedYield.toFixed(3)} MAS
          </div>
          <CardDescription className="mt-1">
            From {timeInVault} days staking
          </CardDescription>
          <Badge variant="outline" className="mt-2">
            {((estimatedYield / totalDeposited) * 100).toFixed(2)}% gained
          </Badge>
        </CardContent>
      </Card>

      {/* Prizes Won */}
      <Card className="relative overflow-hidden">
        <CardHeader className="pb-2">
          <div className="flex items-center gap-2">
            <Award className="h-5 w-5 text-purple-500" />
            <CardTitle className="text-lg">Prizes Won</CardTitle>
          </div>
        </CardHeader>
        <CardContent>
          <div className="text-3xl font-bold text-purple-600">
            {prizesWon.toFixed(3)} MAS
          </div>
          <CardDescription className="mt-1">
            Bonus rewards earned
          </CardDescription>
          <Badge variant="secondary" className="mt-2">
            {tier.prizeMultiplier}x multiplier active
          </Badge>
        </CardContent>
      </Card>

      {/* Projected Annual */}
      <Card className="relative overflow-hidden">
        <CardHeader className="pb-2">
          <div className="flex items-center gap-2">
            <Calendar className="h-5 w-5 text-orange-500" />
            <CardTitle className="text-lg">Annual Projection</CardTitle>
          </div>
        </CardHeader>
        <CardContent>
          <div className="text-3xl font-bold text-orange-600">
            {projectedAnnualYield.toFixed(1)} MAS
          </div>
          <CardDescription className="mt-1">
            Based on {tier.name} tier
          </CardDescription>
          <Badge variant="outline" className="mt-2">
            {tier.riskLevel}% at risk
          </Badge>
        </CardContent>
      </Card>
    </div>
  );
}
