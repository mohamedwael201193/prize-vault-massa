import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { motion } from "framer-motion";
import { Target, Ticket } from "lucide-react";

interface OddsMeterProps {
  userTickets: number;
  totalTickets: number;
}

export function OddsMeter({ userTickets, totalTickets }: OddsMeterProps) {
  // Make tickets user-friendly: convert nano shares to MAS tickets (1 MAS = 1 ticket)
  const userFriendlyTickets = Math.floor(userTickets / 1e9) || 0;
  const totalFriendlyTickets = Math.floor(totalTickets / 1e9) || 0;
  
  const winChance = totalFriendlyTickets > 0 ? (userFriendlyTickets / totalFriendlyTickets) * 100 : 0;
  const odds = totalFriendlyTickets > 0 ? Math.floor(totalFriendlyTickets / Math.max(userFriendlyTickets, 1)) : 0;

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
        {userFriendlyTickets === 0 ? (
          <div className="text-center py-8">
            <Ticket className="h-12 w-12 text-muted-foreground/50 mx-auto mb-4" />
            <p className="text-muted-foreground">
              Deposit MAS to get tickets! 1 MAS = 1 ticket
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
                <p className="text-2xl font-bold text-primary">{userFriendlyTickets.toLocaleString()}</p>
                <p className="text-sm text-muted-foreground">Your Tickets</p>
              </div>
              <div className="space-y-1 text-center">
                <p className="text-2xl font-bold text-secondary">{totalFriendlyTickets.toLocaleString()}</p>
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
              <p>• Each 1 MAS in vault = 1 ticket</p>
              <p>• Withdrawing reduces your tickets</p>
              <p>• Higher stake = better winning odds</p>
            </div>
          </>
        )}
      </CardContent>
    </Card>
  );
}