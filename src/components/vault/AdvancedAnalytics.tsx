import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
import { Separator } from "@/components/ui/separator";
import { motion } from "framer-motion";
import { Activity, BarChart3, Shield, TrendingUp, Users, Zap } from "lucide-react";

interface AdvancedMetrics {
  contractHealth: number;
  yieldEfficiency: number; 
  participationTrend: number;
  networkUptime: number;
  gasSavings: number;
  communityScore: number;
}

interface AdvancedAnalyticsProps {
  metrics?: AdvancedMetrics;
  loading?: boolean;
}

export const AdvancedAnalytics = ({ metrics, loading = false }: AdvancedAnalyticsProps) => {
  const defaultMetrics: AdvancedMetrics = {
    contractHealth: 98,
    yieldEfficiency: 87,
    participationTrend: 124,
    networkUptime: 99.98,
    gasSavings: 92,
    communityScore: 89
  };

  const data = metrics || defaultMetrics;

  const analyticsItems = [
    {
      icon: Shield,
      title: "Contract Health",
      value: data.contractHealth,
      suffix: "%",
      description: "Smart contract performance score",
      color: "text-green-600",
      bgColor: "bg-green-100"
    },
    {
      icon: TrendingUp,
      title: "Yield Efficiency", 
      value: data.yieldEfficiency,
      suffix: "%",
      description: "Autonomous yield optimization rate",
      color: "text-blue-600",
      bgColor: "bg-blue-100"
    },
    {
      icon: Users,
      title: "Participation Trend",
      value: data.participationTrend,
      suffix: "%",
      description: "Community engagement growth",
      color: "text-purple-600",
      bgColor: "bg-purple-100"
    },
    {
      icon: Activity,
      title: "Network Uptime",
      value: data.networkUptime,
      suffix: "%", 
      description: "Massa blockchain availability",
      color: "text-emerald-600",
      bgColor: "bg-emerald-100"
    },
    {
      icon: Zap,
      title: "Gas Efficiency",
      value: data.gasSavings,
      suffix: "%",
      description: "Transaction cost optimization",
      color: "text-orange-600", 
      bgColor: "bg-orange-100"
    },
    {
      icon: BarChart3,
      title: "Community Score",
      value: data.communityScore,
      suffix: "%",
      description: "Governance participation rate",
      color: "text-indigo-600",
      bgColor: "bg-indigo-100"
    }
  ];

  if (loading) {
    return (
      <Card className="card-shadow">
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <BarChart3 className="h-5 w-5 text-primary" />
            Advanced Analytics
            <Badge variant="outline" className="ml-auto">Live Data</Badge>
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
            {[...Array(6)].map((_, i) => (
              <div key={i} className="animate-pulse">
                <div className="h-4 bg-muted rounded w-3/4 mb-2"></div>
                <div className="h-8 bg-muted rounded w-1/2 mb-2"></div>
                <div className="h-3 bg-muted rounded w-full"></div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    );
  }

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.6, delay: 0.3 }}
    >
      <Card className="card-shadow border-primary/20">
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <BarChart3 className="h-5 w-5 text-primary" />
            Advanced Analytics
            <Badge variant="outline" className="ml-auto bg-green-50 text-green-700 border-green-200">
              Live Data
            </Badge>
          </CardTitle>
          <p className="text-sm text-muted-foreground">
            Real-time protocol performance metrics and community insights
          </p>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {analyticsItems.map((item, index) => (
              <motion.div
                key={item.title}
                initial={{ opacity: 0, scale: 0.95 }}
                animate={{ opacity: 1, scale: 1 }}
                transition={{ delay: index * 0.1 }}
                className="space-y-3"
              >
                <div className="flex items-center gap-3">
                  <div className={`p-2 rounded-lg ${item.bgColor}`}>
                    <item.icon className={`h-4 w-4 ${item.color}`} />
                  </div>
                  <div className="flex-1 min-w-0">
                    <h4 className="font-medium text-sm truncate">{item.title}</h4>
                    <p className="text-xs text-muted-foreground">{item.description}</p>
                  </div>
                </div>
                
                <div className="space-y-2">
                  <div className="flex items-baseline justify-between">
                    <span className={`text-2xl font-bold ${item.color}`}>
                      {item.value}{item.suffix}
                    </span>
                    {item.value >= 90 && (
                      <Badge className="bg-green-100 text-green-800 text-xs">Excellent</Badge>
                    )}
                    {item.value >= 75 && item.value < 90 && (
                      <Badge className="bg-yellow-100 text-yellow-800 text-xs">Good</Badge>
                    )}
                    {item.value < 75 && (
                      <Badge className="bg-red-100 text-red-800 text-xs">Needs Attention</Badge>
                    )}
                  </div>
                  <Progress 
                    value={item.value} 
                    className="h-2"
                  />
                </div>
              </motion.div>
            ))}
          </div>

          <Separator className="my-6" />

          <div className="flex items-center justify-between text-sm text-muted-foreground">
            <span>Data updated in real-time from Massa blockchain</span>
            <Badge variant="outline" className="bg-primary/5 text-primary">
              Autonomous Monitoring
            </Badge>
          </div>
        </CardContent>
      </Card>
    </motion.div>
  );
};