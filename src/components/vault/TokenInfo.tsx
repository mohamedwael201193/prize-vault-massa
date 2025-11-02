import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { getEnabledTokens, getTokensByOrigin } from "@/config/tokens";
import { toast } from "@/hooks/use-toast";
import { motion } from "framer-motion";
import { Copy, ExternalLink, Info } from "lucide-react";

export function TokenInfo() {
  const tokens = getEnabledTokens();
  const ethTokens = getTokensByOrigin("ethereum");
  const bscTokens = getTokensByOrigin("bsc");

  const copyAddress = (address: string, symbol: string) => {
    navigator.clipboard.writeText(address);
    toast({
      title: "Address Copied",
      description: `${symbol} contract address copied to clipboard`,
    });
  };

  return (
    <Card className="border-2 border-slate-700/50 bg-slate-900/80 backdrop-blur-xl">
      <CardHeader>
        <div className="flex items-center gap-2">
          <Info className="h-5 w-5 text-electric-blue-400" />
          <CardTitle>Supported Tokens</CardTitle>
        </div>
        <CardDescription>
          All tokens bridged via Massa Bridge from Ethereum and BSC
        </CardDescription>
      </CardHeader>
      <CardContent className="space-y-6">
        {/* Bridge Links */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
          <motion.div
            whileHover={{ scale: 1.02 }}
            className="p-4 rounded-xl bg-gradient-to-br from-slate-800/50 to-slate-700/30 border border-slate-600/50"
          >
            <div className="flex items-center justify-between mb-2">
              <span className="text-sm font-medium text-slate-300">
                Massa Bridge (BuildNet)
              </span>
              <Badge variant="outline" className="text-xs">
                0% Fee
              </Badge>
            </div>
            <Button
              variant="link"
              className="p-0 h-auto text-electric-blue-400 hover:text-electric-blue-300"
              onClick={() =>
                window.open("https://bridge.buildnet.massa.net", "_blank")
              }
            >
              bridge.buildnet.massa.net
              <ExternalLink className="ml-1 h-3 w-3" />
            </Button>
          </motion.div>

          <motion.div
            whileHover={{ scale: 1.02 }}
            className="p-4 rounded-xl bg-gradient-to-br from-slate-800/50 to-slate-700/30 border border-slate-600/50"
          >
            <div className="flex items-center justify-between mb-2">
              <span className="text-sm font-medium text-slate-300">
                Documentation
              </span>
              <Badge variant="outline" className="text-xs">
                Guide
              </Badge>
            </div>
            <Button
              variant="link"
              className="p-0 h-auto text-electric-blue-400 hover:text-electric-blue-300"
              onClick={() =>
                window.open(
                  "https://docs.massa.net/docs/build/networks-faucets/public-networks#massa-bridge",
                  "_blank"
                )
              }
            >
              View Bridge Guide
              <ExternalLink className="ml-1 h-3 w-3" />
            </Button>
          </motion.div>
        </div>

        {/* Ethereum Tokens */}
        {ethTokens.length > 0 && (
          <div className="space-y-3">
            <div className="flex items-center gap-2">
              <Badge
                variant="secondary"
                className="bg-blue-500/20 text-blue-400"
              >
                Ethereum
              </Badge>
              <span className="text-sm text-slate-400">
                {ethTokens.length} token{ethTokens.length !== 1 ? "s" : ""}
              </span>
            </div>
            <div className="overflow-x-auto">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Token</TableHead>
                    <TableHead>Name</TableHead>
                    <TableHead className="hidden md:table-cell">
                      Decimals
                    </TableHead>
                    <TableHead>Address</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {ethTokens.map((token) => (
                    <TableRow key={token.symbol}>
                      <TableCell className="font-medium">
                        <div className="flex items-center gap-2">
                          <span>{token.icon}</span>
                          <span>{token.symbol}</span>
                        </div>
                      </TableCell>
                      <TableCell className="text-slate-400">
                        {token.name}
                      </TableCell>
                      <TableCell className="hidden md:table-cell text-slate-400">
                        {token.decimals}
                      </TableCell>
                      <TableCell>
                        <div className="flex items-center gap-2">
                          <code className="text-xs text-slate-400 bg-slate-800 px-2 py-1 rounded">
                            {token.address.slice(0, 8)}...
                            {token.address.slice(-6)}
                          </code>
                          <Button
                            variant="ghost"
                            size="sm"
                            className="h-6 w-6 p-0"
                            onClick={() =>
                              copyAddress(token.address, token.symbol)
                            }
                          >
                            <Copy className="h-3 w-3" />
                          </Button>
                        </div>
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </div>
          </div>
        )}

        {/* BSC Tokens */}
        {bscTokens.length > 0 && (
          <div className="space-y-3">
            <div className="flex items-center gap-2">
              <Badge
                variant="secondary"
                className="bg-yellow-500/20 text-yellow-400"
              >
                Binance Smart Chain
              </Badge>
              <span className="text-sm text-slate-400">
                {bscTokens.length} token{bscTokens.length !== 1 ? "s" : ""}
              </span>
            </div>
            <div className="overflow-x-auto">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Token</TableHead>
                    <TableHead>Name</TableHead>
                    <TableHead className="hidden md:table-cell">
                      Decimals
                    </TableHead>
                    <TableHead>Address</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {bscTokens.map((token) => (
                    <TableRow key={token.symbol}>
                      <TableCell className="font-medium">
                        <div className="flex items-center gap-2">
                          <span>{token.icon}</span>
                          <span>{token.symbol}</span>
                        </div>
                      </TableCell>
                      <TableCell className="text-slate-400">
                        {token.name}
                      </TableCell>
                      <TableCell className="hidden md:table-cell text-slate-400">
                        {token.decimals}
                      </TableCell>
                      <TableCell>
                        <div className="flex items-center gap-2">
                          <code className="text-xs text-slate-400 bg-slate-800 px-2 py-1 rounded">
                            {token.address.slice(0, 8)}...
                            {token.address.slice(-6)}
                          </code>
                          <Button
                            variant="ghost"
                            size="sm"
                            className="h-6 w-6 p-0"
                            onClick={() =>
                              copyAddress(token.address, token.symbol)
                            }
                          >
                            <Copy className="h-3 w-3" />
                          </Button>
                        </div>
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </div>
          </div>
        )}

        {/* Info Box */}
        <div className="p-4 rounded-lg bg-gradient-to-r from-electric-blue-500/10 to-cyber-purple-500/10 border border-electric-blue-500/30">
          <div className="space-y-2 text-sm">
            <p className="font-medium text-electric-blue-400">
              ℹ️ How to use bridged tokens:
            </p>
            <ol className="space-y-1 text-slate-400 list-decimal list-inside">
              <li>
                Bridge your tokens from Ethereum or BSC to Massa using the
                official bridge
              </li>
              <li>
                Wait 5-15 minutes for cross-chain confirmation (varies by
                network congestion)
              </li>
              <li>
                Tokens will appear in your Massa Station wallet on BuildNet
              </li>
              <li>
                Select your token in the dropdown above and enter the deposit
                amount
              </li>
            </ol>
            <p className="text-xs text-slate-500 mt-3">
              💡 <strong>Note:</strong> Multi-token deposits are coming soon!
              For now, bridge your tokens to MAS first, then deposit into
              AutoPrize.
            </p>
          </div>
        </div>

        {/* Fee Summary */}
        <div className="grid grid-cols-2 gap-3 text-sm">
          <div className="p-3 rounded-lg bg-slate-800/30">
            <p className="text-slate-500 mb-1">ETH → Massa</p>
            <p className="font-bold text-green-400">0% Fee</p>
          </div>
          <div className="p-3 rounded-lg bg-slate-800/30">
            <p className="text-slate-500 mb-1">BSC → Massa</p>
            <p className="font-bold text-green-400">0% Fee</p>
          </div>
          <div className="p-3 rounded-lg bg-slate-800/30">
            <p className="text-slate-500 mb-1">Massa → ETH</p>
            <p className="font-bold text-yellow-400">0.1% Fee</p>
          </div>
          <div className="p-3 rounded-lg bg-slate-800/30">
            <p className="text-slate-500 mb-1">Massa → BSC</p>
            <p className="font-bold text-green-400">0% Fee</p>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
