import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { Badge } from "@/components/ui/badge";
import { Target, Ticket } from "lucide-react";
import { motion } from "framer-motion";

interface OddsMeterProps {
  userTickets: number;
  totalTickets: number;
}

export function OddsMeter({ userTickets, totalTickets }: OddsMeterProps) {
  const winChance = totalTickets > 0 ? (userTickets / totalTickets) * 100 : 0;
  const odds = totalTickets > 0 ? Math.floor(totalTickets / Math.max(userTickets, 1)) : 0;

  return (
    <Card className="card-shadow">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-accent/10">
            <Target className="h-4 w-4 text-accent" />
          </div>
          Your Win Odds
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-6">
        {userTickets === 0 ? (
          <div className="text-center py-8">
            <Ticket className="h-12 w-12 text-muted-foreground/50 mx-auto mb-4" />
            <p className="text-muted-foreground">
              Make a deposit to get tickets and join the prize pool!
            </p>
          </div>
        ) : (
          <>
            {/* Win Chance Bar */}
            <div className="space-y-3">
              <div className="flex justify-between items-center">
                <span className="text-sm font-medium">Win Probability</span>
                <Badge className="bg-accent/10 text-accent">
                  {winChance.toFixed(3)}%
                </Badge>
              </div>
              <motion.div
                initial={{ width: 0 }}
                animate={{ width: "100%" }}
                transition={{ duration: 1, ease: "easeOut" }}
              >
                <Progress 
                  value={Math.min(winChance * 10, 100)} // Scale for visibility
                  className="h-3"
                />
              </motion.div>
            </div>

            {/* Ticket Stats */}
            <div className="grid grid-cols-2 gap-4">
              <div className="space-y-1 text-center">
                <p className="text-2xl font-bold text-primary">{userTickets}</p>
                <p className="text-sm text-muted-foreground">Your Tickets</p>
              </div>
              <div className="space-y-1 text-center">
                <p className="text-2xl font-bold text-secondary">{totalTickets.toLocaleString()}</p>
                <p className="text-sm text-muted-foreground">Total Tickets</p>
              </div>
            </div>

            {/* Odds Display */}
            <div className="bg-accent/5 rounded-lg p-4 text-center">
              <p className="text-sm text-muted-foreground mb-1">Odds</p>
              <p className="text-lg font-bold text-accent">
                1 in {odds.toLocaleString()}
              </p>
            </div>

            {/* Info */}
            <div className="text-xs text-muted-foreground space-y-1">
              <p>• Each 1 MAS deposited = 1 ticket</p>
              <p>• Tickets remain active until withdrawal</p>
              <p>• Winners selected via verifiable randomness</p>
            </div>
          </>
        )}
      </CardContent>
    </Card>
  );
}