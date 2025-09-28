import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Input } from '@/components/ui/input';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { Skeleton } from '@/components/ui/skeleton';
import { useVaultSync } from '@/hooks/useVaultSync';
import { useWallet } from '@/hooks/useWallet';
import { bytesToString } from '@/lib/bytes';
import { Args, SmartContract } from '@massalabs/massa-web3';
import { Calendar, Check, Coins, Copy, Download, ExternalLink, Hash, Search, Trophy } from 'lucide-react';
import { useEffect, useMemo, useState } from 'react';

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
  const [error, setError] = useState<string>('');
  const [currentPage, setCurrentPage] = useState(1);
  const [searchTerm, setSearchTerm] = useState('');
  const [sortBy, setSortBy] = useState<'period' | 'prize'>('period');
  const [sortOrder, setSortOrder] = useState<'asc' | 'desc'>('desc');
  const [copiedAddress, setCopiedAddress] = useState<string>('');
  const wallet = useWallet();
  const { activeVault } = useVaultSync();

  // Fetch winners from contract
  const fetchWinners = async () => {
    if (!wallet.connected) return;
    
    try {
      setLoading(true);
      setError('');
      
      const vaultAddr = activeVault.address;
      const readerProv = wallet.getPublicProvider?.();
      const sc = readerProv 
        ? new SmartContract(readerProv as any, vaultAddr) 
        : wallet.getContract(vaultAddr);

      // Get total winner count first
      const statsArgs = new Args();
      const statsRaw = await sc.read('getVaultStats', statsArgs);
      const stats = JSON.parse(bytesToString(statsRaw));
      const totalWinners = parseInt(stats.winnerCount || '0');

      if (totalWinners === 0) {
        setWinners([]);
        return;
      }

      // Fetch all winners (for now, optimize later if needed)
      const args = new Args()
        .addU64(BigInt(0))  // start index
        .addU64(BigInt(Math.min(totalWinners, 100))); // limit to 100 most recent

      const rawWinners = await sc.read('getWinners', args);
      const winnersData: Winner[] = JSON.parse(bytesToString(rawWinners)) || [];
      
      // Process winners data
      const processedWinners = winnersData.map((winner, index) => ({
        ...winner,
        prizeAsMas: Number(winner.prize) / 1e9,
        timestamp: Date.now() - (index * 24 * 60 * 60 * 1000), // Mock timestamps for now
      }));

      setWinners(processedWinners);
    } catch (err) {
      console.error('Failed to fetch winners:', err);
      setError(err instanceof Error ? err.message : 'Failed to load winners');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchWinners();
  }, [wallet.connected, activeVault.address]);

  // Filter and sort winners
  const filteredAndSortedWinners = useMemo(() => {
    let filtered = winners.filter(winner =>
      winner.winner.toLowerCase().includes(searchTerm.toLowerCase()) ||
      winner.period.includes(searchTerm) ||
      winner.seed.includes(searchTerm)
    );

    filtered.sort((a, b) => {
      let comparison = 0;
      if (sortBy === 'period') {
        comparison = parseInt(a.period) - parseInt(b.period);
      } else if (sortBy === 'prize') {
        comparison = a.prizeAsMas - b.prizeAsMas;
      }
      return sortOrder === 'desc' ? -comparison : comparison;
    });

    return filtered;
  }, [winners, searchTerm, sortBy, sortOrder]);

  // Pagination
  const totalPages = Math.ceil(filteredAndSortedWinners.length / ITEMS_PER_PAGE);
  const paginatedWinners = filteredAndSortedWinners.slice(
    (currentPage - 1) * ITEMS_PER_PAGE,
    currentPage * ITEMS_PER_PAGE
  );

  // CSV Export
  const exportToCSV = () => {
    const headers = ['Period', 'Winner Address', 'Prize (MAS)', 'Prize (nanoMAS)', 'Random Seed', 'Date'];
    const csvContent = [
      headers.join(','),
      ...filteredAndSortedWinners.map(winner => [
        winner.period,
        winner.winner,
        winner.prizeAsMas.toFixed(9),
        winner.prize,
        winner.seed,
        winner.timestamp ? new Date(winner.timestamp).toISOString() : 'N/A'
      ].join(','))
    ].join('\n');

    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    const url = URL.createObjectURL(blob);
    link.setAttribute('href', url);
    link.setAttribute('download', `autoprize-vault-winners-${new Date().toISOString().split('T')[0]}.csv`);
    link.style.visibility = 'hidden';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  // Copy address to clipboard
  const copyAddress = async (address: string) => {
    try {
      await navigator.clipboard.writeText(address);
      setCopiedAddress(address);
      setTimeout(() => setCopiedAddress(''), 2000);
    } catch (err) {
      console.error('Failed to copy:', err);
    }
  };

  // Truncate address for display
  const truncateAddress = (address: string) => {
    return `${address.slice(0, 8)}...${address.slice(-6)}`;
  };

  // Format seed for display
  const formatSeed = (seed: string) => {
    return `${seed.slice(0, 8)}...`;
  };

  return (
    <main className="container mx-auto px-4 py-8">
        <div className="max-w-6xl mx-auto space-y-6">
          {/* Header */}
          <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
            <div>
              <h1 className="text-3xl font-bold flex items-center gap-2">
                <Trophy className="text-yellow-500" />
                Prize Winners
              </h1>
              <p className="text-muted-foreground">
                Historical record of all AutoPrize Vault draws
              </p>
            </div>
            <Button
              onClick={exportToCSV}
              variant="outline"
              disabled={filteredAndSortedWinners.length === 0}
              className="flex items-center gap-2"
            >
              <Download size={16} />
              Export CSV
            </Button>
          </div>

          {/* Stats Cards */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <Card>
              <CardContent className="pt-6">
                <div className="flex items-center gap-2">
                  <Trophy className="text-yellow-500" size={20} />
                  <div>
                    <p className="text-2xl font-bold">{winners.length}</p>
                    <p className="text-sm text-muted-foreground">Total Draws</p>
                  </div>
                </div>
              </CardContent>
            </Card>
            <Card>
              <CardContent className="pt-6">
                <div className="flex items-center gap-2">
                  <Coins className="text-green-500" size={20} />
                  <div>
                    <p className="text-2xl font-bold">
                      {winners.reduce((sum, w) => sum + w.prizeAsMas, 0).toFixed(2)}
                    </p>
                    <p className="text-sm text-muted-foreground">Total Prizes (MAS)</p>
                  </div>
                </div>
              </CardContent>
            </Card>
            <Card>
              <CardContent className="pt-6">
                <div className="flex items-center gap-2">
                  <Calendar className="text-blue-500" size={20} />
                  <div>
                    <p className="text-2xl font-bold">
                      {winners.length > 0 ? Math.max(...winners.map(w => parseInt(w.period))) : 0}
                    </p>
                    <p className="text-sm text-muted-foreground">Latest Period</p>
                  </div>
                </div>
              </CardContent>
            </Card>
          </div>

          {/* Filters and Search */}
          <Card>
            <CardHeader>
              <CardTitle className="text-lg">Filter & Search</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="flex flex-col sm:flex-row gap-4">
                <div className="flex-1">
                  <div className="relative">
                    <Search className="absolute left-3 top-3 h-4 w-4 text-muted-foreground" />
                    <Input
                      placeholder="Search by address, period, or seed..."
                      value={searchTerm}
                      onChange={(e) => setSearchTerm(e.target.value)}
                      className="pl-10"
                    />
                  </div>
                </div>
                <Select value={sortBy} onValueChange={(value: 'period' | 'prize') => setSortBy(value)}>
                  <SelectTrigger className="w-[180px]">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="period">Sort by Period</SelectItem>
                    <SelectItem value="prize">Sort by Prize</SelectItem>
                  </SelectContent>
                </Select>
                <Button
                  variant="outline"
                  onClick={() => setSortOrder(sortOrder === 'asc' ? 'desc' : 'asc')}
                  className="min-w-[100px]"
                >
                  {sortOrder === 'desc' ? '↓ Desc' : '↑ Asc'}
                </Button>
              </div>
            </CardContent>
          </Card>

          {/* Winners List */}
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center justify-between">
                <span>Winners History</span>
                <Badge variant="secondary">
                  {filteredAndSortedWinners.length} results
                </Badge>
              </CardTitle>
            </CardHeader>
            <CardContent>
              {loading ? (
                <div className="space-y-3">
                  {[...Array(5)].map((_, i) => (
                    <div key={i} className="flex items-center gap-4 p-4 border rounded-lg">
                      <Skeleton className="h-10 w-10 rounded" />
                      <div className="flex-1 space-y-2">
                        <Skeleton className="h-4 w-24" />
                        <Skeleton className="h-3 w-48" />
                      </div>
                      <Skeleton className="h-6 w-20" />
                    </div>
                  ))}
                </div>
              ) : error ? (
                <div className="text-center py-8">
                  <p className="text-red-500 mb-4">{error}</p>
                  <Button onClick={fetchWinners} variant="outline">
                    Retry
                  </Button>
                </div>
              ) : paginatedWinners.length === 0 ? (
                <div className="text-center py-8">
                  <Trophy className="mx-auto h-12 w-12 text-muted-foreground mb-4" />
                  <p className="text-muted-foreground mb-4">
                    {winners.length === 0 ? 'No winners yet. Be the first!' : 'No results found.'}
                  </p>
                  {searchTerm && (
                    <Button onClick={() => setSearchTerm('')} variant="outline">
                      Clear Search
                    </Button>
                  )}
                </div>
              ) : (
                <div className="space-y-3">
                  {paginatedWinners.map((winner, index) => (
                    <div
                      key={`${winner.period}-${index}`}
                      className="flex items-center gap-4 p-4 border rounded-lg hover:bg-muted/50 transition-colors"
                    >
                      {/* Period Badge */}
                      <Badge variant="outline" className="min-w-[80px] justify-center">
                        Period {winner.period}
                      </Badge>

                      {/* Winner Info */}
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2">
                          <span className="font-mono text-sm">
                            {truncateAddress(winner.winner)}
                          </span>
                          <Button
                            variant="ghost"
                            size="sm"
                            onClick={() => copyAddress(winner.winner)}
                            className="h-6 w-6 p-0"
                          >
                            {copiedAddress === winner.winner ? (
                              <Check size={12} className="text-green-500" />
                            ) : (
                              <Copy size={12} />
                            )}
                          </Button>
                          <Button
                            variant="ghost"
                            size="sm"
                            onClick={() => window.open(`https://explorer.massa.net/address/${winner.winner}`, '_blank')}
                            className="h-6 w-6 p-0"
                          >
                            <ExternalLink size={12} />
                          </Button>
                        </div>
                        <div className="flex items-center gap-4 text-xs text-muted-foreground mt-1">
                          <span className="flex items-center gap-1">
                            <Hash size={10} />
                            Seed: {formatSeed(winner.seed)}
                          </span>
                          {winner.timestamp && (
                            <span className="flex items-center gap-1">
                              <Calendar size={10} />
                              {new Date(winner.timestamp).toLocaleDateString()}
                            </span>
                          )}
                        </div>
                      </div>

                      {/* Prize Amount */}
                      <div className="text-right">
                        <div className="font-bold text-lg text-green-600">
                          {winner.prizeAsMas.toFixed(4)} MAS
                        </div>
                        <div className="text-xs text-muted-foreground">
                          {parseInt(winner.prize).toLocaleString()} nano
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              )}

              {/* Pagination */}
              {totalPages > 1 && (
                <div className="flex items-center justify-between mt-6 pt-4 border-t">
                  <p className="text-sm text-muted-foreground">
                    Showing {(currentPage - 1) * ITEMS_PER_PAGE + 1} to{' '}
                    {Math.min(currentPage * ITEMS_PER_PAGE, filteredAndSortedWinners.length)} of{' '}
                    {filteredAndSortedWinners.length} results
                  </p>
                  <div className="flex items-center gap-2">
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={() => setCurrentPage(Math.max(1, currentPage - 1))}
                      disabled={currentPage === 1}
                    >
                      Previous
                    </Button>
                    <span className="text-sm">
                      Page {currentPage} of {totalPages}
                    </span>
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={() => setCurrentPage(Math.min(totalPages, currentPage + 1))}
                      disabled={currentPage === totalPages}
                    >
                      Next
                    </Button>
                  </div>
                </div>
              )}
            </CardContent>
          </Card>
        </div>
    </main>
  );
}