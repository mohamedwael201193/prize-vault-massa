import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { motion } from "framer-motion";
import { ArrowRight, Github, Shield, Target, Zap } from "lucide-react";
import { Link } from "react-router-dom";

const About = () => {
  const features = [
    {
      icon: Zap,
      title: "Fully Autonomous",
      description:
        "Draws run automatically every 7 days with $0/month cost. Powered by Massa's revolutionary autonomous smart contracts - no manual triggers needed!",
      gradient: "from-yellow-500 to-orange-500",
    },
    {
      icon: Shield,
      title: "100% No-Loss",
      description:
        "Your deposits are completely safe. Win prizes from the prize pool while your principal remains untouched. Withdraw anytime with zero penalties.",
      gradient: "from-green-500 to-emerald-500",
    },
    {
      icon: Target,
      title: "Verifiable Fairness",
      description:
        "Every draw uses on-chain randomness from Massa blockchain data. Completely transparent and verifiable by anyone - no manipulation possible.",
      gradient: "from-blue-500 to-purple-500",
    },
  ];

  return (
    <div className="min-h-screen bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950 relative overflow-hidden">
      {/* Animated Background Orbs */}
      <motion.div
        className="absolute top-20 -left-40 w-80 h-80 bg-blue-500/20 rounded-full blur-3xl"
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
        className="absolute bottom-20 -right-40 w-80 h-80 bg-purple-500/20 rounded-full blur-3xl"
        animate={{
          scale: [1.2, 1, 1.2],
          opacity: [0.5, 0.3, 0.5],
        }}
        transition={{
          duration: 8,
          repeat: Infinity,
          ease: "easeInOut",
        }}
      />

      <div className="container mx-auto px-4 py-20 relative z-10">
        {/* Hero */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8 }}
          className="text-center mb-16"
        >
          <motion.div
            className="inline-flex items-center justify-center w-20 h-20 rounded-2xl bg-gradient-to-br from-blue-500 to-purple-600 mb-6"
            whileHover={{ scale: 1.1, rotate: 5 }}
            transition={{ type: "spring", stiffness: 400 }}
          >
            <Shield className="h-10 w-10 text-white" />
          </motion.div>

          <h1 className="text-5xl md:text-7xl font-bold mb-6 bg-gradient-to-r from-yellow-300 via-orange-300 to-pink-400 bg-clip-text text-transparent">
            About AutoPrize Vault
          </h1>

          <p className="text-2xl text-slate-200 max-w-4xl mx-auto leading-relaxed mb-4 font-medium">
            The first fully autonomous no-loss lottery on Massa blockchain
          </p>

          <p className="text-xl text-slate-300 max-w-3xl mx-auto leading-relaxed">
            AutoPrize Vault revolutionizes prize savings by combining Massa's
            autonomous smart contracts with verifiable on-chain randomness.
            Deposit MAS, participate in weekly draws with 200 MAS prize pool,
            and never risk losing your principal. Zero maintenance cost,
            complete transparency.
          </p>
        </motion.div>

        {/* Features */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.2 }}
          className="grid md:grid-cols-3 gap-8 mb-16"
        >
          {features.map((feature, index) => (
            <motion.div
              key={feature.title}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: index * 0.1 + 0.3 }}
              whileHover={{ y: -10 }}
            >
              <Card className="relative overflow-hidden border-slate-800 bg-slate-900/50 backdrop-blur">
                <div
                  className={`absolute top-0 left-0 right-0 h-1 bg-gradient-to-r ${feature.gradient}`}
                />
                <CardContent className="p-8">
                  <motion.div
                    className={`inline-flex items-center justify-center w-16 h-16 rounded-xl bg-gradient-to-r ${feature.gradient} mb-6`}
                    whileHover={{ rotate: 360, scale: 1.1 }}
                    transition={{ duration: 0.6 }}
                  >
                    <feature.icon className="h-8 w-8 text-white" />
                  </motion.div>
                  <h3 className="text-2xl font-bold mb-4 text-white">
                    {feature.title}
                  </h3>
                  <p className="text-slate-400 leading-relaxed">
                    {feature.description}
                  </p>
                </CardContent>
              </Card>
            </motion.div>
          ))}
        </motion.div>

        {/* Stats */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.6 }}
          className="mb-16"
        >
          <Card className="border-slate-800 bg-slate-900/50 backdrop-blur">
            <CardContent className="p-8">
              <div className="grid md:grid-cols-3 gap-8">
                <div className="text-center">
                  <motion.div
                    className="text-4xl md:text-5xl font-bold bg-gradient-to-r from-blue-400 to-cyan-400 bg-clip-text text-transparent mb-2"
                    whileHover={{ scale: 1.1 }}
                  >
                    160
                  </motion.div>
                  <div className="text-slate-400">Total Value Locked (MAS)</div>
                </div>
                <div className="text-center">
                  <motion.div
                    className="text-4xl md:text-5xl font-bold bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent mb-2"
                    whileHover={{ scale: 1.1 }}
                  >
                    3
                  </motion.div>
                  <div className="text-slate-400">Risk Tiers Available</div>
                </div>
                <div className="text-center">
                  <motion.div
                    className="text-4xl md:text-5xl font-bold bg-gradient-to-r from-orange-400 to-red-400 bg-clip-text text-transparent mb-2"
                    whileHover={{ scale: 1.1 }}
                  >
                    22.75
                  </motion.div>
                  <div className="text-slate-400">Current Prize Pool (MAS)</div>
                </div>
              </div>
            </CardContent>
          </Card>
        </motion.div>

        {/* CTA */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.8 }}
          className="text-center"
        >
          <Card className="border-slate-800 bg-slate-900/50 backdrop-blur">
            <CardContent className="p-12">
              <h2 className="text-3xl md:text-4xl font-bold mb-6 text-white">
                Ready to Start Winning?
              </h2>
              <p className="text-lg text-slate-400 mb-8 max-w-2xl mx-auto">
                Join AutoPrize Vault today and start earning prizes while your
                deposits stay 100% safe.
              </p>
              <div className="flex flex-col sm:flex-row gap-4 justify-center">
                <Button size="lg" className="pulse-primary" asChild>
                  <Link to="/vault">
                    Launch Vault
                    <ArrowRight className="ml-2 h-5 w-5" />
                  </Link>
                </Button>
                <Button
                  variant="outline"
                  size="lg"
                  asChild
                  className="border-slate-700 hover:bg-slate-800"
                >
                  <a
                    href="https://github.com/your-repo/autoprize-vault"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="inline-flex items-center"
                  >
                    <Github className="mr-2 h-5 w-5" />
                    View Source
                  </a>
                </Button>
              </div>
            </CardContent>
          </Card>
        </motion.div>
      </div>
    </div>
  );
};

export default About;
