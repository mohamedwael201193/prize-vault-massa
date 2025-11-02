import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Skeleton } from "@/components/ui/skeleton";
import { useVaultSync } from "@/hooks/useVaultSync";
import { useWallet } from "@/hooks/useWallet";
import { bytesToString } from "@/lib/bytes";
import { Args, SmartContract } from "@massalabs/massa-web3";
import { motion } from "framer-motion";
import {
  Calendar,
  Check,
  Coins,
  Copy,
  ExternalLink,
  Search,
  Trophy,
} from "lucide-react";
import { useEffect, useMemo, useState } from "react";

interface Winner {
  period: string;
  winner: string;
  prize: string;
  seed: string;
  timestamp?: number;
  prizeAsMas: number;
}

const ITEMS_PER_PAGE = 10;

export default function Winners() {
  const [winners, setWinners] = useState<Winner[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string>("");
  const [currentPage, setCurrentPage] = useState(1);
  const [searchTerm, setSearchTerm] = useState("");
  const [sortBy, setSortBy] = useState<"period" | "prize">("period");
  const [sortOrder, setSortOrder] = useState<"asc" | "desc">("desc");
  const [copiedAddress, setCopiedAddress] = useState<string>("");
  const wallet = useWallet();
  const { activeVault } = useVaultSync();

  // Fetch winners from contract
  const fetchWinners = async () => {
    if (!wallet.connected) return;

    try {
      setLoading(true);
      setError("");

      const vaultAddr = activeVault.address;
      const readerProv = wallet.getPublicProvider?.();
      const sc = readerProv
        ? new SmartContract(readerProv as any, vaultAddr)
        : wallet.getContract(vaultAddr);

      // Get total winner count first
      const statsArgs = new Args();
      let stats, totalWinners;

      try {
        const statsRaw = await sc.read("getVaultStats", statsArgs);
        console.log("📊 Stats raw response:", statsRaw);

        const statsString = bytesToString(statsRaw);
        console.log("📊 Stats decoded:", statsString.substring(0, 100));
        stats = JSON.parse(statsString);
        totalWinners = parseInt(stats.winnerCount || "0");
        console.log("✅ Total winners found:", totalWinners);
      } catch (error) {
        console.error("❌ Could not fetch vault stats:", error);
        totalWinners = 0;
      }

      let finalWinners: Winner[] = [];

      if (totalWinners > 0) {
        try {
          // Fetch real winners from contract
          const args = new Args()
            .addU64(BigInt(0)) // start index
            .addU64(BigInt(totalWinners)); // fetch ALL winners (no limit)

          const rawWinners = await sc.read("getWinners", args);
          console.log("🏆 Winners raw response:", rawWinners);

          const winnersString = bytesToString(rawWinners);
          console.log("🏆 Winners decoded:", winnersString);
          const winnersData: any[] = JSON.parse(winnersString) || [];

          finalWinners = winnersData.map((w) => ({
            period: w.period || "",
            winner: w.address || w.winner || "", // Handle both 'address' and 'winner' fields
            prize: w.prize || "0",
            seed: w.seed || "",
            prizeAsMas: Number(w.prize) / 1e9,
            timestamp: w.timestamp || Number(w.period) || Date.now(),
          }));

          console.log(
            `✅ Loaded ${finalWinners.length} real winners from contract`
          );
        } catch (error) {
          console.error("Failed to fetch real winners:", error);
          setError("Unable to load winners from blockchain");
        }
      } else {
        console.log("ℹ️ No winners found yet - Wave 4 competition ongoing");
      }

      setWinners(finalWinners);
    } catch (err) {
      console.error("Failed to fetch winners:", err);
      setError(err instanceof Error ? err.message : "Failed to load winners");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchWinners();
  }, [wallet.connected, activeVault.address]);

  // Auto-refresh winners every 30 seconds to show new draws
  useEffect(() => {
    if (!wallet.connected) return;

    const interval = setInterval(() => {
      console.log("[Winners] Auto-refreshing winners data...");
      fetchWinners();
    }, 30000); // Refresh every 30 seconds

    return () => clearInterval(interval);
  }, [wallet.connected, activeVault.address]);

  // Filter and sort winners
  const filteredAndSortedWinners = useMemo(() => {
    let filtered = winners.filter(
      (winner) =>
        winner.winner.toLowerCase().includes(searchTerm.toLowerCase()) ||
        winner.period.includes(searchTerm) ||
        winner.seed.includes(searchTerm)
    );

    filtered.sort((a, b) => {
      let comparison = 0;
      if (sortBy === "period") {
        comparison = parseInt(a.period) - parseInt(b.period);
      } else if (sortBy === "prize") {
        comparison = a.prizeAsMas - b.prizeAsMas;
      }
      return sortOrder === "desc" ? -comparison : comparison;
    });

    return filtered;
  }, [winners, searchTerm, sortBy, sortOrder]);

  // Pagination
  const totalPages = Math.ceil(
    filteredAndSortedWinners.length / ITEMS_PER_PAGE
  );
  const paginatedWinners = filteredAndSortedWinners.slice(
    (currentPage - 1) * ITEMS_PER_PAGE,
    currentPage * ITEMS_PER_PAGE
  );

  // Copy address to clipboard
  const copyAddress = async (address: string) => {
    try {
      await navigator.clipboard.writeText(address);
      setCopiedAddress(address);
      setTimeout(() => setCopiedAddress(""), 2000);
    } catch (err) {
      console.error("Failed to copy:", err);
    }
  };

  // Truncate address for display
  const truncateAddress = (address: string) => {
    return `${address.slice(0, 8)}...${address.slice(-6)}`;
  };

  return (
    <div className="min-h-screen bg-gradient-to-b from-slate-950 via-slate-900 to-slate-950 relative overflow-hidden">
      {/* Animated Background Orbs */}
      <motion.div
        className="absolute top-20 -left-40 w-80 h-80 bg-yellow-500/20 rounded-full blur-3xl"
        animate={{
          scale: [1, 1.2, 1],
          opacity: [0.3, 0.5, 0.3],
        }}
        transition={{
          duration: 8,
          repeat: Infinity,
          ease: "easeInOut",
        }}
      />
      <motion.div
        className="absolute bottom-20 -right-40 w-80 h-80 bg-green-500/20 rounded-full blur-3xl"
        animate={{
          scale: [1.2, 1, 1.2],
          opacity: [0.5, 0.3, 0.5],
        }}
        transition={{
          duration: 8,
          repeat: Infinity,
          ease: "easeInOut",
        }}
      />

      <div className="container mx-auto px-4 py-20 relative z-10">
        {/* Hero */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8 }}
          className="text-center mb-16"
        >
          <motion.div
            className="inline-flex items-center justify-center w-20 h-20 rounded-2xl bg-gradient-to-br from-yellow-500 to-orange-600 mb-6"
            whileHover={{ scale: 1.1, rotate: 5 }}
            transition={{ type: "spring", stiffness: 400 }}
          >
            <Trophy className="h-10 w-10 text-white" />
          </motion.div>

          <h1 className="text-5xl md:text-6xl font-bold mb-6 bg-gradient-to-r from-yellow-400 via-orange-400 to-red-400 bg-clip-text text-transparent">
            Prize Winners
          </h1>

          <p className="text-xl text-slate-400 max-w-3xl mx-auto leading-relaxed">
            Complete history of all AutoPrize Vault drawings with full
            transparency and verifiability
          </p>
        </motion.div>

        {/* Stats */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.2 }}
          className="grid md:grid-cols-3 gap-8 mb-12"
        >
          <motion.div whileHover={{ y: -5 }}>
            <Card className="border-slate-800 bg-slate-900/50 backdrop-blur">
              <CardContent className="p-8">
                <div className="flex items-center gap-4">
                  <div className="p-3 rounded-xl bg-gradient-to-br from-yellow-500 to-orange-600">
                    <Trophy className="h-6 w-6 text-white" />
                  </div>
                  <div>
                    <div className="text-3xl font-bold text-white">
                      {winners.length}
                    </div>
                    <div className="text-slate-400">Total Draws</div>
                  </div>
                </div>
              </CardContent>
            </Card>
          </motion.div>

          <motion.div whileHover={{ y: -5 }}>
            <Card className="border-slate-800 bg-slate-900/50 backdrop-blur">
              <CardContent className="p-8">
                <div className="flex items-center gap-4">
                  <div className="p-3 rounded-xl bg-gradient-to-br from-green-500 to-emerald-600">
                    <Coins className="h-6 w-6 text-white" />
                  </div>
                  <div>
                    <div className="text-3xl font-bold text-white">
                      {winners
                        .reduce((sum, w) => sum + w.prizeAsMas, 0)
                        .toFixed(2)}
                    </div>
                    <div className="text-slate-400">Total Prizes (MAS)</div>
                  </div>
                </div>
              </CardContent>
            </Card>
          </motion.div>

          <motion.div whileHover={{ y: -5 }}>
            <Card className="border-slate-800 bg-slate-900/50 backdrop-blur">
              <CardContent className="p-8">
                <div className="flex items-center gap-4">
                  <div className="p-3 rounded-xl bg-gradient-to-br from-blue-500 to-cyan-600">
                    <Calendar className="h-6 w-6 text-white" />
                  </div>
                  <div>
                    <div className="text-3xl font-bold text-white">
                      {winners.length > 0
                        ? Math.max(...winners.map((w) => parseInt(w.period)))
                        : 0}
                    </div>
                    <div className="text-slate-400">Latest Period</div>
                  </div>
                </div>
              </CardContent>
            </Card>
          </motion.div>
        </motion.div>

        {/* Search */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.4 }}
          className="mb-8"
        >
          <Card className="border-slate-800 bg-slate-900/50 backdrop-blur">
            <CardContent className="p-6">
              <div className="relative">
                <Search className="absolute left-4 top-1/2 transform -translate-y-1/2 h-5 w-5 text-slate-400" />
                <Input
                  placeholder="Search by address, period, or seed..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="pl-12 h-12 bg-slate-800/50 border-slate-700 text-white placeholder:text-slate-400"
                />
              </div>
            </CardContent>
          </Card>
        </motion.div>

        {/* Winners List */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.6 }}
        >
          <Card className="border-slate-800 bg-slate-900/50 backdrop-blur">
            <CardContent className="p-8">
              {loading ? (
                <div className="space-y-4">
                  {[...Array(5)].map((_, i) => (
                    <div
                      key={i}
                      className="flex items-center gap-4 p-6 border border-slate-800 rounded-lg"
                    >
                      <Skeleton className="h-12 w-12 rounded" />
                      <div className="flex-1 space-y-2">
                        <Skeleton className="h-4 w-32" />
                        <Skeleton className="h-3 w-48" />
                      </div>
                      <Skeleton className="h-6 w-24" />
                    </div>
                  ))}
                </div>
              ) : error ? (
                <div className="text-center py-12">
                  <p className="text-red-400 mb-4">{error}</p>
                  <Button onClick={fetchWinners} variant="outline">
                    Retry
                  </Button>
                </div>
              ) : paginatedWinners.length === 0 ? (
                <div className="text-center py-12">
                  <Trophy className="mx-auto h-16 w-16 text-slate-600 mb-4" />
                  <p className="text-slate-400 text-lg mb-4">
                    {winners.length === 0
                      ? "🎯 Wave 4 competition is live! No winners declared yet."
                      : "No results found."}
                  </p>
                  {winners.length === 0 && !searchTerm && (
                    <p className="text-slate-500 text-sm mb-4">
                      Deposit into the vault to participate in the prize draw
                    </p>
                  )}
                  {searchTerm && (
                    <Button onClick={() => setSearchTerm("")} variant="outline">
                      Clear Search
                    </Button>
                  )}
                </div>
              ) : (
                <div className="space-y-4">
                  {paginatedWinners.map((winner, index) => (
                    <motion.div
                      key={`${winner.period}-${index}`}
                      initial={{ opacity: 0, x: -20 }}
                      animate={{ opacity: 1, x: 0 }}
                      transition={{ delay: index * 0.05 }}
                      whileHover={{ x: 5 }}
                      className="flex items-center gap-6 p-6 border border-slate-800 rounded-lg hover:bg-slate-800/50 transition-colors"
                    >
                      {/* Period */}
                      <Badge className="min-w-[100px] justify-center bg-gradient-to-r from-blue-500 to-cyan-500 hover:from-blue-600 hover:to-cyan-600">
                        Period {winner.period}
                      </Badge>

                      {/* Winner Info */}
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2 mb-1">
                          <span className="font-mono text-sm text-white">
                            {truncateAddress(winner.winner)}
                          </span>
                          <Button
                            variant="ghost"
                            size="sm"
                            onClick={() => copyAddress(winner.winner)}
                            className="h-6 w-6 p-0 hover:bg-slate-700"
                          >
                            {copiedAddress === winner.winner ? (
                              <Check size={14} className="text-green-400" />
                            ) : (
                              <Copy size={14} className="text-slate-400" />
                            )}
                          </Button>
                          <Button
                            variant="ghost"
                            size="sm"
                            onClick={() =>
                              window.open(
                                `https://explorer.massa.net/address/${winner.winner}`,
                                "_blank"
                              )
                            }
                            className="h-6 w-6 p-0 hover:bg-slate-700"
                          >
                            <ExternalLink
                              size={14}
                              className="text-slate-400"
                            />
                          </Button>
                        </div>
                        <div className="text-xs text-slate-500">
                          {winner.timestamp &&
                            new Date(winner.timestamp).toLocaleDateString()}
                        </div>
                      </div>

                      {/* Prize */}
                      <div className="text-right">
                        <div className="text-2xl font-bold bg-gradient-to-r from-green-400 to-emerald-400 bg-clip-text text-transparent">
                          {winner.prizeAsMas.toFixed(4)} MAS
                        </div>
                      </div>
                    </motion.div>
                  ))}
                </div>
              )}

              {/* Pagination */}
              {totalPages > 1 && (
                <div className="flex items-center justify-between mt-8 pt-6 border-t border-slate-800">
                  <p className="text-sm text-slate-400">
                    Showing {(currentPage - 1) * ITEMS_PER_PAGE + 1} to{" "}
                    {Math.min(
                      currentPage * ITEMS_PER_PAGE,
                      filteredAndSortedWinners.length
                    )}{" "}
                    of {filteredAndSortedWinners.length} results
                  </p>
                  <div className="flex items-center gap-3">
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={() =>
                        setCurrentPage(Math.max(1, currentPage - 1))
                      }
                      disabled={currentPage === 1}
                      className="border-slate-700 hover:bg-slate-800"
                    >
                      Previous
                    </Button>
                    <span className="text-sm text-slate-400">
                      Page {currentPage} of {totalPages}
                    </span>
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={() =>
                        setCurrentPage(Math.min(totalPages, currentPage + 1))
                      }
                      disabled={currentPage === totalPages}
                      className="border-slate-700 hover:bg-slate-800"
                    >
                      Next
                    </Button>
                  </div>
                </div>
              )}
            </CardContent>
          </Card>
        </motion.div>
      </div>
    </div>
  );
}
