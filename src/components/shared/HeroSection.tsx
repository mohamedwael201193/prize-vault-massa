import { Button } from "@/components/ui/button";
import { motion } from "framer-motion";
import { Shield, Sparkles, TrendingUp, Zap } from "lucide-react";
import { Link } from "react-router-dom";

export function HeroSection() {
  return (
    <div className="relative overflow-hidden bg-gradient-to-br from-slate-950 via-purple-950 to-slate-900 py-20 px-4">
      {/* Animated Background Elements */}
      <div className="absolute inset-0 overflow-hidden">
        <div className="absolute -top-40 -right-40 w-80 h-80 bg-cyber-purple-500 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-float" />
        <div className="absolute -bottom-40 -left-40 w-80 h-80 bg-electric-blue-500 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-float animation-delay-2000" />
        <div className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-96 h-96 bg-neon-green-500 rounded-full mix-blend-multiply filter blur-3xl opacity-10 animate-pulse-glow" />
      </div>

      {/* Animated Grid Pattern */}
      <div className="absolute inset-0 bg-grid-pattern opacity-10" />

      {/* Content */}
      <div className="relative z-10 container mx-auto max-w-6xl">
        <div className="text-center">
          {/* Badge */}
          <motion.div
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="inline-flex items-center gap-2 mb-6 px-4 py-2 rounded-full bg-gradient-to-r from-cyber-purple-500/20 to-electric-blue-500/20 backdrop-blur-sm border border-cyber-purple-500/30"
          >
            <Sparkles className="h-4 w-4 text-cyber-purple-400 animate-pulse" />
            <span className="text-sm font-medium bg-gradient-to-r from-cyber-purple-400 to-electric-blue-400 bg-clip-text text-transparent">
              Wave 4 Launch - Risk-Configurable DeFi Protocol
            </span>
          </motion.div>

          {/* Main Heading */}
          <motion.h1
            initial={{ opacity: 0, scale: 0.9 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ duration: 0.7, delay: 0.1 }}
            className="text-5xl sm:text-6xl lg:text-7xl font-bold mb-6 leading-tight"
          >
            <span className="bg-gradient-to-r from-white via-cyber-purple-200 to-electric-blue-200 bg-clip-text text-transparent animate-gradient-x">
              Choose Your Risk,
            </span>
            <br />
            <span className="bg-gradient-to-r from-electric-blue-400 via-cyber-purple-400 to-hot-pink-400 bg-clip-text text-transparent animate-gradient-x">
              Maximize Your Rewards
            </span>
          </motion.h1>

          {/* Subtitle */}
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.7, delay: 0.2 }}
            className="text-xl sm:text-2xl text-slate-300 mb-8 max-w-3xl mx-auto leading-relaxed"
          >
            Configurable risk tiers with{" "}
            <span className="text-neon-green-400 font-semibold">
              up to 20% APY
            </span>
            . Autonomous prize draws. Multi-token support.
            <span className="text-electric-blue-400 font-semibold">
              {" "}
              Set it and forget it.
            </span>
          </motion.p>

          {/* Feature Pills */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.7, delay: 0.3 }}
            className="flex flex-wrap justify-center gap-4 mb-10"
          >
            <div className="flex items-center gap-2 px-4 py-2 rounded-full bg-gradient-to-r from-neon-green-500/20 to-neon-green-600/20 backdrop-blur-sm border border-neon-green-500/30">
              <Shield className="h-5 w-5 text-neon-green-400" />
              <span className="text-white font-medium">80-95% Protected</span>
            </div>
            <div className="flex items-center gap-2 px-4 py-2 rounded-full bg-gradient-to-r from-electric-blue-500/20 to-electric-blue-600/20 backdrop-blur-sm border border-electric-blue-500/30">
              <TrendingUp className="h-5 w-5 text-electric-blue-400" />
              <span className="text-white font-medium">
                Real Yield Generation
              </span>
            </div>
            <div className="flex items-center gap-2 px-4 py-2 rounded-full bg-gradient-to-r from-hot-pink-500/20 to-hot-pink-600/20 backdrop-blur-sm border border-hot-pink-500/30">
              <Zap className="h-5 w-5 text-hot-pink-400" />
              <span className="text-white font-medium">Auto-Deposits</span>
            </div>
          </motion.div>

          {/* CTA Buttons */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.7, delay: 0.4 }}
            className="flex flex-col sm:flex-row gap-4 justify-center items-center"
          >
            <Link to="/vault">
              <Button
                size="lg"
                className="group relative overflow-hidden bg-gradient-to-r from-cyber-purple-600 to-electric-blue-600 hover:from-cyber-purple-500 hover:to-electric-blue-500 text-white font-bold px-8 py-6 text-lg rounded-xl shadow-2xl hover:shadow-cyber-purple-500/50 transition-all duration-300 hover:scale-105"
              >
                <span className="relative z-10 flex items-center gap-2">
                  Start Earning Now
                  <motion.span
                    animate={{ x: [0, 5, 0] }}
                    transition={{ duration: 1.5, repeat: Infinity }}
                  >
                    →
                  </motion.span>
                </span>
                <div className="absolute inset-0 bg-gradient-to-r from-electric-blue-600 to-cyber-purple-600 opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
              </Button>
            </Link>

            <Link to="/about">
              <Button
                size="lg"
                variant="outline"
                className="border-2 border-slate-600 hover:border-electric-blue-500 text-white hover:bg-electric-blue-500/10 px-8 py-6 text-lg rounded-xl backdrop-blur-sm transition-all duration-300"
              >
                Learn How It Works
              </Button>
            </Link>
          </motion.div>

          {/* Stats */}
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ duration: 0.7, delay: 0.6 }}
            className="mt-16 grid grid-cols-2 md:grid-cols-4 gap-8"
          >
            {[
              { label: "Total Value Locked", value: "109+ MAS", icon: "💰" },
              { label: "Prize Draws", value: "162+", icon: "🎯" },
              { label: "Max APY", value: "20%", icon: "📈" },
              { label: "Risk Tiers", value: "3", icon: "⚖️" },
            ].map((stat, i) => (
              <motion.div
                key={stat.label}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.5, delay: 0.7 + i * 0.1 }}
                className="relative group"
              >
                <div className="absolute inset-0 bg-gradient-to-br from-cyber-purple-500/10 to-electric-blue-500/10 rounded-2xl blur-xl group-hover:blur-2xl transition-all duration-300 opacity-50 group-hover:opacity-100" />
                <div className="relative bg-slate-900/50 backdrop-blur-sm border border-slate-700/50 rounded-2xl p-6 hover:border-cyber-purple-500/50 transition-all duration-300">
                  <div className="text-3xl mb-2">{stat.icon}</div>
                  <div className="text-3xl font-bold bg-gradient-to-r from-white to-slate-300 bg-clip-text text-transparent mb-1">
                    {stat.value}
                  </div>
                  <div className="text-sm text-slate-400">{stat.label}</div>
                </div>
              </motion.div>
            ))}
          </motion.div>
        </div>
      </div>

      {/* Floating Particles */}
      <div className="absolute inset-0 pointer-events-none">
        {[...Array(20)].map((_, i) => (
          <motion.div
            key={i}
            className="absolute w-2 h-2 bg-electric-blue-400 rounded-full opacity-30"
            style={{
              left: `${Math.random() * 100}%`,
              top: `${Math.random() * 100}%`,
            }}
            animate={{
              y: [0, -30, 0],
              opacity: [0.3, 0.7, 0.3],
            }}
            transition={{
              duration: 3 + Math.random() * 2,
              repeat: Infinity,
              delay: Math.random() * 2,
            }}
          />
        ))}
      </div>
    </div>
  );
}
