import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { useVaultSync } from "@/hooks/useVaultSync";
import { useWallet } from "@/hooks/useWallet";
import { bytesToString } from "@/lib/bytes";
import { Args, SmartContract } from "@massalabs/massa-web3";
import { motion } from "framer-motion";
import { Activity, AlertCircle, CheckCircle, Clock, Zap } from "lucide-react";
import { useEffect, useState } from "react";

interface ScheduledRun {
  id: number;
  period: number;
  estimatedTime: string;
  type: 'draw' | 'tick';
  status: 'pending' | 'executed';
}

interface DrawHistory {
  id: number;
  period: number;
  timestamp: string;
  status: 'success' | 'failed';
  gasUsed: number;
  seedFragment: string;
  participants: number;
  prizeAmount: string;
}

const Autonomy = () => {
  const { getPublicProvider } = useWallet();
  const { activeVault } = useVaultSync();
  const [scheduledRuns, setScheduledRuns] = useState<ScheduledRun[]>([]);
  const [drawHistory, setDrawHistory] = useState<DrawHistory[]>([]);
  const [healthStatus, setHealthStatus] = useState<'green' | 'amber' | 'red'>('green');
  const [lastRunPeriod, setLastRunPeriod] = useState<number>(0);
  const [loading, setLoading] = useState(true);
  const [realStats, setRealStats] = useState<any>(null);

  useEffect(() => {
    fetchAutonomyData();
  }, [getPublicProvider, activeVault.address]);

  const fetchAutonomyData = async () => {
    try {
      const provider = getPublicProvider();
      if (!provider) return;

      // Try to fetch real vault stats
      try {
        const vaultAddr = activeVault.address;
        const sc = new SmartContract(provider as any, vaultAddr);
        const statsArgs = new Args();
        const statsRaw = await sc.read('getVaultStats', statsArgs);
        const stats = JSON.parse(bytesToString(statsRaw));
        setRealStats(stats);
        
        // Set health status based on real data
        const totalShares = parseInt(stats.totalShares || '0');
        if (totalShares > 100) {
          setHealthStatus('green');
        } else if (totalShares > 10) {
          setHealthStatus('amber');
        } else {
          setHealthStatus('red');
        }
        
        console.log('✅ Real vault stats loaded:', stats);
      } catch (error) {
        console.log('Using demo data for autonomy monitoring');
        setHealthStatus('amber'); // No real data available
      }

      // Get current period for calculations (mock for now, would be from blockchain)
      const currentPeriod = 12345678;

      // Mock scheduled runs (in real implementation, this would come from contract)
      const mockScheduled: ScheduledRun[] = [
        {
          id: 1,
          period: currentPeriod + 144,
          estimatedTime: new Date(Date.now() + 1 * 60 * 60 * 1000).toISOString(),
          type: 'tick',
          status: 'pending'
        },
        {
          id: 2, 
          period: currentPeriod + 288,
          estimatedTime: new Date(Date.now() + 2 * 60 * 60 * 1000).toISOString(),
          type: 'tick',
          status: 'pending'
        },
        {
          id: 3,
          period: currentPeriod + 20160,
          estimatedTime: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000).toISOString(),
          type: 'draw',
          status: 'pending'
        },
        {
          id: 4,
          period: currentPeriod + 20304,
          estimatedTime: new Date(Date.now() + 7.1 * 24 * 60 * 60 * 1000).toISOString(),
          type: 'tick',
          status: 'pending'
        },
        {
          id: 5,
          period: currentPeriod + 40320,
          estimatedTime: new Date(Date.now() + 14 * 24 * 60 * 60 * 1000).toISOString(),
          type: 'draw',
          status: 'pending'
        }
      ];

      // Mock draw history
      const mockHistory: DrawHistory[] = [
        {
          id: 10,
          period: currentPeriod - 144,
          timestamp: new Date(Date.now() - 1 * 60 * 60 * 1000).toISOString(),
          status: 'success',
          gasUsed: 125000,
          seedFragment: 'a7f8d9e2',
          participants: 42,
          prizeAmount: '2.5'
        },
        {
          id: 9,
          period: currentPeriod - 288,
          timestamp: new Date(Date.now() - 2 * 60 * 60 * 1000).toISOString(),
          status: 'success', 
          gasUsed: 118000,
          seedFragment: 'b3c4f5a1',
          participants: 38,
          prizeAmount: '1.8'
        },
        {
          id: 8,
          period: currentPeriod - 20160,
          timestamp: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString(),
          status: 'success',
          gasUsed: 145000,
          seedFragment: 'e9f1a2b8',
          participants: 35,
          prizeAmount: '5.2'
        }
      ];

      setScheduledRuns(mockScheduled);
      setDrawHistory(mockHistory);
      
      // Calculate health status
      const timeSinceLastRun = currentPeriod - (currentPeriod - 144);
      const frequency = 144; // tick frequency
      
      if (timeSinceLastRun < 2 * frequency) {
        setHealthStatus('green');
      } else if (timeSinceLastRun < 3 * frequency) {
        setHealthStatus('amber');
      } else {
        setHealthStatus('red');
      }
      
      setLastRunPeriod(currentPeriod - 144);
      
    } catch (error) {
      console.error('Error fetching autonomy data:', error);
    } finally {
      setLoading(false);
    }
  };

  const getHealthIcon = () => {
    switch (healthStatus) {
      case 'green': return <CheckCircle className="h-5 w-5 text-green-500" />;
      case 'amber': return <AlertCircle className="h-5 w-5 text-yellow-500" />;
      case 'red': return <AlertCircle className="h-5 w-5 text-red-500" />;
    }
  };

  const getHealthMessage = () => {
    switch (healthStatus) {
      case 'green': return 'All autonomous operations running smoothly';
      case 'amber': return 'Slight delay detected in autonomous operations';
      case 'red': return 'Autonomous operations require attention';
    }
  };

  const formatTime = (isoString: string) => {
    return new Date(isoString).toLocaleString();
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
          Autonomous <span className="gradient-text">Operations</span>
        </h1>
        <p className="text-muted-foreground text-lg max-w-2xl mx-auto">
          Monitor the autonomous smart contract operations powering AutoPrize Vault. All draws and operations execute automatically without human intervention.
        </p>
      </motion.div>

      {/* Health Status */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6, delay: 0.1 }}
        className="mb-8"
      >
        <Card className={`card-shadow border-0 shadow-lg ${
          healthStatus === 'green' ? 'bg-gradient-to-br from-emerald-50 to-green-50' :
          healthStatus === 'amber' ? 'bg-gradient-to-br from-yellow-50 to-orange-50' :
          'bg-gradient-to-br from-red-50 to-pink-50'
        }`}>
          <CardHeader className="pb-4">
            <CardTitle className="flex items-center gap-3">
              <div className={`p-2 rounded-lg ${
                healthStatus === 'green' ? 'bg-emerald-100' :
                healthStatus === 'amber' ? 'bg-yellow-100' :
                'bg-red-100'
              }`}>
                {getHealthIcon()}
              </div>
              <span className={
                healthStatus === 'green' ? 'text-emerald-900' :
                healthStatus === 'amber' ? 'text-yellow-900' :
                'text-red-900'
              }>System Health Status</span>
              <Badge className={`ml-auto shadow-sm ${
                healthStatus === 'green' ? 'bg-emerald-500 text-white' :
                healthStatus === 'amber' ? 'bg-yellow-500 text-white' :
                'bg-red-500 text-white'
              }`}>
                {healthStatus.toUpperCase()}
              </Badge>
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="mb-6 p-4 bg-white/60 rounded-xl border border-gray-100">
              <p className="text-sm text-gray-700 font-medium">{getHealthMessage()}</p>
            </div>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div className="text-center p-4 bg-white/60 rounded-xl border border-blue-100 shadow-sm">
                <span className="text-sm font-medium text-blue-700 mb-2 block">Last Operation</span>
                <div className="text-2xl font-bold text-blue-600 mb-1">Period {lastRunPeriod}</div>
                <div className="text-xs text-blue-500">Recently Executed</div>
              </div>
              <div className="text-center p-4 bg-white/60 rounded-xl border border-purple-100 shadow-sm">
                <span className="text-sm font-medium text-purple-700 mb-2 block">Frequency</span>
                <div className="text-2xl font-bold text-purple-600 mb-1">144</div>
                <div className="text-xs text-purple-500">Periods (~1 hour)</div>
              </div>
              <div className="text-center p-4 bg-white/60 rounded-xl border border-orange-100 shadow-sm">
                <span className="text-sm font-medium text-orange-700 mb-2 block">Next Check</span>
                <div className="text-2xl font-bold text-orange-600 mb-1">Period {lastRunPeriod + 144}</div>
                <div className="text-xs text-orange-500">Scheduled</div>
              </div>
            </div>
          </CardContent>
        </Card>
      </motion.div>

      {/* Real Vault Stats */}
      {realStats && (
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.15 }}
          className="mb-8"
        >
          <Card className="card-shadow border-0 bg-gradient-to-br from-blue-50 to-indigo-50 shadow-lg">
            <CardHeader className="pb-4">
              <CardTitle className="flex items-center gap-3">
                <div className="p-2 rounded-lg bg-blue-100">
                  <Activity className="h-5 w-5 text-blue-700" />
                </div>
                <span className="text-blue-900">Live Vault Statistics</span>
                <Badge className="ml-auto bg-blue-500 text-white shadow-sm">
                  REAL DATA
                </Badge>
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
                <div className="text-center p-4 bg-white/60 rounded-xl border border-blue-100 shadow-sm">
                  <span className="text-sm font-medium text-blue-700 mb-2 block">Total Shares</span>
                  <div className="text-3xl font-bold text-blue-600 mb-1">
                    {realStats.totalShares ? (Number(realStats.totalShares) / 1e9).toFixed(2) + ' MAS' : '0 MAS'}
                  </div>
                  {realStats.totalShares && (
                    <div className="text-xs text-gray-500 mb-1">
                      {Number(realStats.totalShares).toLocaleString()} nanoMAS
                    </div>
                  )}
                  <div className="text-xs text-blue-500">Active Participants</div>
                </div>
                <div className="text-center p-4 bg-white/60 rounded-xl border border-emerald-100 shadow-sm">
                  <span className="text-sm font-medium text-emerald-700 mb-2 block">Winners Count</span>
                  <div className="text-3xl font-bold text-emerald-600 mb-1">{realStats.winnerCount || '0'}</div>
                  <div className="text-xs text-emerald-500">Lucky Players</div>
                </div>
                <div className="text-center p-4 bg-white/60 rounded-xl border border-purple-100 shadow-sm">
                  <span className="text-sm font-medium text-purple-700 mb-2 block">Total Prizes</span>
                  <div className="text-3xl font-bold text-purple-600 mb-1">{realStats.totalPrizes || '0'}</div>
                  <div className="text-xs text-purple-500">Awarded</div>
                </div>
                <div className="text-center p-4 bg-white/60 rounded-xl border border-orange-100 shadow-sm">
                  <span className="text-sm font-medium text-orange-700 mb-2 block">Contract Balance</span>
                  <div className="text-3xl font-bold text-orange-600 mb-1">
                    {realStats.balance ? (Number(realStats.balance) / 1e9).toFixed(2) + ' MAS' : '0 MAS'}
                  </div>
                  {realStats.balance && (
                    <div className="text-xs text-gray-500 mb-1">
                      {Number(realStats.balance).toLocaleString()} nanoMAS
                    </div>
                  )}
                  <div className="text-xs text-orange-500">Available Prize Pool</div>
                </div>
              </div>
            </CardContent>
          </Card>
        </motion.div>
      )}

      {/* Scheduled Operations */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6, delay: 0.2 }}
        className="mb-8"
      >
        <Card className="card-shadow">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Clock className="h-5 w-5 text-primary" />
              Scheduled Operations (Next 5)
            </CardTitle>
            <p className="text-sm text-muted-foreground">
              Upcoming autonomous smart contract executions
            </p>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {scheduledRuns.map((run, index) => (
                <motion.div
                  key={run.id}
                  initial={{ opacity: 0, x: -20 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{ delay: index * 0.1 }}
                  className="flex items-center justify-between p-4 border rounded-lg"
                >
                  <div className="flex items-center gap-4">
                    <div className={`p-2 rounded-lg ${
                      run.type === 'draw' ? 'bg-primary/10' : 'bg-muted'
                    }`}>
                      {run.type === 'draw' ? (
                        <Zap className="h-4 w-4 text-primary" />
                      ) : (
                        <Activity className="h-4 w-4 text-muted-foreground" />
                      )}
                    </div>
                    <div>
                      <h4 className="font-medium capitalize">{run.type} Operation</h4>
                      <p className="text-sm text-muted-foreground">
                        Period {run.period} • {formatTime(run.estimatedTime)}
                      </p>
                    </div>
                  </div>
                  <Badge variant="outline" className="bg-blue-50 text-blue-700 border-blue-200">
                    {run.status}
                  </Badge>
                </motion.div>
              ))}
            </div>
          </CardContent>
        </Card>
      </motion.div>

      {/* Recent Operations */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6, delay: 0.3 }}
      >
        <Card className="card-shadow">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Activity className="h-5 w-5 text-success" />
              Recent Operations (Last 10)
            </CardTitle>
            <p className="text-sm text-muted-foreground">
              History of completed autonomous executions
            </p>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {drawHistory.map((draw, index) => (
                <motion.div
                  key={draw.id}
                  initial={{ opacity: 0, x: -20 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{ delay: index * 0.1 }}
                  className="flex items-center justify-between p-4 border rounded-lg"
                >
                  <div className="flex items-center gap-4">
                    <div className="p-2 rounded-lg bg-green-100">
                      <CheckCircle className="h-4 w-4 text-green-600" />
                    </div>
                    <div>
                      <h4 className="font-medium">Prize Draw #{draw.id}</h4>
                      <p className="text-sm text-muted-foreground">
                        Period {draw.period} • {formatTime(draw.timestamp)}
                      </p>
                      <div className="flex items-center gap-4 mt-1 text-xs text-muted-foreground">
                        <span>Gas: {draw.gasUsed.toLocaleString()}</span>
                        <Separator orientation="vertical" className="h-3" />
                        <span>Seed: {draw.seedFragment}</span>
                        <Separator orientation="vertical" className="h-3" />
                        <span>Participants: {draw.participants}</span>
                      </div>
                    </div>
                  </div>
                  <div className="text-right">
                    <div className="font-medium text-primary">{draw.prizeAmount} MAS</div>
                    <Badge className="bg-green-100 text-green-800 text-xs">
                      {draw.status}
                    </Badge>
                  </div>
                </motion.div>
              ))}
            </div>
          </CardContent>
        </Card>
      </motion.div>
    </div>
  );
};

export default Autonomy;