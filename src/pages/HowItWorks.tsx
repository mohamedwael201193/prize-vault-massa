import { motion } from "framer-motion";
import { Navigation } from "@/components/shared/Navigation";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Link } from "react-router-dom";
import { 
  Wallet, 
  TrendingUp, 
  Trophy, 
  Shield, 
  Zap, 
  Clock,
  ArrowRight,
  CheckCircle
} from "lucide-react";
import { useState } from "react";

const HowItWorks = () => {
  const [isWalletConnected, setIsWalletConnected] = useState(false);

  const handleConnectWallet = () => {
    setIsWalletConnected(!isWalletConnected);
  };

  const steps = [
    {
      icon: Wallet,
      title: "Deposit MAS Tokens",
      description: "Connect your wallet and deposit any amount of MAS tokens into the autonomous vault. Your principal is always safe and withdrawable.",
      details: [
        "No minimum deposit required",
        "Instant deposits via smart contract",
        "Funds remain in your control"
      ]
    },
    {
      icon: TrendingUp,
      title: "Earn Yield Automatically", 
      description: "Your deposits are automatically deployed to earn yield through Massa's DeFi protocols. All yield generation is handled by the smart contract.",
      details: [
        "Automated yield strategies",
        "No manual management needed", 
        "Transparent on-chain operations"
      ]
    },
    {
      icon: Trophy,
      title: "Win Prizes Weekly",
      description: "All earned yield becomes the prize pool. Every Friday, winners are selected via verifiable randomness. The more you deposit, the higher your odds.",
      details: [
        "Weekly prize distributions",
        "Provably fair randomness",
        "Proportional winning chances"
      ]
    }
  ];

  const features = [
    {
      icon: Shield,
      title: "No-Loss Guarantee",
      description: "Your principal deposit is never at risk. Only the yield becomes prizes."
    },
    {
      icon: Zap,
      title: "Autonomous Operation", 
      description: "No bots, no keepers. Everything runs automatically via smart contracts."
    },
    {
      icon: Clock,
      title: "Instant Withdrawals",
      description: "Withdraw your principal anytime with no fees or penalties."
    }
  ];

  return (
    <div className="min-h-screen bg-background">
      <Navigation
        onConnectWallet={handleConnectWallet}
        isWalletConnected={isWalletConnected}
      />

      {/* Hero Section */}
      <section className="py-20 border-b border-border/50">
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
            className="text-center max-w-3xl mx-auto"
          >
            <h1 className="text-4xl font-bold mb-6 sm:text-5xl">
              How <span className="gradient-text">AutoPrize Vault</span> Works
            </h1>
            <p className="text-xl text-muted-foreground mb-8">
              Three simple steps to start earning prizes while keeping your savings safe.
            </p>
            <Badge className="bg-primary/10 text-primary mb-8">
              No bots, no keepers - fully autonomous
            </Badge>
          </motion.div>
        </div>
      </section>

      {/* Steps Section */}
      <section className="py-20">
        <div className="container mx-auto px-4">
          <div className="max-w-4xl mx-auto">
            {steps.map((step, index) => (
              <motion.div
                key={step.title}
                initial={{ opacity: 0, x: index % 2 === 0 ? -50 : 50 }}
                whileInView={{ opacity: 1, x: 0 }}
                transition={{ duration: 0.6, delay: index * 0.2 }}
                viewport={{ once: true }}
                className="relative"
              >
                {/* Connector Line */}
                {index < steps.length - 1 && (
                  <div className="absolute left-6 top-20 h-20 w-px bg-gradient-to-b from-primary to-transparent hidden md:block" />
                )}

                <div className="flex flex-col md:flex-row gap-8 mb-16">
                  {/* Icon & Number */}
                  <div className="flex-shrink-0">
                    <div className="relative">
                      <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-primary glow-primary">
                        <step.icon className="h-6 w-6 text-primary-foreground" />
                      </div>
                      <div className="absolute -top-2 -right-2 flex h-6 w-6 items-center justify-center rounded-full bg-secondary text-xs font-bold text-secondary-foreground">
                        {index + 1}
                      </div>
                    </div>
                  </div>

                  {/* Content */}
                  <Card className="flex-1 card-shadow">
                    <CardContent className="p-6">
                      <h3 className="text-2xl font-bold mb-3">{step.title}</h3>
                      <p className="text-muted-foreground mb-4 text-lg">
                        {step.description}
                      </p>
                      <ul className="space-y-2">
                        {step.details.map((detail, detailIndex) => (
                          <li key={detailIndex} className="flex items-center gap-2 text-sm">
                            <CheckCircle className="h-4 w-4 text-success" />
                            {detail}
                          </li>
                        ))}
                      </ul>
                    </CardContent>
                  </Card>
                </div>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Features Grid */}
      <section className="py-20 bg-muted/20">
        <div className="container mx-auto px-4">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            viewport={{ once: true }}
            className="text-center mb-12"
          >
            <h2 className="text-3xl font-bold mb-4">
              Why Choose <span className="gradient-text">AutoPrize Vault</span>?
            </h2>
            <p className="text-muted-foreground text-lg">
              Built for security, designed for simplicity.
            </p>
          </motion.div>

          <div className="grid md:grid-cols-3 gap-8 max-w-5xl mx-auto">
            {features.map((feature, index) => (
              <motion.div
                key={feature.title}
                initial={{ opacity: 0, y: 30 }}
                whileInView={{ opacity: 1, y: 0 }}
                transition={{ delay: index * 0.1, duration: 0.6 }}
                viewport={{ once: true }}
              >
                <Card className="h-full card-shadow border-border/50 hover:border-primary/30 transition-colors">
                  <CardContent className="p-6 text-center">
                    <div className="mb-4 inline-flex h-12 w-12 items-center justify-center rounded-lg bg-primary/10">
                      <feature.icon className="h-6 w-6 text-primary" />
                    </div>
                    <h3 className="mb-3 text-xl font-semibold">{feature.title}</h3>
                    <p className="text-muted-foreground">{feature.description}</p>
                  </CardContent>
                </Card>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="py-20 border-t border-border/50">
        <div className="container mx-auto px-4 text-center">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            whileInView={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            viewport={{ once: true }}
          >
            <h2 className="text-3xl font-bold mb-4">Ready to Start Earning Prizes?</h2>
            <p className="text-muted-foreground mb-8 text-lg max-w-2xl mx-auto">
              Join hundreds of users already earning autonomous prizes while keeping their savings safe.
            </p>
            <div className="flex flex-col sm:flex-row gap-4 justify-center">
              <Button size="lg" className="pulse-primary text-lg px-8 py-3" asChild>
                <Link to="/vault">
                  Enter Vault
                  <ArrowRight className="ml-2 h-5 w-5" />
                </Link>
              </Button>
              <Button variant="outline" size="lg" className="text-lg px-8 py-3" asChild>
                <Link to="/verify">Verify Smart Contract</Link>
              </Button>
            </div>
          </motion.div>
        </div>
      </section>
    </div>
  );
};

export default HowItWorks;