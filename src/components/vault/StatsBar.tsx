import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import { useIsMobile } from "@/hooks/use-responsive";
import { motion } from "framer-motion";
import { Clock, Trophy, Users, Wallet } from "lucide-react";
import { useEffect, useState } from "react";

interface StatsBarProps {
  tvl: number;
  participants: number;
  prizePool: number;
  nextDrawTime: string;
}

export function StatsBar({ tvl, participants, prizePool, nextDrawTime }: StatsBarProps) {
  const [timeLeft, setTimeLeft] = useState("");
  const isMobile = useIsMobile();

  useEffect(() => {
    const calculateTimeLeft = () => {
      // Handle different time formats from contract
      if (nextDrawTime === "Drawing..." || nextDrawTime === "Drawing now...") {
        setTimeLeft("Drawing now...");
        return;
      }

      try {
        // Try to parse as ISO string first
        let drawTime: Date;
        if (nextDrawTime.includes('T')) {
          drawTime = new Date(nextDrawTime);
        } else {
          // Handle timestamp format
          const timestamp = parseInt(nextDrawTime);
          if (!isNaN(timestamp)) {
            // Convert seconds to milliseconds if needed
            drawTime = new Date(timestamp > 1e10 ? timestamp : timestamp * 1000);
          } else {
            setTimeLeft("Next draw pending...");
            return;
          }
        }

        const now = new Date().getTime();
        const difference = drawTime.getTime() - now;

        if (difference > 0) {
          const days = Math.floor(difference / (1000 * 60 * 60 * 24));
          const hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
          const minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
          const seconds = Math.floor((difference % (1000 * 60)) / 1000);
          
          if (days > 0) {
            setTimeLeft(`${days}d ${hours}h ${minutes}m`);
          } else if (hours > 0) {
            setTimeLeft(`${hours}h ${minutes}m ${seconds}s`);
          } else {
            setTimeLeft(`${minutes}m ${seconds}s`);
          }
        } else {
          setTimeLeft("Drawing now...");
        }
      } catch (error) {
        console.error("Error parsing draw time:", error);
        setTimeLeft("Draw schedule loading...");
      }
    };

    calculateTimeLeft();
    const timer = setInterval(calculateTimeLeft, 1000); // Update every second for accuracy

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
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 lg:gap-6">
          {stats.map((stat, index) => (
            <motion.div
              key={stat.label}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: index * 0.1, duration: 0.5 }}
              className={`text-center ${isMobile ? 'py-2' : ''}`}
            >
              <div className="flex items-center justify-center mb-2">
                <stat.icon className={`${isMobile ? 'h-4 w-4' : 'h-5 w-5'} ${stat.color}`} />
              </div>
              <div className="space-y-1">
                <p className={`${isMobile ? 'text-xs' : 'text-sm'} text-muted-foreground`}>{stat.label}</p>
                <p className={`${isMobile ? 'text-base' : 'text-lg'} font-bold ${stat.color}`}>{stat.value}</p>
              </div>
            </motion.div>
          ))}
        </div>

        {/* Prize Draw Status */}
        <div className="mt-4 lg:mt-6 pt-4 lg:pt-6 border-t border-border/50">
          <div className={`flex items-center justify-center ${isMobile ? 'flex-col space-y-2' : 'gap-2'}`}>
            <Badge className="bg-success/10 text-success">
              <Trophy className="mr-1 h-3 w-3" />
              Weekly Prize Draw Active
            </Badge>
            <span className={`${isMobile ? 'text-xs' : 'text-sm'} text-muted-foreground`}>
              Every Friday at 8 PM UTC
            </span>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}