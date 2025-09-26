import { useState, useEffect } from "react";
import { motion } from "framer-motion";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { 
  ExternalLink, 
  Search, 
  CheckCircle, 
  Clock,
  Database,
  Eye,
  Hash
} from "lucide-react";

interface Event {
  id: string;
  timestamp: string;
  event: string;
  data: any;
  txHash: string;
  blockNumber: number;
}

const Verify = () => {
  const [searchQuery, setSearchQuery] = useState("");
  const [events, setEvents] = useState<Event[]>([]);

  // Mock events data
  useEffect(() => {
    const mockEvents: Event[] = [
      {
        id: "1",
        timestamp: "2024-01-12T15:30:00Z",
        event: "PrizeDrawn",
        data: {
          winner: "AU12abc...def456",
          amount: "125.5 MAS",
          randomSeed: "0x7f8c9d2e..."
        },
        txHash: "0x1234567890abcdef",
        blockNumber: 1250340
      },
      {
        id: "2",
        timestamp: "2024-01-12T15:29:45Z", 
        event: "YieldGenerated",
        data: {
          amount: "125.5 MAS",
          source: "MassaLend Protocol",
          apy: "12.4%"
        },
        txHash: "0x2345678901bcdefg",
        blockNumber: 1250339
      },
      {
        id: "3",
        timestamp: "2024-01-12T14:20:12Z",
        event: "DepositMade", 
        data: {
          user: "AU34ghi...jkl789",
          amount: "50 MAS",
          newTickets: 50
        },
        txHash: "0x3456789012cdefgh",
        blockNumber: 1250301
      },
      {
        id: "4",
        timestamp: "2024-01-12T13:15:30Z",
        event: "WithdrawalMade",
        data: {
          user: "AU56mno...pqr012", 
          amount: "25 MAS",
          ticketsLost: 25
        },
        txHash: "0x456789013defghi",
        blockNumber: 1250280
      }
    ];

    setEvents(mockEvents);
  }, []);

  const contractInfo = {
    address: "AU1YourContractAddressHere123456789",
    version: "v1.2.0",
    deployedAt: "2024-01-01T00:00:00Z",
    verificationStatus: "Verified",
    auditReport: "https://audit-report-link.com"
  };

  const filteredEvents = events.filter(event =>
    event.event.toLowerCase().includes(searchQuery.toLowerCase()) ||
    event.txHash.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const formatTimestamp = (timestamp: string) => {
    return new Date(timestamp).toLocaleString();
  };

  const getEventColor = (eventType: string) => {
    switch (eventType) {
      case "PrizeDrawn": return "bg-success/10 text-success border-success/30";
      case "YieldGenerated": return "bg-primary/10 text-primary border-primary/30";
      case "DepositMade": return "bg-secondary/10 text-secondary border-secondary/30";
      case "WithdrawalMade": return "bg-accent/10 text-accent border-accent/30";
      default: return "bg-muted/10 text-muted-foreground border-muted/30";
    }
  };

  return (
    <>
      <div className="container mx-auto px-4 py-8">
        {/* Header */}
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
          className="text-center mb-8"
        >
          <h1 className="text-4xl font-bold mb-4">
            Contract <span className="gradient-text">Verification</span>
          </h1>
          <p className="text-muted-foreground text-lg max-w-2xl mx-auto">
            Verify all operations on-chain. Full transparency and auditability for AutoPrize Vault smart contracts.
          </p>
        </motion.div>

        {/* Contract Info */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.1 }}
          className="mb-8"
        >
          <Card className="card-shadow">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Database className="h-5 w-5 text-primary" />
                Smart Contract Information
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid md:grid-cols-2 gap-6">
                <div className="space-y-3">
                  <div>
                    <Label className="text-sm font-medium">Contract Address</Label>
                    <div className="flex items-center gap-2 mt-1">
                      <code className="text-sm bg-muted px-2 py-1 rounded">
                        {contractInfo.address}
                      </code>
                      <Button size="sm" variant="ghost" className="p-1 h-auto">
                        <ExternalLink className="h-3 w-3" />
                      </Button>
                    </div>
                  </div>
                  
                  <div>
                    <Label className="text-sm font-medium">Version</Label>
                    <p className="text-sm mt-1">{contractInfo.version}</p>
                  </div>
                </div>

                <div className="space-y-3">
                  <div>
                    <Label className="text-sm font-medium">Status</Label>
                    <div className="mt-1">
                      <Badge className="bg-success/10 text-success">
                        <CheckCircle className="mr-1 h-3 w-3" />
                        {contractInfo.verificationStatus}
                      </Badge>
                    </div>
                  </div>
                  
                  <div>
                    <Label className="text-sm font-medium">Deployed</Label>
                    <p className="text-sm mt-1">{formatTimestamp(contractInfo.deployedAt)}</p>
                  </div>
                </div>
              </div>

              <div className="pt-4 border-t border-border/50">
                <Button variant="outline" className="w-full sm:w-auto" asChild>
                  <a href={contractInfo.auditReport} target="_blank" rel="noopener noreferrer">
                    <Eye className="mr-2 h-4 w-4" />
                    View Security Audit Report
                  </a>
                </Button>
              </div>
            </CardContent>
          </Card>
        </motion.div>

        {/* Event Explorer */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.2 }}
        >
          <Card className="card-shadow">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Hash className="h-5 w-5 text-primary" />
                Event Explorer
              </CardTitle>
              <div className="pt-4">
                <div className="flex gap-2">
                  <div className="flex-1">
                    <Input
                      placeholder="Search events or transaction hash..."
                      value={searchQuery}
                      onChange={(e) => setSearchQuery(e.target.value)}
                    />
                  </div>
                  <Button variant="outline">
                    <Search className="h-4 w-4" />
                  </Button>
                </div>
              </div>
            </CardHeader>
            <CardContent className="p-0">
              <div className="max-h-96 overflow-y-auto">
                <div className="space-y-1">
                  {filteredEvents.map((event, index) => (
                    <motion.div
                      key={event.id}
                      initial={{ opacity: 0, x: -20 }}
                      animate={{ opacity: 1, x: 0 }}
                      transition={{ delay: index * 0.05 }}
                      className="p-4 border-b border-border/30 hover:bg-muted/20 transition-colors"
                    >
                      <div className="flex items-start justify-between gap-4">
                        <div className="flex-1 min-w-0">
                          <div className="flex items-center gap-3 mb-2">
                            <Badge className={getEventColor(event.event)}>
                              {event.event}
                            </Badge>
                            <span className="text-sm text-muted-foreground flex items-center gap-1">
                              <Clock className="h-3 w-3" />
                              {formatTimestamp(event.timestamp)}
                            </span>
                          </div>
                          
                          <div className="text-sm space-y-1">
                            {Object.entries(event.data).map(([key, value]) => (
                              <div key={key} className="flex justify-between">
                                <span className="text-muted-foreground capitalize">
                                  {key.replace(/([A-Z])/g, ' $1').toLowerCase()}:
                                </span>
                                <span className="font-medium">{String(value)}</span>
                              </div>
                            ))}
                          </div>
                        </div>

                        <div className="text-right space-y-1">
                          <div className="text-xs text-muted-foreground">
                            Block #{event.blockNumber.toLocaleString()}
                          </div>
                          <Button
                            size="sm"
                            variant="ghost"
                            className="p-1 h-auto text-xs"
                            onClick={() => {
                              // Mock opening transaction
                              console.log(`Opening tx: ${event.txHash}`);
                            }}
                          >
                            <ExternalLink className="h-3 w-3 mr-1" />
                            View Tx
                          </Button>
                        </div>
                      </div>
                    </motion.div>
                  ))}
                </div>
              </div>
            </CardContent>
          </Card>
        </motion.div>

        {/* Quick Links */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.3 }}
          className="mt-8 grid sm:grid-cols-2 lg:grid-cols-3 gap-4"
        >
          {[
            { title: "View Source Code", desc: "Review the complete smart contract code", icon: ExternalLink },
            { title: "Storage Inspector", desc: "Inspect on-chain storage state", icon: Database },
            { title: "Audit Reports", desc: "Read security audit findings", icon: CheckCircle }
          ].map((item, index) => (
            <Card key={item.title} className="cursor-pointer hover:border-primary/50 transition-colors">
              <CardContent className="p-4 text-center">
                <item.icon className="h-6 w-6 mx-auto mb-2 text-primary" />
                <h3 className="font-medium mb-1">{item.title}</h3>
                <p className="text-xs text-muted-foreground">{item.desc}</p>
              </CardContent>
            </Card>
          ))}
        </motion.div>
      </div>
    </>
  );
};

export default Verify;