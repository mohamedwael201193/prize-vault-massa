import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { ScrollArea } from "@/components/ui/scroll-area";
import { motion } from "framer-motion";
import { ExternalLink, Sparkles, Trophy } from "lucide-react";
import { useEffect, useState } from "react";

interface Winner {
  id: string;
  address: string;
  prize: number;
  timestamp: string;
  txHash: string;
}

export function WinnersFeed() {
  const [winners, setWinners] = useState<Winner[]>([]);
  const [loading, setLoading] = useState(true);
  
  // Fetch real winners from contract
  useEffect(() => {
    const fetchWinners = async () => {
      try {
        setLoading(true);
        // TODO: Replace with actual contract call when implemented
        // const sc = getContract(VAULT_ADDRESS);
        // const rawWinners = await sc.read("getRecentWinners", new Args().addU64(5));
        // const winnersData = JSON.parse(bytesToString(rawWinners));
        
        // For now, show empty state until real winners exist
        setTimeout(() => {
          setWinners([]);
          setLoading(false);
        }, 1000);
      } catch (error) {
        console.error("Failed to fetch winners:", error);
        setWinners([]);
        setLoading(false);
      }
    };

    fetchWinners();
  }, []);

  const formatTime = (timestamp: string) => {
    const date = new Date(timestamp);
    const now = new Date();
    const diffInHours = Math.floor((now.getTime() - date.getTime()) / (1000 * 60 * 60));
    
    if (diffInHours < 1) {
      return "Just now";
    } else if (diffInHours < 24) {
      return `${diffInHours}h ago`;
    } else {
      const days = Math.floor(diffInHours / 24);
      return `${days}d ago`;
    }
  };

  if (loading) {
    return (
      <Card className="card-shadow">
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-success/10">
              <Trophy className="h-4 w-4 text-success" />
            </div>
            Recent Winners
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="space-y-3">
            {[...Array(3)].map((_, i) => (
              <div key={i} className="animate-pulse">
                <div className="flex items-center justify-between p-3 bg-muted/50 rounded-lg">
                  <div className="space-y-2">
                    <div className="h-4 w-24 bg-muted rounded"></div>
                    <div className="h-3 w-16 bg-muted rounded"></div>
                  </div>
                  <div className="h-4 w-20 bg-muted rounded"></div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card className="card-shadow">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-success/10">
            <Trophy className="h-4 w-4 text-success" />
          </div>
          Recent Winners
        </CardTitle>
      </CardHeader>
      <CardContent>
        {winners.length === 0 ? (
          <div className="text-center py-12">
            <div className="flex flex-col items-center space-y-4">
              <div className="relative">
                <Trophy className="h-16 w-16 text-muted-foreground/30" />
                <Sparkles className="h-6 w-6 text-yellow-400/50 absolute -top-2 -right-2" />
              </div>
              <div className="space-y-2">
                <h3 className="text-lg font-semibold text-muted-foreground">
                  No winners yet!
                </h3>
                <p className="text-sm text-muted-foreground max-w-xs">
                  Be the first to win by depositing MAS and joining the next draw.
                </p>
              </div>
              <Badge variant="outline" className="text-xs">
                Next draw determines first winner
              </Badge>
            </div>
          </div>
        ) : (
          <ScrollArea className="h-80">
            <div className="space-y-3">
              {winners.map((winner, index) => (
                <motion.div
                  key={winner.id}
                  initial={{ opacity: 0, y: 20 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ delay: index * 0.1, duration: 0.3 }}
                  className="group"
                >
                  <div className="flex items-center justify-between p-3 bg-gradient-to-r from-success/5 to-transparent rounded-lg border border-success/10 hover:border-success/20 transition-colors">
                    <div className="space-y-1">
                      <div className="flex items-center gap-2">
                        <Trophy className="h-3 w-3 text-success" />
                        <span className="font-mono text-sm">
                          {winner.address.slice(0, 6)}...{winner.address.slice(-4)}
                        </span>
                      </div>
                      <p className="text-xs text-muted-foreground">
                        {formatTime(winner.timestamp)}
                      </p>
                    </div>
                    <div className="text-right">
                      <p className="font-bold text-success">
                        +{winner.prize.toFixed(2)} MAS
                      </p>
                      {winner.txHash && (
                        <button
                          onClick={() => window.open(`#/tx/${winner.txHash}`, '_blank')}
                          className="text-xs text-muted-foreground hover:text-primary flex items-center gap-1 mt-1"
                        >
                          <ExternalLink className="h-3 w-3" />
                          View
                        </button>
                      )}
                    </div>
                  </div>
                </motion.div>
              ))}
            </div>
          </ScrollArea>
        )}
      </CardContent>
    </Card>
  );
}