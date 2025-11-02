import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { motion } from "framer-motion";
import { ArrowRight, Clock, Shield, Trophy, Wallet, Zap } from "lucide-react";
import { Link } from "react-router-dom";

const HowItWorks = () => {
  const steps = [
    {
      icon: Wallet,
      title: "1. Deposit MAS",
      description:
        "Connect your Massa wallet and deposit any amount of MAS. Your funds are always safe and withdrawable anytime.",
      gradient: "from-green-500 to-emerald-500",
    },
    {
      icon: Clock,
      title: "2. Automatic Draws",
      description:
        "Every 7 days, the autonomous smart contract runs a fair draw using blockchain randomness. Zero maintenance required.",
      gradient: "from-blue-500 to-purple-500",
    },
    {
      icon: Trophy,
      title: "3. Win Prizes",
      description:
        "Winners are selected fairly and receive prizes instantly. Your deposit stays safe - only the prize pool is distributed!",
      gradient: "from-yellow-500 to-orange-500",
    },
  ];

  const features = [
    {
      icon: Shield,
      title: "100% No-Loss",
      description:
        "Your deposits are never at risk. Withdraw your full amount anytime with no penalties or fees.",
    },
    {
      icon: Zap,
      title: "Fully Autonomous",
      description:
        "Draws run automatically every 7 days with $0/month operational cost thanks to Massa's autonomous smart contracts.",
    },
    {
      icon: Clock,
      title: "Instant Withdrawal",
      description:
        "No lock-up periods or waiting. Access your funds immediately whenever you want.",
    },
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950">
      {/* Hero Section */}
      <section className="relative overflow-hidden py-20">
        <motion.div
          className="absolute top-20 right-20 w-96 h-96 bg-blue-500/10 rounded-full blur-3xl"
          animate={{
            scale: [1, 1.2, 1],
            opacity: [0.2, 0.4, 0.2],
          }}
          transition={{
            duration: 8,
            repeat: Infinity,
            ease: "easeInOut",
          }}
        />

        <div className="relative container mx-auto px-4">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
            className="text-center max-w-3xl mx-auto"
          >
            <h1 className="text-5xl md:text-7xl font-bold mb-6">
              <span className="bg-gradient-to-r from-yellow-300 via-orange-300 to-pink-300 bg-clip-text text-transparent">
                How AutoPrize Works
              </span>
            </h1>
            <p className="text-2xl text-slate-200 mb-4 font-medium">
              The revolutionary no-loss prize savings system
            </p>
            <p className="text-xl text-slate-400">
              Deposit MAS • Win weekly prizes • Withdraw anytime • Never lose
              your deposit
            </p>
          </motion.div>
        </div>
      </section>

      {/* Steps Section */}
      <section className="py-20">
        <div className="container mx-auto px-4">
          <div className="max-w-5xl mx-auto">
            <div className="grid md:grid-cols-3 gap-8">
              {steps.map((step, index) => (
                <motion.div
                  key={step.title}
                  initial={{ opacity: 0, y: 40 }}
                  whileInView={{ opacity: 1, y: 0 }}
                  transition={{ delay: index * 0.2, duration: 0.6 }}
                  viewport={{ once: true }}
                  whileHover={{ y: -10, transition: { duration: 0.3 } }}
                >
                  <Card className="relative group border-2 border-slate-800 bg-gradient-to-br from-slate-900/50 to-slate-800/50 hover:border-blue-500/50 transition-all duration-300 h-full">
                    <div
                      className={`absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-500 bg-gradient-to-br ${step.gradient} blur-xl`}
                    />

                    <CardContent className="relative p-8 text-center">
                      <motion.div
                        className={`mb-6 inline-flex h-20 w-20 items-center justify-center rounded-2xl bg-gradient-to-br ${step.gradient} shadow-lg`}
                        whileHover={{ rotate: 360, scale: 1.1 }}
                        transition={{ duration: 0.6 }}
                      >
                        <step.icon className="h-10 w-10 text-white" />
                      </motion.div>
                      <h3 className="mb-3 text-2xl font-bold text-white">
                        {step.title}
                      </h3>
                      <p className="text-slate-300 leading-relaxed">
                        {step.description}
                      </p>
                    </CardContent>
                  </Card>
                </motion.div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-20 bg-slate-900/30">
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            viewport={{ once: true }}
            className="text-center mb-16"
          >
            <h2 className="text-4xl md:text-5xl font-bold mb-4">
              <span className="bg-gradient-to-r from-white to-slate-300 bg-clip-text text-transparent">
                Why AutoPrize?
              </span>
            </h2>
          </motion.div>

          <div className="grid md:grid-cols-3 gap-8 max-w-5xl mx-auto">
            {features.map((feature, index) => (
              <motion.div
                key={feature.title}
                initial={{ opacity: 0, y: 30 }}
                whileInView={{ opacity: 1, y: 0 }}
                transition={{ delay: index * 0.15, duration: 0.6 }}
                viewport={{ once: true }}
                whileHover={{ scale: 1.05, transition: { duration: 0.2 } }}
              >
                <Card className="border-2 border-slate-800 bg-slate-900/50 hover:border-blue-500/30 transition-all duration-300 h-full">
                  <CardContent className="p-8 text-center">
                    <div className="mb-4 inline-flex h-16 w-16 items-center justify-center rounded-full bg-blue-500/10">
                      <feature.icon className="h-8 w-8 text-blue-400" />
                    </div>
                    <h3 className="mb-3 text-xl font-bold text-white">
                      {feature.title}
                    </h3>
                    <p className="text-slate-300">{feature.description}</p>
                  </CardContent>
                </Card>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20">
        <div className="container mx-auto px-4 text-center">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            viewport={{ once: true }}
            className="max-w-2xl mx-auto"
          >
            <h2 className="text-4xl font-bold mb-6">
              <span className="bg-gradient-to-r from-white via-blue-100 to-white bg-clip-text text-transparent">
                Ready to Start?
              </span>
            </h2>
            <p className="text-slate-300 mb-10 text-lg">
              Join the vault and start winning prizes today
            </p>

            <Link to="/vault">
              <Button
                size="lg"
                className="group px-10 py-6 text-lg font-bold bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-500 hover:to-purple-500 transition-all duration-300 hover:scale-110 hover:shadow-2xl hover:shadow-blue-500/50"
              >
                Launch Vault
                <ArrowRight className="ml-2 h-5 w-5 group-hover:translate-x-2 transition-transform" />
              </Button>
            </Link>
          </motion.div>
        </div>
      </section>
    </div>
  );
};

export default HowItWorks;
