import { Alert, AlertDescription } from '@/components/ui/alert';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog';
import {
    AlertTriangle,
    Clock,
    DollarSign,
    ExternalLink,
    Info,
    Shield,
    Zap
} from 'lucide-react';
import React, { useState } from 'react';

interface FeesAndRisksProps {
  trigger?: React.ReactNode;
}

export function FeesAndRisks({ trigger }: FeesAndRisksProps) {
  const [isOpen, setIsOpen] = useState(false);

  const defaultTrigger = (
    <Button variant="ghost" size="sm" className="text-muted-foreground">
      <Info size={14} className="mr-1" />
      Fees & Risks
    </Button>
  );

  return (
    <Dialog open={isOpen} onOpenChange={setIsOpen}>
      <DialogTrigger asChild>
        {trigger || defaultTrigger}
      </DialogTrigger>
      <DialogContent className="max-w-3xl max-h-[80vh] overflow-y-auto">
        <DialogHeader>
          <DialogTitle className="flex items-center gap-2">
            <Shield className="text-blue-500" size={24} />
            Fees, Risks & Security
          </DialogTitle>
        </DialogHeader>

        <div className="space-y-6">
          {/* Transaction Fees */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-lg">
                <DollarSign className="text-green-500" size={20} />
                Transaction Fees
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-3">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <h4 className="font-medium">Standard Operations</h4>
                  <div className="text-sm space-y-1">
                    <div className="flex justify-between">
                      <span>Deposit:</span>
                      <Badge variant="outline">~0.01 MAS</Badge>
                    </div>
                    <div className="flex justify-between">
                      <span>Withdraw:</span>
                      <Badge variant="outline">~0.01 MAS</Badge>
                    </div>
                    <div className="flex justify-between">
                      <span>Vote:</span>
                      <Badge variant="outline">~0.01 MAS</Badge>
                    </div>
                  </div>
                </div>
                <div className="space-y-2">
                  <h4 className="font-medium">Governance</h4>
                  <div className="text-sm space-y-1">
                    <div className="flex justify-between">
                      <span>Create Proposal:</span>
                      <Badge variant="outline">~0.01 MAS</Badge>
                    </div>
                    <div className="flex justify-between">
                      <span>Execute Proposal:</span>
                      <Badge variant="outline">~0.01 MAS</Badge>
                    </div>
                  </div>
                </div>
              </div>
              <Alert>
                <Info className="h-4 w-4" />
                <AlertDescription>
                  Fees are paid to Massa network validators and may vary based on network congestion.
                  BuildNet fees are typically very low.
                </AlertDescription>
              </Alert>
            </CardContent>
          </Card>

          {/* Security & Risks */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-lg">
                <AlertTriangle className="text-orange-500" size={20} />
                Risks & Security
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <Alert variant="destructive">
                <AlertTriangle className="h-4 w-4" />
                <AlertDescription>
                  <strong>Important:</strong> AutoPrize Vault is experimental software on BuildNet (testnet). 
                  Never deposit more than you can afford to lose.
                </AlertDescription>
              </Alert>

              <div className="space-y-3">
                <div>
                  <h4 className="font-medium text-red-600 mb-2">Smart Contract Risks</h4>
                  <ul className="text-sm space-y-1 text-muted-foreground">
                    <li>• Smart contracts may contain bugs or vulnerabilities</li>
                    <li>• Code has not been audited by third parties</li>
                    <li>• Autonomous operation means no admin can fix issues</li>
                  </ul>
                </div>

                <div>
                  <h4 className="font-medium text-yellow-600 mb-2">Network Risks</h4>
                  <ul className="text-sm space-y-1 text-muted-foreground">
                    <li>• BuildNet is a testing network, not mainnet</li>
                    <li>• Network may be reset or experience downtime</li>
                    <li>• TestMAS has no real economic value</li>
                  </ul>
                </div>

                <div>
                  <h4 className="font-medium text-blue-600 mb-2">Protocol Risks</h4>
                  <ul className="text-sm space-y-1 text-muted-foreground">
                    <li>• No guaranteed returns or prize winnings</li>
                    <li>• Prize pool depends on yield generation</li>
                    <li>• Governance changes could affect vault parameters</li>
                  </ul>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* How It Works */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-lg">
                <Zap className="text-purple-500" size={20} />
                How Prizes Work
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-3">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  <h4 className="font-medium mb-2">Prize Generation</h4>
                  <p className="text-sm text-muted-foreground mb-2">
                    Prizes are funded by yield generated from deposited assets. Currently uses mock yield for demonstration.
                  </p>
                  <Badge variant="secondary">Mock: 0.1 MAS per tick</Badge>
                </div>
                <div>
                  <h4 className="font-medium mb-2">Winner Selection</h4>
                  <p className="text-sm text-muted-foreground mb-2">
                    Winners are selected using provably fair on-chain randomness. More shares = higher chance to win.
                  </p>
                  <Badge variant="secondary">Proportional to shares</Badge>
                </div>
              </div>

              <Alert>
                <Clock className="h-4 w-4" />
                <AlertDescription>
                  Draws happen automatically via Autonomous Smart Contracts (ASC). 
                  No human intervention required!
                </AlertDescription>
              </Alert>
            </CardContent>
          </Card>

          {/* Best Practices */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-lg">
                <Shield className="text-green-500" size={20} />
                Best Practices
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  <h4 className="font-medium mb-2">Safety Tips</h4>
                  <ul className="text-sm space-y-1 text-muted-foreground">
                    <li>• Only deposit amounts you can afford to lose</li>
                    <li>• Verify contract addresses match official ones</li>
                    <li>• Keep your wallet software up to date</li>
                    <li>• Never share your private keys</li>
                  </ul>
                </div>
                <div>
                  <h4 className="font-medium mb-2">Getting Help</h4>
                  <div className="space-y-2">
                    <Button 
                      variant="ghost" 
                      size="sm" 
                      onClick={() => window.open('https://discord.gg/massa', '_blank')}
                      className="w-full justify-start"
                    >
                      <ExternalLink size={14} className="mr-1" />
                      Massa Discord
                    </Button>
                    <Button 
                      variant="ghost" 
                      size="sm" 
                      onClick={() => window.open('https://docs.massa.net', '_blank')}
                      className="w-full justify-start"
                    >
                      <ExternalLink size={14} className="mr-1" />
                      Documentation
                    </Button>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>

          <div className="flex justify-end pt-4">
            <Button onClick={() => setIsOpen(false)}>
              I Understand
            </Button>
          </div>
        </div>
      </DialogContent>
    </Dialog>
  );
}