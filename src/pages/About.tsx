import { motion } from "framer-motion";
import { Navigation } from "@/components/shared/Navigation";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Link } from "react-router-dom";
import { 
  Shield, 
  AlertTriangle, 
  Info, 
  ExternalLink, 
  Lock,
  Zap,
  Target,
  ArrowRight
} from "lucide-react";
import { useState } from "react";

const About = () => {
  const [isWalletConnected, setIsWalletConnected] = useState(false);

  const handleConnectWallet = () => {
    setIsWalletConnected(!isWalletConnected);
  };

  const risks = [
    {
      title: "Smart Contract Risk",
      description: "While audited, smart contracts may contain bugs or vulnerabilities that could affect your funds.",
      severity: "medium"
    },
    {
      title: "Massa Network Risk", 
      description: "AutoPrize Vault depends on the Massa blockchain. Network issues could temporarily affect operations.",
      severity: "low"
    },
    {
      title: "Yield Generation Risk",
      description: "Yield comes from DeFi protocols which carry inherent risks including potential loss of yield.",
      severity: "medium"
    },
    {
      title: "Randomness Assumptions",
      description: "Prize distribution relies on pseudo-random number generation which, while secure, is not truly random.",
      severity: "low"
    }
  ];

  const technicalDetails = [
    {
      title: "Pseudo-Random Number Generation",
      description: "AutoPrize Vault uses Massa's built-in randomness beacon combined with block hashes to generate verifiable random numbers for prize selection. This ensures fairness while remaining deterministic for verification."
    },
    {
      title: "Yield Strategy", 
      description: "Deposits are automatically allocated to audited DeFi protocols on Massa including lending platforms and liquidity mining. The smart contract optimizes yield while maintaining security."
    },
    {
      title: "Prize Distribution Algorithm",
      description: "Winners are selected proportionally based on their ticket count (1 ticket = 1 MAS deposited). The algorithm ensures statistical fairness over time while preventing manipulation."
    }
  ];

  const getSeverityColor = (severity: string) => {
    switch (severity) {
      case "high": return "bg-destructive/10 text-destructive border-destructive/30";
      case "medium": return "bg-yellow-500/10 text-yellow-600 border-yellow-500/30";
      case "low": return "bg-muted/10 text-muted-foreground border-muted/30";
      default: return "bg-muted/10 text-muted-foreground border-muted/30";
    }
  };

  return (
    <div className="min-h-screen bg-background">
      <Navigation
        onConnectWallet={handleConnectWallet}
        isWalletConnected={isWalletConnected}
      />

      <div className="container mx-auto px-4 py-8">
        {/* Header */}
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
          className="text-center mb-8"
        >
          <h1 className="text-4xl font-bold mb-4">
            About <span className="gradient-text">AutoPrize Vault</span>
          </h1>
          <p className="text-muted-foreground text-lg max-w-2xl mx-auto">
            Understanding how AutoPrize Vault works, the risks involved, and the technology behind autonomous prize distribution.
          </p>
        </motion.div>

        {/* How It Works Technical */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.1 }}
          className="mb-8"
        >
          <Card className="card-shadow">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Info className="h-5 w-5 text-primary" />
                Technical Overview
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-6">
              <div className="prose prose-sm max-w-none text-muted-foreground">
                <p>
                  AutoPrize Vault is a decentralized application built on the Massa blockchain that implements 
                  a no-loss prize savings protocol. Users deposit MAS tokens which are automatically deployed 
                  to generate yield through various DeFi strategies.
                </p>
                <p>
                  100% of the generated yield is pooled and distributed as prizes to randomly selected participants 
                  every week. The selection process uses verifiable randomness to ensure fairness and prevent 
                  manipulation.
                </p>
              </div>

              <div className="grid gap-4">
                {technicalDetails.map((detail, index) => (
                  <motion.div
                    key={detail.title}
                    initial={{ opacity: 0, x: -20 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ delay: index * 0.1 }}
                    className="p-4 bg-muted/20 rounded-lg"
                  >
                    <h4 className="font-medium mb-2">{detail.title}</h4>
                    <p className="text-sm text-muted-foreground">{detail.description}</p>
                  </motion.div>
                ))}
              </div>
            </CardContent>
          </Card>
        </motion.div>

        {/* Risk Disclosure */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.2 }}
          className="mb-8"
        >
          <Card className="card-shadow border-yellow-500/20">
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-yellow-600">
                <AlertTriangle className="h-5 w-5" />
                Risk Disclosure
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="bg-yellow-500/10 border border-yellow-500/20 rounded-lg p-4">
                <p className="text-sm text-yellow-700 dark:text-yellow-300 font-medium">
                  ⚠️ Important: Please read and understand these risks before using AutoPrize Vault
                </p>
              </div>

              <div className="grid gap-4">
                {risks.map((risk, index) => (
                  <motion.div
                    key={risk.title}
                    initial={{ opacity: 0, x: -20 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ delay: index * 0.1 }}
                    className="flex gap-4 p-4 border rounded-lg"
                  >
                    <div className="flex-shrink-0 pt-1">
                      <Badge className={getSeverityColor(risk.severity)}>
                        {risk.severity}
                      </Badge>
                    </div>
                    <div>
                      <h4 className="font-medium mb-1">{risk.title}</h4>
                      <p className="text-sm text-muted-foreground">{risk.description}</p>
                    </div>
                  </motion.div>
                ))}
              </div>

              <div className="mt-6 p-4 bg-muted/20 rounded-lg">
                <p className="text-sm text-muted-foreground">
                  <strong>Disclaimer:</strong> AutoPrize Vault is experimental software. Never deposit more than you can afford to lose. 
                  The protocol is provided "as is" without warranties of any kind.
                </p>
              </div>
            </CardContent>
          </Card>
        </motion.div>

        {/* Security Features */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.3 }}
          className="mb-8"
        >
          <Card className="card-shadow">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Shield className="h-5 w-5 text-success" />
                Security Features
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid md:grid-cols-3 gap-6">
                {[
                  {
                    icon: Lock,
                    title: "Principal Protection",
                    description: "Your deposits are never used as prizes - only the yield is at risk."
                  },
                  {
                    icon: Zap,
                    title: "Autonomous Operation",
                    description: "No admin keys or centralized control - everything runs via smart contracts."
                  },
                  {
                    icon: Target,
                    title: "Verifiable Randomness",
                    description: "All random selections can be independently verified on-chain."
                  }
                ].map((feature, index) => (
                  <motion.div
                    key={feature.title}
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: index * 0.1 }}
                    className="text-center"
                  >
                    <div className="mb-3 inline-flex h-10 w-10 items-center justify-center rounded-lg bg-success/10">
                      <feature.icon className="h-5 w-5 text-success" />
                    </div>
                    <h3 className="font-medium mb-2">{feature.title}</h3>
                    <p className="text-sm text-muted-foreground">{feature.description}</p>
                  </motion.div>
                ))}
              </div>
            </CardContent>
          </Card>
        </motion.div>

        {/* External Links */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.4 }}
          className="mb-8"
        >
          <Card className="card-shadow">
            <CardHeader>
              <CardTitle>Additional Resources</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid sm:grid-cols-2 gap-4">
                {[
                  { title: "Security Audit Report", url: "#", desc: "Independent security assessment" },
                  { title: "Source Code", url: "#", desc: "View on GitHub" },
                  { title: "Massa Documentation", url: "#", desc: "Learn about Massa blockchain" },
                  { title: "Bug Bounty Program", url: "#", desc: "Report vulnerabilities" }
                ].map((link) => (
                  <Button
                    key={link.title}
                    variant="outline"
                    className="h-auto p-4 text-left justify-start"
                    asChild
                  >
                    <a href={link.url} target="_blank" rel="noopener noreferrer">
                      <div className="flex items-center gap-3">
                        <ExternalLink className="h-4 w-4 flex-shrink-0" />
                        <div>
                          <div className="font-medium">{link.title}</div>
                          <div className="text-xs text-muted-foreground">{link.desc}</div>
                        </div>
                      </div>
                    </a>
                  </Button>
                ))}
              </div>
            </CardContent>
          </Card>
        </motion.div>

        {/* CTA */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.5 }}
          className="text-center"
        >
          <Card className="card-shadow">
            <CardContent className="p-8">
              <h2 className="text-2xl font-bold mb-4">Ready to Get Started?</h2>
              <p className="text-muted-foreground mb-6 max-w-md mx-auto">
                By using AutoPrize Vault, you acknowledge that you understand the risks and technology involved.
              </p>
              <div className="flex flex-col sm:flex-row gap-4 justify-center">
                <Button size="lg" className="pulse-primary" asChild>
                  <Link to="/vault">
                    Enter Vault
                    <ArrowRight className="ml-2 h-5 w-5" />
                  </Link>
                </Button>
                <Button variant="outline" size="lg" asChild>
                  <Link to="/verify">Verify Contracts</Link>
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