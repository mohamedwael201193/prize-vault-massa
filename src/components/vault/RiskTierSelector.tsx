import { Badge } from "@/components/ui/badge";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { RISK_TIERS } from "@/config/riskTiers";
import { Check } from "lucide-react";

interface RiskTierSelectorProps {
  selectedTier: string;
  onTierSelect: (tierId: string) => void;
  className?: string;
}

export function RiskTierSelector({
  selectedTier,
  onTierSelect,
  className,
}: RiskTierSelectorProps) {
  return (
    <div
      className={`grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3 sm:gap-4 ${className}`}
    >
      {RISK_TIERS.map((tier) => (
        <Card
          key={tier.id}
          className={`cursor-pointer transition-all duration-200 hover:shadow-lg ${
            selectedTier === tier.id
              ? "ring-2 ring-primary border-primary shadow-lg"
              : "hover:border-primary/50"
          }`}
          onClick={() => onTierSelect(tier.id)}
        >
          <CardHeader className="pb-3">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-2">
                <span className="text-2xl">{tier.icon}</span>
                <CardTitle className={`text-lg ${tier.color}`}>
                  {tier.name}
                </CardTitle>
              </div>
              {selectedTier === tier.id && (
                <div className="flex h-6 w-6 items-center justify-center rounded-full bg-primary">
                  <Check className="h-4 w-4 text-primary-foreground" />
                </div>
              )}
            </div>
            <CardDescription className="text-sm">
              {tier.description}
            </CardDescription>
          </CardHeader>

          <CardContent className="space-y-3">
            <div className="grid grid-cols-2 gap-2 text-sm">
              <div>
                <span className="text-muted-foreground">Protected:</span>
                <div className={`font-semibold ${tier.color}`}>
                  {tier.protectionLevel}%
                </div>
              </div>
              <div>
                <span className="text-muted-foreground">At Risk:</span>
                <div className="font-semibold text-orange-500">
                  {tier.riskLevel}%
                </div>
              </div>
            </div>

            <div className="space-y-2">
              <Badge variant="secondary" className="w-full justify-center">
                Expected APY: {tier.expectedAPY}
              </Badge>
              <Badge variant="outline" className="w-full justify-center">
                Prize Boost: {tier.prizeMultiplier}x
              </Badge>
            </div>

            <div className="pt-2">
              <div className="h-2 bg-gray-200 rounded-full overflow-hidden">
                <div
                  className={`h-full transition-all duration-300 ${
                    tier.id === "conservative"
                      ? "bg-green-500 w-[95%]"
                      : tier.id === "moderate"
                      ? "bg-blue-500 w-[90%]"
                      : "bg-red-500 w-[80%]"
                  }`}
                />
              </div>
              <div className="flex justify-between text-xs text-muted-foreground mt-1">
                <span>Protected</span>
                <span>At Risk</span>
              </div>
            </div>
          </CardContent>
        </Card>
      ))}
    </div>
  );
}
