import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { motion } from "framer-motion";
import {
  ArrowRight,
  Coins,
  Lock,
  Shield,
  Sparkles,
  Trophy,
  Zap,
} from "lucide-react";
import { Link } from "react-router-dom";

const Index = () => {
  const features = [
    {
      icon: Zap,
      title: "Fully Autonomous",
      description:
        "Draws run automatically every 7 days with $0/month cost. Powered by Massa's revolutionary autonomous smart contracts.",
      gradient: "from-yellow-500 to-orange-500",
    },
    {
      icon: Shield,
      title: "100% No-Loss",
      description:
        "Your deposit is always safe. Withdraw anytime with zero penalties. Only the prize pool is distributed to winners.",
      gradient: "from-green-500 to-emerald-500",
    },
    {
      icon: Lock,
      title: "Verifiable & Fair",
      description:
        "On-chain randomness using Massa's blockchain data. Every draw is transparent and verifiable by anyone.",
      gradient: "from-blue-500 to-purple-500",
    },
  ];

  const stats = [
    { value: "200", label: "MAS Prize Pool", icon: Trophy },
    { value: "7 Days", label: "Draw Frequency", icon: Zap },
    { value: "$0", label: "Monthly Cost", icon: Coins },
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950">
      {/* Hero Section */}
      <section className="relative overflow-hidden py-20 md:py-32">
        {/* Animated Background */}
        <div className="absolute inset-0 bg-[radial-gradient(circle_at_50%_50%,rgba(59,130,246,0.1),transparent_50%)]" />
        <motion.div
          className="absolute top-20 left-20 w-72 h-72 bg-blue-500/20 rounded-full blur-3xl"
          animate={{
            scale: [1, 1.2, 1],
            opacity: [0.3, 0.5, 0.3],
          }}
          transition={{
            duration: 8,
            repeat: Infinity,
            ease: "easeInOut",
          }}
        />
        <motion.div
          className="absolute bottom-20 right-20 w-96 h-96 bg-purple-500/20 rounded-full blur-3xl"
          animate={{
            scale: [1.2, 1, 1.2],
            opacity: [0.3, 0.5, 0.3],
          }}
          transition={{
            duration: 10,
            repeat: Infinity,
            ease: "easeInOut",
          }}
        />

        <div className="relative z-10 container mx-auto px-4 text-center">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
            className="max-w-5xl mx-auto"
          >
            {/* Badge */}
            <motion.div
              initial={{ opacity: 0, scale: 0.9 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ delay: 0.2, duration: 0.5 }}
              className="inline-flex items-center gap-2 px-6 py-3 rounded-full bg-gradient-to-r from-blue-500/20 to-purple-500/20 border border-blue-400/30 mb-8 backdrop-blur-sm"
            >
              <Sparkles className="w-5 h-5 text-yellow-400 animate-pulse" />
              <span className="text-sm font-bold bg-gradient-to-r from-blue-300 to-purple-300 bg-clip-text text-transparent">
                🎉 Live on Massa BuildNet • Weekly Autonomous Draws
              </span>
            </motion.div>

            {/* Main Heading */}
            <motion.h1
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.3, duration: 0.8 }}
              className="mb-6 text-5xl md:text-7xl font-bold leading-tight"
            >
              <span className="bg-gradient-to-r from-white via-blue-100 to-white bg-clip-text text-transparent">
                Deposit MAS.
              </span>
              <br />
              <span className="bg-gradient-to-r from-yellow-400 via-orange-400 to-pink-500 bg-clip-text text-transparent">
                Win Big Prizes.
              </span>
              <br />
              <span className="bg-gradient-to-r from-green-400 via-blue-400 to-purple-400 bg-clip-text text-transparent">
                Never Lose.
              </span>
            </motion.h1>

            {/* Subtitle */}
            <motion.p
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.4, duration: 0.8 }}
              className="mx-auto mb-12 max-w-3xl text-xl md:text-2xl text-slate-300"
            >
              <span className="text-blue-400 font-bold text-2xl">
                AutoPrize Vault
              </span>{" "}
              - The first fully{" "}
              <span className="text-purple-400 font-semibold">
                autonomous no-loss lottery
              </span>{" "}
              on Massa blockchain.
              <span className="block mt-4 text-lg text-slate-400">
                💰 Deposit → 🎰 Weekly automatic draws → 🏆 Win prizes → 💸
                Withdraw anytime
              </span>
              <span className="block mt-3 text-purple-300 font-medium">
                ⚡ Powered by Massa Autonomous Smart Contracts • 🔐 $0/month
                operation cost
              </span>
            </motion.p>

            {/* CTA Buttons */}
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.5, duration: 0.8 }}
              className="flex flex-col sm:flex-row gap-4 justify-center"
            >
              <Link to="/vault">
                <Button
                  size="lg"
                  className="group relative px-10 py-7 text-xl font-bold bg-gradient-to-r from-yellow-500 via-orange-500 to-pink-500 hover:from-yellow-400 hover:via-orange-400 hover:to-pink-400 transition-all duration-300 hover:scale-110 hover:shadow-2xl hover:shadow-orange-500/50 animate-pulse hover:animate-none"
                >
                  <Trophy className="mr-3 h-6 w-6 group-hover:rotate-12 transition-transform" />
                  Start Winning Now
                  <ArrowRight className="ml-3 h-6 w-6 group-hover:translate-x-2 transition-transform" />
                </Button>
              </Link>
              <Link to="/how-it-works">
                <Button
                  variant="outline"
                  size="lg"
                  className="px-10 py-7 text-xl font-medium border-2 border-slate-600 hover:border-purple-500 hover:bg-purple-500/10 transition-all duration-300 hover:scale-105"
                >
                  <Sparkles className="mr-2 h-5 w-5" />
                  How It Works
                </Button>
              </Link>
            </motion.div>

            {/* Stats */}
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.6, duration: 0.8 }}
              className="grid grid-cols-3 gap-8 max-w-3xl mx-auto mt-20"
            >
              {stats.map((stat, index) => (
                <motion.div
                  key={stat.label}
                  initial={{ opacity: 0, scale: 0.9 }}
                  animate={{ opacity: 1, scale: 1 }}
                  transition={{ delay: 0.7 + index * 0.1, duration: 0.5 }}
                  className="text-center"
                >
                  <div className="inline-flex items-center justify-center w-12 h-12 rounded-full bg-gradient-to-br from-blue-500/20 to-purple-500/20 mb-3">
                    <stat.icon className="w-6 h-6 text-blue-400" />
                  </div>
                  <div className="text-3xl font-bold bg-gradient-to-r from-blue-400 to-purple-400 bg-clip-text text-transparent">
                    {stat.value}
                  </div>
                  <div className="text-sm text-slate-400 mt-1">
                    {stat.label}
                  </div>
                </motion.div>
              ))}
            </motion.div>
          </motion.div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-20">
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            viewport={{ once: true }}
            className="text-center mb-16"
          >
            <h2 className="text-4xl md:text-5xl font-bold mb-6">
              <span className="bg-gradient-to-r from-white to-slate-200 bg-clip-text text-transparent">
                Why Choose AutoPrize?
              </span>
            </h2>
            <p className="text-slate-300 text-xl max-w-3xl mx-auto">
              The most innovative prize savings system on Massa blockchain with
              truly autonomous operation
            </p>
          </motion.div>

          <div className="grid md:grid-cols-3 gap-8 max-w-6xl mx-auto">
            {features.map((feature, index) => (
              <motion.div
                key={feature.title}
                initial={{ opacity: 0, y: 40 }}
                whileInView={{ opacity: 1, y: 0 }}
                transition={{ delay: index * 0.15, duration: 0.6 }}
                viewport={{ once: true }}
                whileHover={{ y: -10, transition: { duration: 0.3 } }}
              >
                <Card className="relative group border-2 border-slate-800 bg-gradient-to-br from-slate-900/50 to-slate-800/50 hover:border-blue-500/50 transition-all duration-300 overflow-hidden h-full">
                  {/* Glow effect */}
                  <div
                    className={`absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-500 bg-gradient-to-br ${feature.gradient} blur-xl`}
                  />

                  <CardContent className="relative p-8 text-center">
                    <motion.div
                      className={`mb-6 inline-flex h-16 w-16 items-center justify-center rounded-2xl bg-gradient-to-br ${feature.gradient} shadow-lg`}
                      whileHover={{ rotate: 360, scale: 1.1 }}
                      transition={{ duration: 0.6 }}
                    >
                      <feature.icon className="h-8 w-8 text-white" />
                    </motion.div>
                    <h3 className="mb-3 text-2xl font-bold text-white">
                      {feature.title}
                    </h3>
                    <p className="text-slate-300 leading-relaxed">
                      {feature.description}
                    </p>
                  </CardContent>
                </Card>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 relative overflow-hidden">
        <motion.div
          className="absolute inset-0 bg-gradient-to-r from-blue-600/10 via-purple-600/10 to-pink-600/10"
          animate={{
            backgroundPosition: ["0% 50%", "100% 50%", "0% 50%"],
          }}
          transition={{
            duration: 10,
            repeat: Infinity,
            ease: "linear",
          }}
        />

        <div className="relative container mx-auto px-4 text-center">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            viewport={{ once: true }}
            className="max-w-3xl mx-auto"
          >
            <motion.div
              animate={{
                scale: [1, 1.05, 1],
              }}
              transition={{
                duration: 3,
                repeat: Infinity,
                ease: "easeInOut",
              }}
              className="inline-block mb-6"
            >
              <Trophy className="w-16 h-16 text-yellow-400" />
            </motion.div>

            <h2 className="text-4xl md:text-5xl font-bold mb-6">
              <span className="bg-gradient-to-r from-yellow-300 via-orange-300 to-pink-300 bg-clip-text text-transparent">
                Ready to Win Big Prizes?
              </span>
            </h2>
            <p className="text-slate-200 mb-10 text-2xl font-medium">
              200 MAS prize pool waiting • Weekly automatic draws • Join now!
            </p>

            <Link to="/vault">
              <Button
                size="lg"
                className="group px-16 py-8 text-2xl font-bold bg-gradient-to-r from-yellow-500 via-orange-500 to-pink-600 hover:from-yellow-400 hover:via-orange-400 hover:to-pink-500 transition-all duration-300 hover:scale-110 hover:shadow-2xl hover:shadow-orange-500/60 animate-pulse hover:animate-none"
              >
                <Trophy className="mr-3 h-7 w-7 group-hover:rotate-180 transition-transform duration-500" />
                Launch AutoPrize Vault
                <ArrowRight className="ml-3 h-7 w-7 group-hover:translate-x-3 transition-transform" />
              </Button>
            </Link>
          </motion.div>
        </div>
      </section>
    </div>
  );
};

export default Index;
