import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { useWallet } from "@/hooks/useWallet";
import { motion } from "framer-motion";
import { Calculator, CheckCircle, Download, RefreshCw, Shield, Zap } from "lucide-react";
import { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";

interface DrawEvent {
  id: number;
  period: number;
  timestamp: string;
  seed: string;
  totalShares: number;
  winnerIndex: number;
  winnerAddress: string;
  prizeAmount: string;
  participants: number;
  blockHash: string;
  entropy: string[];
}

const Fairness = () => {
  const { getPublicProvider } = useWallet();
  const [searchParams] = useSearchParams();
  const [selectedDraw, setSelectedDraw] = useState<DrawEvent | null>(null);
  const [recomputedWinner, setRecomputedWinner] = useState<number | null>(null);
  const [verificationStatus, setVerificationStatus] = useState<'idle' | 'computing' | 'verified' | 'failed'>('idle');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const drawId = searchParams.get('drawId');
    if (drawId) {
      fetchDrawEvent(parseInt(drawId));
    } else {
      fetchLatestDraw();
    }
  }, [searchParams, getPublicProvider]);

  const fetchDrawEvent = async (drawId: number) => {
    try {
      // In real implementation, this would fetch from contract events
      const mockDraw: DrawEvent = {
        id: drawId,
        period: 12345678,
        timestamp: new Date(Date.now() - 2 * 60 * 60 * 1000).toISOString(),
        seed: 'a7f8d9e2c4b1f5a3e8d2c9b6f1a4e7d0c3b8f5a2e9d6c1b4f7a0e3d8c5b2f9a6',
        totalShares: 150,
        winnerIndex: 73,
        winnerAddress: 'AU12345...abcdef',
        prizeAmount: '2.5',
        participants: 42,
        blockHash: 'b3c4f5a1e8d2c9b6f7a0e3d8c5b2f9a6e1d4c7b0f3a8e5d2c9b6f1a4e7d0c3b8',
        entropy: [
          '12345678', // currentPeriod
          '12345677', // period-1  
          '12345676', // period-2
          'a7f8d9e2', // contract entropy
          'c4b1f5a3'  // additional entropy
        ]
      };

      setSelectedDraw(mockDraw);
      setLoading(false);
    } catch (error) {
      console.error('Error fetching draw event:', error);
      setLoading(false);
    }
  };

  const fetchLatestDraw = async () => {
    // Fetch the most recent draw event
    await fetchDrawEvent(10); // Mock latest draw ID
  };

  const recomputeWinner = () => {
    if (!selectedDraw) return;

    setVerificationStatus('computing');
    
    // Simulate computation delay
    setTimeout(() => {
      // Deterministic winner computation matching contract logic
      let entropy = 0;
      
      // Recreate the exact entropy calculation from smart contract
      entropy ^= parseInt(selectedDraw.entropy[0]); // currentPeriod
      entropy ^= (parseInt(selectedDraw.entropy[1]) << 16); // period-1
      entropy ^= (parseInt(selectedDraw.entropy[2]) << 32); // period-2
      entropy ^= parseInt(selectedDraw.entropy[3], 16); // contract entropy
      entropy ^= (parseInt(selectedDraw.entropy[4], 16) << 8); // additional
      
      // Map to winner index
      const winnerIndex = entropy % selectedDraw.totalShares;
      
      setRecomputedWinner(winnerIndex);
      
      if (winnerIndex === selectedDraw.winnerIndex) {
        setVerificationStatus('verified');
      } else {
        setVerificationStatus('failed');
      }
    }, 2000);
  };

  const exportProof = () => {
    if (!selectedDraw) return;

    const proof = {
      drawId: selectedDraw.id,
      period: selectedDraw.period,
      timestamp: selectedDraw.timestamp,
      seed: selectedDraw.seed,
      entropy: {
        components: selectedDraw.entropy,
        calculation: 'entropy = period ^ (period-1)<<16 ^ (period-2)<<32 ^ contractEntropy ^ additionalEntropy<<8'
      },
      totalShares: selectedDraw.totalShares,
      winnerCalculation: {
        formula: 'winnerIndex = entropy % totalShares',
        entropy: `${selectedDraw.entropy.join(' ^ ')}`,
        result: selectedDraw.winnerIndex
      },
      winner: {
        index: selectedDraw.winnerIndex,
        address: selectedDraw.winnerAddress
      },
      verification: {
        recomputed: recomputedWinner,
        matches: recomputedWinner === selectedDraw.winnerIndex,
        timestamp: new Date().toISOString()
      },
      blockchain: {
        contract: 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz',
        network: 'Massa BuildNet',
        explorer: `https://buildnet-explorer.massa.net/period/${selectedDraw.period}`
      }
    };

    const dataStr = JSON.stringify(proof, null, 2);
    const dataUri = 'data:application/json;charset=utf-8,'+ encodeURIComponent(dataStr);
    
    const exportFileDefaultName = `autoprize-fairness-proof-${selectedDraw.id}.json`;
    
    const linkElement = document.createElement('a');
    linkElement.setAttribute('href', dataUri);
    linkElement.setAttribute('download', exportFileDefaultName);
    linkElement.click();
  };

  if (loading) {
    return (
      <div className="container mx-auto px-4 py-8">
        <div className="space-y-6">
          {[...Array(3)].map((_, i) => (
            <div key={i} className="animate-pulse">
              <div className="h-32 bg-muted rounded-lg"></div>
            </div>
          ))}
        </div>
      </div>
    );
  }

  if (!selectedDraw) {
    return (
      <div className="container mx-auto px-4 py-8 text-center">
        <h1 className="text-2xl font-bold mb-4">Draw Not Found</h1>
        <p className="text-muted-foreground">The requested draw could not be loaded.</p>
      </div>
    );
  }

  return (
    <div className="container mx-auto px-4 py-8">
      {/* Header */}
      <motion.div
        initial={{ opacity: 0, y: -20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6 }}
        className="text-center mb-8"
      >
        <h1 className="text-4xl font-bold mb-4">
          Fairness <span className="gradient-text">Verification</span>
        </h1>
        <p className="text-muted-foreground text-lg max-w-2xl mx-auto">
          Verify the cryptographic fairness of prize draws. All randomness is derived from Massa blockchain entropy and is fully reproducible.
        </p>
      </motion.div>

      {/* Draw Information */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6, delay: 0.1 }}
        className="mb-8"
      >
        <Card className="card-shadow border-primary/20">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Shield className="h-5 w-5 text-primary" />
              Draw #{selectedDraw.id} Information
            </CardTitle>
            <p className="text-sm text-muted-foreground">
              Prize draw executed on {new Date(selectedDraw.timestamp).toLocaleString()}
            </p>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
              <div>
                <h4 className="font-medium mb-2">Period</h4>
                <p className="text-2xl font-bold text-primary">{selectedDraw.period}</p>
                <p className="text-xs text-muted-foreground">Blockchain period</p>
              </div>
              <div>
                <h4 className="font-medium mb-2">Participants</h4>
                <p className="text-2xl font-bold text-blue-600">{selectedDraw.participants}</p>
                <p className="text-xs text-muted-foreground">Total participants</p>
              </div>
              <div>
                <h4 className="font-medium mb-2">Prize Amount</h4>
                <p className="text-2xl font-bold text-green-600">{selectedDraw.prizeAmount} MAS</p>
                <p className="text-xs text-muted-foreground">Distributed prize</p>
              </div>
              <div>
                <h4 className="font-medium mb-2">Winner</h4>
                <p className="text-lg font-bold text-purple-600">#{selectedDraw.winnerIndex}</p>
                <p className="text-xs text-muted-foreground font-mono">{selectedDraw.winnerAddress}</p>
              </div>
            </div>
          </CardContent>
        </Card>
      </motion.div>

      {/* Entropy Components */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6, delay: 0.2 }}
        className="mb-8"
      >
        <Card className="card-shadow">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Zap className="h-5 w-5 text-yellow-500" />
              Randomness Components
            </CardTitle>
            <p className="text-sm text-muted-foreground">
              Cryptographic entropy sources used for winner selection
            </p>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="space-y-3">
                  <h4 className="font-medium">Blockchain Entropy</h4>
                  <div className="space-y-2 text-sm">
                    <div className="flex justify-between">
                      <span>Current Period:</span>
                      <code className="bg-muted px-2 py-1 rounded">{selectedDraw.entropy[0]}</code>
                    </div>
                    <div className="flex justify-between">
                      <span>Period - 1:</span>
                      <code className="bg-muted px-2 py-1 rounded">{selectedDraw.entropy[1]}</code>
                    </div>
                    <div className="flex justify-between">
                      <span>Period - 2:</span>
                      <code className="bg-muted px-2 py-1 rounded">{selectedDraw.entropy[2]}</code>
                    </div>
                  </div>
                </div>
                <div className="space-y-3">
                  <h4 className="font-medium">Contract Entropy</h4>
                  <div className="space-y-2 text-sm">
                    <div className="flex justify-between">
                      <span>Contract State:</span>
                      <code className="bg-muted px-2 py-1 rounded">{selectedDraw.entropy[3]}</code>
                    </div>
                    <div className="flex justify-between">
                      <span>Additional Salt:</span>
                      <code className="bg-muted px-2 py-1 rounded">{selectedDraw.entropy[4]}</code>
                    </div>
                  </div>
                </div>
              </div>
              
              <Separator />
              
              <div className="bg-muted/30 p-4 rounded-lg">
                <h4 className="font-medium mb-2">Entropy Calculation Formula</h4>
                <code className="text-sm break-all">
                  entropy = {selectedDraw.entropy[0]} ^ ({selectedDraw.entropy[1]} &lt;&lt; 16) ^ ({selectedDraw.entropy[2]} &lt;&lt; 32) ^ {selectedDraw.entropy[3]} ^ ({selectedDraw.entropy[4]} &lt;&lt; 8)
                </code>
              </div>
            </div>
          </CardContent>
        </Card>
      </motion.div>

      {/* Winner Verification */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6, delay: 0.3 }}
        className="mb-8"
      >
        <Card className="card-shadow">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Calculator className="h-5 w-5 text-indigo-500" />
              Winner Verification
            </CardTitle>
            <p className="text-sm text-muted-foreground">
              Independently recompute the winner selection to verify fairness
            </p>
          </CardHeader>
          <CardContent>
            <div className="space-y-6">
              <div className="flex items-center justify-between p-4 border rounded-lg">
                <div>
                  <h4 className="font-medium">Original Result</h4>
                  <p className="text-sm text-muted-foreground">
                    Winner index from blockchain event
                  </p>
                </div>
                <Badge className="bg-primary/10 text-primary text-lg px-4 py-2">
                  #{selectedDraw.winnerIndex}
                </Badge>
              </div>

              {recomputedWinner !== null && (
                <div className={`flex items-center justify-between p-4 border rounded-lg ${
                  verificationStatus === 'verified' ? 'border-green-200 bg-green-50' :
                  verificationStatus === 'failed' ? 'border-red-200 bg-red-50' : ''
                }`}>
                  <div>
                    <h4 className="font-medium">Recomputed Result</h4>
                    <p className="text-sm text-muted-foreground">
                      Winner index calculated client-side
                    </p>
                  </div>
                  <div className="flex items-center gap-3">
                    <Badge className={`text-lg px-4 py-2 ${
                      verificationStatus === 'verified' ? 'bg-green-100 text-green-800' :
                      'bg-red-100 text-red-800'
                    }`}>
                      #{recomputedWinner}
                    </Badge>
                    {verificationStatus === 'verified' && (
                      <CheckCircle className="h-5 w-5 text-green-600" />
                    )}
                  </div>
                </div>
              )}

              <div className="flex gap-4">
                <Button 
                  onClick={recomputeWinner}
                  disabled={verificationStatus === 'computing'}
                  className="flex items-center gap-2"
                >
                  {verificationStatus === 'computing' ? (
                    <RefreshCw className="h-4 w-4 animate-spin" />
                  ) : (
                    <Calculator className="h-4 w-4" />
                  )}
                  {verificationStatus === 'computing' ? 'Computing...' : 'Recompute Winner'}
                </Button>

                <Button 
                  variant="outline" 
                  onClick={exportProof}
                  className="flex items-center gap-2"
                  disabled={verificationStatus !== 'verified'}
                >
                  <Download className="h-4 w-4" />
                  Export Proof
                </Button>
              </div>

              {verificationStatus === 'verified' && (
                <div className="bg-green-50 border border-green-200 rounded-lg p-4">
                  <div className="flex items-center gap-2 mb-2">
                    <CheckCircle className="h-5 w-5 text-green-600" />
                    <h4 className="font-medium text-green-800">Verification Successful</h4>
                  </div>
                  <p className="text-sm text-green-700">
                    The winner selection has been independently verified as mathematically correct and fair. 
                    The same deterministic process used by the smart contract produces identical results.
                  </p>
                </div>
              )}

              {verificationStatus === 'failed' && (
                <div className="bg-red-50 border border-red-200 rounded-lg p-4">
                  <div className="flex items-center gap-2 mb-2">
                    <CheckCircle className="h-5 w-5 text-red-600" />
                    <h4 className="font-medium text-red-800">Verification Failed</h4>
                  </div>
                  <p className="text-sm text-red-700">
                    The recomputed result does not match the blockchain event. This may indicate an implementation error 
                    or corrupted data. Please verify the entropy components and calculation method.
                  </p>
                </div>
              )}
            </div>
          </CardContent>
        </Card>
      </motion.div>
    </div>
  );
};

export default Fairness;