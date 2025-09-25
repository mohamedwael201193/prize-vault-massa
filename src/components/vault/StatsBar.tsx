import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Wallet, Users, Trophy, Clock } from "lucide-react";
import { useEffect, useState } from "react";
import { motion } from "framer-motion";

interface StatsBarProps {
  tvl: number;
  participants: number;
  prizePool: number;
  nextDrawTime: string;
}

export function StatsBar({ tvl, participants, prizePool, nextDrawTime }: StatsBarProps) {
  const [timeLeft, setTimeLeft] = useState("");

  useEffect(() => {
    const calculateTimeLeft = () => {
      const now = new Date().getTime();
      const draw = new Date(nextDrawTime).getTime();
      const difference = draw - now;

      if (difference > 0) {
        const days = Math.floor(difference / (1000 * 60 * 60 * 24));
        const hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
        
        if (days > 0) {
          setTimeLeft(`${days}d ${hours}h ${minutes}m`);
        } else {
          setTimeLeft(`${hours}h ${minutes}m`);
        }
      } else {
        setTimeLeft("Drawing now...");
      }
    };

    calculateTimeLeft();
    const timer = setInterval(calculateTimeLeft, 60000); // Update every minute

    return () => clearInterval(timer);
  }, [nextDrawTime]);

  const formatNumber = (num: number) => {
    if (num >= 1000000) {
      return `${(num / 1000000).toFixed(1)}M`;
    }
    if (num >= 1000) {
      return `${(num / 1000).toFixed(1)}K`;
    }
    return num.toLocaleString();
  };

  const stats = [
    {
      icon: Wallet,
      label: "TVL",
      value: `${formatNumber(tvl)} MAS`,
      color: "text-primary"
    },
    {
      icon: Users,
      label: "Participants",
      value: formatNumber(participants),
      color: "text-secondary"
    },
    {
      icon: Trophy,
      label: "Prize Pool",
      value: `${formatNumber(prizePool)} MAS`,
      color: "text-success"
    },
    {
      icon: Clock,
      label: "Next Draw",
      value: timeLeft,
      color: "text-accent"
    }
  ];

  return (
    <Card className="card-shadow">
      <CardContent className="p-6">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
          {stats.map((stat, index) => (
            <motion.div
              key={stat.label}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: index * 0.1, duration: 0.5 }}
              className="text-center"
            >
              <div className="flex items-center justify-center mb-2">
                <stat.icon className={`h-5 w-5 ${stat.color}`} />
              </div>
              <div className="space-y-1">
                <p className="text-sm text-muted-foreground">{stat.label}</p>
                <p className={`text-lg font-bold ${stat.color}`}>{stat.value}</p>
              </div>
            </motion.div>
          ))}
        </div>

        {/* Prize Draw Status */}
        <div className="mt-6 pt-6 border-t border-border/50">
          <div className="flex items-center justify-center gap-2">
            <Badge className="bg-success/10 text-success">
              <Trophy className="mr-1 h-3 w-3" />
              Weekly Prize Draw Active
            </Badge>
            <span className="text-sm text-muted-foreground">
              Every Friday at 8 PM UTC
            </span>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}