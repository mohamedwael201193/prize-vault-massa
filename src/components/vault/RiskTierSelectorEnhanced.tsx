import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { RISK_TIERS } from "@/config/riskTiers";
import { motion } from "framer-motion";
import { Award, Check, Shield, TrendingUp, Zap } from "lucide-react";

interface RiskTierSelectorEnhancedProps {
  selectedTier: string;
  onTierSelect: (tierId: string) => void;
  className?: string;
}

export function RiskTierSelectorEnhanced({
  selectedTier,
  onTierSelect,
  className,
}: RiskTierSelectorEnhancedProps) {
  return (
    <div
      className={`grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 sm:gap-6 ${className}`}
    >
      {RISK_TIERS.map((tier, index) => {
        const isSelected = selectedTier === tier.id;
        const gradients = {
          conservative: "from-neon-green-500/20 to-neon-green-600/20",
          moderate: "from-electric-blue-500/20 to-electric-blue-600/20",
          aggressive: "from-hot-pink-500/20 to-hot-pink-600/20",
        };
        const glowColors = {
          conservative: "shadow-neon-green-500/50",
          moderate: "shadow-electric-blue-500/50",
          aggressive: "shadow-hot-pink-500/50",
        };
        const borderColors = {
          conservative: "border-neon-green-500/50",
          moderate: "border-electric-blue-500/50",
          aggressive: "border-hot-pink-500/50",
        };

        return (
          <motion.div
            key={tier.id}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.5, delay: index * 0.1 }}
            whileHover={{ y: -8, scale: 1.02 }}
            className="relative group"
          >
            {/* Glow Effect */}
            <div
              className={`absolute inset-0 bg-gradient-to-br ${
                gradients[tier.id as keyof typeof gradients]
              } rounded-2xl blur-xl opacity-0 group-hover:opacity-100 transition-all duration-500 ${
                isSelected ? "opacity-70" : ""
              }`}
            />

            {/* Card */}
            <Card
              className={`relative cursor-pointer transition-all duration-300 backdrop-blur-xl border-2 overflow-hidden ${
                isSelected
                  ? `${
                      borderColors[tier.id as keyof typeof borderColors]
                    } shadow-2xl ${
                      glowColors[tier.id as keyof typeof glowColors]
                    }`
                  : "border-slate-700/50 hover:border-slate-600"
              } bg-slate-900/80`}
              onClick={() => onTierSelect(tier.id)}
            >
              {/* Background Pattern */}
              <div className="absolute inset-0 bg-gradient-to-br from-white/5 to-transparent opacity-50" />

              {/* Selection Indicator */}
              {isSelected && (
                <motion.div
                  initial={{ scale: 0 }}
                  animate={{ scale: 1 }}
                  className="absolute top-4 right-4 z-10"
                >
                  <div
                    className={`flex h-8 w-8 items-center justify-center rounded-full bg-gradient-to-br ${
                      gradients[tier.id as keyof typeof gradients]
                    } backdrop-blur-sm animate-pulse-glow`}
                  >
                    <Check className="h-5 w-5 text-white" />
                  </div>
                </motion.div>
              )}

              <CardHeader className="pb-3 relative z-10">
                <div className="flex items-center gap-3 mb-2">
                  <motion.div
                    animate={isSelected ? { rotate: [0, 360] } : {}}
                    transition={{ duration: 0.6 }}
                    className={`flex h-12 w-12 items-center justify-center rounded-xl bg-gradient-to-br ${
                      gradients[tier.id as keyof typeof gradients]
                    } backdrop-blur-sm`}
                  >
                    <span className="text-2xl">{tier.icon}</span>
                  </motion.div>
                  <div>
                    <CardTitle className={`text-xl font-bold ${tier.color}`}>
                      {tier.name}
                    </CardTitle>
                    <CardDescription className="text-xs text-slate-400">
                      {tier.id.toUpperCase()} TIER
                    </CardDescription>
                  </div>
                </div>
                <CardDescription className="text-sm text-slate-300 leading-relaxed">
                  {tier.description}
                </CardDescription>
              </CardHeader>

              <CardContent className="space-y-4 relative z-10">
                {/* Protection Badge */}
                <div className="flex items-center justify-between p-3 rounded-xl bg-slate-800/50 backdrop-blur-sm border border-slate-700/50">
                  <div className="flex items-center gap-2">
                    <Shield className="h-4 w-4 text-neon-green-400" />
                    <span className="text-sm text-slate-300">Protected</span>
                  </div>
                  <span className={`text-lg font-bold ${tier.color}`}>
                    {tier.protectionLevel}%
                  </span>
                </div>

                {/* Risk Badge */}
                <div className="flex items-center justify-between p-3 rounded-xl bg-slate-800/50 backdrop-blur-sm border border-slate-700/50">
                  <div className="flex items-center gap-2">
                    <Zap className="h-4 w-4 text-hot-pink-400" />
                    <span className="text-sm text-slate-300">At Risk</span>
                  </div>
                  <span className="text-lg font-bold text-hot-pink-400">
                    {tier.riskLevel}%
                  </span>
                </div>

                {/* APY Badge */}
                <div className="flex items-center justify-between p-3 rounded-xl bg-gradient-to-r from-electric-blue-500/10 to-cyber-purple-500/10 backdrop-blur-sm border border-electric-blue-500/30">
                  <div className="flex items-center gap-2">
                    <TrendingUp className="h-4 w-4 text-electric-blue-400" />
                    <span className="text-sm text-slate-300 font-medium">
                      Expected APY
                    </span>
                  </div>
                  <span className="text-lg font-bold bg-gradient-to-r from-electric-blue-400 to-cyber-purple-400 bg-clip-text text-transparent">
                    {tier.expectedAPY}
                  </span>
                </div>

                {/* Prize Multiplier Badge */}
                <div className="flex items-center justify-between p-3 rounded-xl bg-gradient-to-r from-hot-pink-500/10 to-cyber-purple-500/10 backdrop-blur-sm border border-hot-pink-500/30">
                  <div className="flex items-center gap-2">
                    <Award className="h-4 w-4 text-hot-pink-400" />
                    <span className="text-sm text-slate-300 font-medium">
                      Prize Boost
                    </span>
                  </div>
                  <span className="text-lg font-bold text-hot-pink-400">
                    {tier.prizeMultiplier}x
                  </span>
                </div>

                {/* Visual Risk Bar */}
                <div className="mt-4">
                  <div className="flex justify-between text-xs text-slate-400 mb-2">
                    <span>Risk Level</span>
                    <span>{tier.riskLevel}%</span>
                  </div>
                  <div className="relative h-3 bg-slate-800 rounded-full overflow-hidden">
                    <motion.div
                      initial={{ width: 0 }}
                      animate={{ width: `${tier.riskLevel}%` }}
                      transition={{ duration: 1, delay: 0.2 + index * 0.1 }}
                      className={`absolute inset-y-0 left-0 bg-gradient-to-r ${
                        tier.id === "conservative"
                          ? "from-neon-green-500 to-neon-green-600"
                          : tier.id === "moderate"
                          ? "from-electric-blue-500 to-electric-blue-600"
                          : "from-hot-pink-500 to-hot-pink-600"
                      } rounded-full`}
                    />
                  </div>
                </div>

                {/* Select Button */}
                <motion.button
                  whileHover={{ scale: 1.02 }}
                  whileTap={{ scale: 0.98 }}
                  className={`w-full mt-4 py-3 rounded-xl font-semibold transition-all duration-300 ${
                    isSelected
                      ? `bg-gradient-to-r ${
                          gradients[tier.id as keyof typeof gradients]
                        } backdrop-blur-sm border-2 ${
                          borderColors[tier.id as keyof typeof borderColors]
                        } text-white shadow-lg`
                      : "bg-slate-800/50 border-2 border-slate-700 text-slate-300 hover:border-slate-600 hover:bg-slate-800"
                  }`}
                >
                  {isSelected ? "✓ Selected" : "Select Tier"}
                </motion.button>
              </CardContent>
            </Card>
          </motion.div>
        );
      })}
    </div>
  );
}
