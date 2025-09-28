import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { motion } from "framer-motion";
import {
    AlertTriangle,
    ArrowRight,
    Info,
    Lock,
    Shield,
    Target,
    Zap
} from "lucide-react";
import { Link } from "react-router-dom";

const About = () => {

  const risks = [
    {
      title: "Smart Contract Risk",
      description: "Smart contracts are immutable code that may contain unforeseen bugs or vulnerabilities. While thoroughly tested, no code is 100% risk-free.",
      severity: "medium"
    },
    {
      title: "Massa Network Risk", 
      description: "Protocol depends on Massa BuildNet blockchain infrastructure. Network congestion, forks, or technical issues could temporarily affect operations or transaction processing.",
      severity: "low"
    },
    {
      title: "Yield Variability Risk",
      description: "Yield generation fluctuates based on market conditions and algorithmic performance. Prize pools may vary significantly between periods based on yield generation success.",
      severity: "medium"
    },
    {
      title: "Governance Risk",
      description: "Community governance decisions could potentially modify protocol parameters in ways that affect user experience or economic incentives through democratic voting processes.",
      severity: "low"
    }
  ];

  const technicalDetails = [
    {
      title: "Massa On-Chain Randomness",
      description: "Prize selection utilizes Massa blockchain's native cryptographically secure randomness system combined with block hashes to generate verifiable, tamper-proof random numbers. All selections are publicly auditable and mathematically fair."
    },
    {
      title: "Algorithmic Yield Generation", 
      description: "The smart contract employs automated yield generation strategies optimized for the Massa ecosystem. Yield is generated through secure, algorithmic methods with all operations transparently recorded on-chain."
    },
    {
      title: "Governance & Community Control",
      description: "Complete on-chain governance system allows community members to create proposals, vote on protocol changes, and collectively manage prize schedules, yield parameters, and future development through democratic consensus."
    },
    {
      title: "Non-Custodial Security Model",
      description: "Users maintain complete ownership of their deposits through non-custodial smart contract architecture. No centralized operators, admin keys, or trusted intermediaries can access or control user funds."
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
    <>
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
            A community-governed, no-loss prize savings protocol built on Massa blockchain. Understanding the technology, governance, security features, and transparent operations behind decentralized prize distribution.
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
                  AutoPrize Vault is a fully decentralized, community-governed application deployed on Massa BuildNet that implements 
                  a no-loss prize savings protocol with transparent governance. Users deposit MAS tokens into a non-custodial smart contract 
                  that automatically generates yield while preserving 100% capital protection.
                </p>
                <p>
                  100% of generated yield flows into a community prize pool distributed weekly via Massa's cryptographically secure on-chain randomness. 
                  The protocol features complete governance functionality where token holders can create proposals, vote on protocol changes, 
                  and collectively manage the ecosystem's future development.
                </p>
                <p>
                  Smart contract address: <code className="bg-muted px-2 py-1 rounded text-xs">AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz</code>
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
                    title: "Cryptographic Principal Protection",
                    description: "100% principal protection through immutable smart contract logic. Deposits are cryptographically secured and never at risk - only generated yield becomes prizes."
                  },
                  {
                    icon: Zap,
                    title: "Fully Decentralized Operation",
                    description: "Zero admin keys, no centralized operators, no trusted intermediaries. Complete autonomy through smart contracts with community governance for protocol evolution."
                  },
                  {
                    icon: Target,
                    title: "Massa Native Randomness",
                    description: "Prize selection uses Massa's built-in cryptographically secure on-chain randomness. All selections are mathematically verifiable and publicly auditable."
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

        {/* CTA */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.4 }}
          className="text-center"
        >
          <Card className="card-shadow">
            <CardContent className="p-8">
              <h2 className="text-2xl font-bold mb-4">Ready to Join the Community?</h2>
              <p className="text-muted-foreground mb-6 max-w-2xl mx-auto">
                By using AutoPrize Vault, you join a decentralized community earning prizes while maintaining full control of your assets. 
                You acknowledge understanding the technology, governance model, and associated risks of this autonomous protocol.
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
    </>
  );
};

export default About;