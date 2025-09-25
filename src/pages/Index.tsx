import { useState } from "react";
import { motion } from "framer-motion";
import { Link } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import { Navigation } from "@/components/shared/Navigation";
import { Shield, Zap, Coins, ArrowRight, Lock, TrendingUp } from "lucide-react";
import heroImage from "@/assets/hero-vault.jpg";

const Index = () => {
  const [isWalletConnected, setIsWalletConnected] = useState(false);

  const handleConnectWallet = () => {
    // Mock wallet connection
    setIsWalletConnected(!isWalletConnected);
  };

  const badges = [
    { icon: Shield, label: "Autonomous ASC", color: "bg-primary" },
    { icon: Zap, label: "DeWeb Frontend", color: "bg-secondary" },
    { icon: Coins, label: "No-Loss Prizes", color: "bg-success" }
  ];

  const features = [
    {
      icon: Lock,
      title: "Principal Protected",
      description: "Your deposits are always safe and withdrawable anytime"
    },
    {
      icon: TrendingUp,
      title: "Yield Generation",
      description: "Deposits automatically earn yield through Massa DeFi protocols"
    },
    {
      icon: Coins,
      title: "Weekly Prizes",
      description: "All yield becomes prizes distributed to random participants"
    }
  ];

  return (
    <div className="min-h-screen bg-background">
      <Navigation
        onConnectWallet={handleConnectWallet}
        isWalletConnected={isWalletConnected}
      />

      {/* Hero Section */}
      <section className="relative overflow-hidden">
        <div className="absolute inset-0 hero-gradient" />
        <div 
          className="absolute inset-0 parallax-element opacity-10"
          style={{
            backgroundImage: `url(${heroImage})`,
            backgroundSize: "cover",
            backgroundPosition: "center"
          }}
        />
        
        <div className="relative z-10 container mx-auto px-4 py-20 text-center">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
            className="max-w-4xl mx-auto"
          >
            <div className="flex flex-wrap gap-3 justify-center mb-8">
              {badges.map((badge, index) => (
                <motion.div
                  key={badge.label}
                  initial={{ opacity: 0, scale: 0.9 }}
                  animate={{ opacity: 1, scale: 1 }}
                  transition={{ delay: index * 0.1, duration: 0.5 }}
                >
                  <Badge className={`${badge.color} text-white py-2 px-4 text-sm font-medium`}>
                    <badge.icon className="mr-2 h-4 w-4" />
                    {badge.label}
                  </Badge>
                </motion.div>
              ))}
            </div>

            <h1 className="mb-6 text-4xl font-bold leading-tight sm:text-5xl md:text-6xl">
              Autonomous No-Loss Prizes
              <span className="gradient-text block">on Massa</span>
            </h1>

            <p className="mx-auto mb-8 max-w-2xl text-lg text-muted-foreground sm:text-xl">
              Your deposits earn yield. The yield becomes weekly prizes. 
              Principal stays safe and withdrawable.
            </p>

            <div className="flex flex-col gap-4 sm:flex-row sm:justify-center">
              <Button size="lg" className="pulse-primary text-lg px-8 py-3" asChild>
                <Link to="/vault">
                  Deposit MAS
                  <ArrowRight className="ml-2 h-5 w-5" />
                </Link>
              </Button>
              <Button variant="outline" size="lg" className="text-lg px-8 py-3" asChild>
                <Link to="/how-it-works">How it Works</Link>
              </Button>
            </div>
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
            className="text-center mb-12"
          >
            <h2 className="text-3xl font-bold mb-4">
              Save. Earn. Win.
              <span className="gradient-text"> Forever.</span>
            </h2>
            <p className="text-muted-foreground text-lg max-w-2xl mx-auto">
              No bots, no keepers. Fully autonomous prize distribution powered by Massa smart contracts.
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
                <Card className="card-shadow border-border/50 hover:border-primary/50 transition-colors">
                  <CardContent className="p-6 text-center">
                    <div className="mb-4 inline-flex h-12 w-12 items-center justify-center rounded-lg bg-primary/10">
                      <feature.icon className="h-6 w-6 text-primary" />
                    </div>
                    <h3 className="mb-2 text-xl font-semibold">{feature.title}</h3>
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
            <h2 className="text-3xl font-bold mb-4">Ready to Start Winning?</h2>
            <p className="text-muted-foreground mb-8 text-lg">
              Join the autonomous prize pool and turn your savings into opportunities.
            </p>
            <Button size="lg" className="pulse-primary text-lg px-8 py-3" asChild>
              <Link to="/vault">
                Launch Vault
                <ArrowRight className="ml-2 h-5 w-5" />
              </Link>
            </Button>
          </motion.div>
        </div>
      </section>
    </div>
  );
};

export default Index;