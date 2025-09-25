import { useState, useEffect } from "react";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Trophy, ExternalLink } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";
import confetti from "canvas-confetti";

interface Winner {
  id: string;
  address: string;
  prize: number;
  timestamp: string;
  txHash: string;
}

export function WinnersFeed() {
  const [winners, setWinners] = useState<Winner[]>([
    {
      id: "1",
      address: "AU12abc...def456",
      prize: 125.5,
      timestamp: "2024-01-12T15:30:00Z",
      txHash: "0x123...abc"
    },
    {
      id: "2", 
      address: "AU34ghi...jkl789",
      prize: 89.2,
      timestamp: "2024-01-11T20:15:00Z",
      txHash: "0x456...def"
    },
    {
      id: "3",
      address: "AU56mno...pqr012",
      prize: 234.8,
      timestamp: "2024-01-10T14:45:00Z", 
      txHash: "0x789...ghi"
    },
    {
      id: "4",
      address: "AU78stu...vwx345",
      prize: 67.3,
      timestamp: "2024-01-09T11:20:00Z",
      txHash: "0xabc...123"
    },
    {
      id: "5",
      address: "AU90yza...bcd678",
      prize: 156.7,
      timestamp: "2024-01-08T16:10:00Z",
      txHash: "0xdef...456"
    }
  ]);

  const [newWinner, setNewWinner] = useState<Winner | null>(null);

  // Simulate new winners occasionally
  useEffect(() => {
    const interval = setInterval(() => {
      if (Math.random() < 0.1) { // 10% chance every 10 seconds
        const mockWinner: Winner = {
          id: Date.now().toString(),
          address: `AU${Math.random().toString(36).substr(2, 5)}...${Math.random().toString(36).substr(2, 3)}`,
          prize: Math.round((Math.random() * 200 + 50) * 10) / 10,
          timestamp: new Date().toISOString(),
          txHash: `0x${Math.random().toString(36).substr(2, 8)}`
        };

        setNewWinner(mockWinner);
        
        // Trigger confetti
        confetti({
          particleCount: 50,
          spread: 60,
          origin: { y: 0.8, x: 1 }
        });

        // Add to winners list after animation
        setTimeout(() => {
          setWinners(prev => [mockWinner, ...prev.slice(0, 9)]);
          setNewWinner(null);
        }, 2000);
      }
    }, 10000);

    return () => clearInterval(interval);
  }, []);

  const formatTimeAgo = (timestamp: string) => {
    const now = new Date();
    const time = new Date(timestamp);
    const diffInMinutes = Math.floor((now.getTime() - time.getTime()) / (1000 * 60));
    
    if (diffInMinutes < 1) return "Just now";
    if (diffInMinutes < 60) return `${diffInMinutes}m ago`;
    if (diffInMinutes < 1440) return `${Math.floor(diffInMinutes / 60)}h ago`;
    return `${Math.floor(diffInMinutes / 1440)}d ago`;
  };

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
      <CardContent className="p-0">
        <ScrollArea className="h-[400px]">
          <div className="p-6 pt-0 space-y-4">
            {/* New Winner Animation */}
            <AnimatePresence>
              {newWinner && (
                <motion.div
                  initial={{ opacity: 0, y: -20, scale: 0.95 }}
                  animate={{ opacity: 1, y: 0, scale: 1 }}
                  exit={{ opacity: 0, y: 20, scale: 0.95 }}
                  className="p-4 rounded-lg bg-success/10 border border-success/20"
                >
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="font-medium text-success">🎉 New Winner!</p>
                      <p className="text-sm text-muted-foreground">
                        {newWinner.address}
                      </p>
                    </div>
                    <Badge className="bg-success text-white glow-secondary">
                      +{newWinner.prize} MAS
                    </Badge>
                  </div>
                </motion.div>
              )}
            </AnimatePresence>

            {/* Winners List */}
            {winners.map((winner, index) => (
              <motion.div
                key={winner.id}
                initial={{ opacity: 0, x: 20 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ delay: index * 0.05 }}
                className="flex items-center justify-between p-3 rounded-lg hover:bg-muted/30 transition-colors group"
              >
                <div className="space-y-1">
                  <p className="text-sm font-medium">{winner.address}</p>
                  <p className="text-xs text-muted-foreground">
                    {formatTimeAgo(winner.timestamp)}
                  </p>
                </div>
                <div className="flex items-center gap-2">
                  <Badge variant="outline" className="text-success border-success/30">
                    +{winner.prize} MAS
                  </Badge>
                  <button
                    onClick={() => {
                      // Mock opening transaction in explorer
                      console.log(`Opening tx: ${winner.txHash}`);
                    }}
                    className="opacity-0 group-hover:opacity-100 transition-opacity text-muted-foreground hover:text-primary"
                    title="View transaction"
                  >
                    <ExternalLink className="h-3 w-3" />
                  </button>
                </div>
              </motion.div>
            ))}

            {winners.length === 0 && (
              <div className="text-center py-8">
                <Trophy className="h-12 w-12 text-muted-foreground/50 mx-auto mb-4" />
                <p className="text-muted-foreground">
                  No winners yet. Be the first!
                </p>
              </div>
            )}
          </div>
        </ScrollArea>
      </CardContent>
    </Card>
  );
}