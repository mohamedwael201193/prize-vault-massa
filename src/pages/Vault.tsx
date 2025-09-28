import { DiagnosticsPanel } from "@/components/DiagnosticsPanel";
import { NetworkBanner } from "@/components/NetworkBanner";
import { FeesAndRisks } from "@/components/onboarding/FeesAndRisks";
import { NetworkIndicator } from "@/components/onboarding/NetworkIndicator";
import { OnboardingTour } from "@/components/onboarding/OnboardingTour";
import { ReadOnlyBanner } from "@/components/onboarding/ReadOnlyBanner";
import { Badge } from "@/components/ui/badge";
import {
    OddsMeterSkeleton,
    ProgressBar,
    StatsSkeleton,
    VaultCardSkeleton,
    WinnersFeedSkeleton
} from "@/components/ui/loading-skeletons";
import { AdvancedAnalytics } from "@/components/vault/AdvancedAnalytics";
import { DepositCard } from "@/components/vault/DepositCard";
import { OddsMeter } from "@/components/vault/OddsMeter";
import { StatsBar } from "@/components/vault/StatsBar";
import { VaultSelector } from "@/components/vault/VaultSelector";
import { WinnersFeed } from "@/components/vault/WinnersFeed";
import { WithdrawCard } from "@/components/vault/WithdrawCard";
import { useVaultSync } from "@/hooks/useVaultSync";
import { useWallet } from "@/hooks/useWallet";
import { computeNextDrawISO, extractCurrentPeriod } from "@/lib/periods";
import { useVaultStore } from "@/state/vaultStore";
import { motion } from "framer-motion";
import { Activity } from "lucide-react";
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const Vault = () => {
  const { connected, connect, address, getContract, getPublicProvider } = useWallet();
  const stats = useVaultStore((s) => s.stats);
  const user = useVaultStore((s) => s.user);
  const loading = useVaultStore((s) => s.loading);
  const setContext = useVaultStore((s) => s.setContext);
  const refetchWithRetry = useVaultStore((s) => s.refetchWithRetry);
  
  // Use vault sync to keep store in sync with active vault
  const { activeVault } = useVaultSync();

  const [nextDrawTime, setNextDrawTime] = useState("Drawing...");
  const [showOnboarding, setShowOnboarding] = useState(false);

  useEffect(() => {
    (async () => {
      if (!connected) await connect();
      if (address) {
        setContext({ getContract, address, getPublicProvider });
        await refetchWithRetry();
      }
    })();
  }, [connected, connect, address, getContract, getPublicProvider, setContext, refetchWithRetry]);

  useEffect(() => {
    let stop = false;
    async function updateNextDraw() {
      try {
        const prov = getPublicProvider();
        if (!prov?.getNodeStatus || !stats?.nextDrawPeriod) {
          if (!stop) setNextDrawTime("Drawing...");
          return;
        }
        const status = await prov.getNodeStatus();
        const curr = extractCurrentPeriod(status);
        if (!stop) setNextDrawTime(computeNextDrawISO(stats.nextDrawPeriod, curr));
      } catch (e) {
        if (!stop) setNextDrawTime("Drawing...");
      }
    }
    updateNextDraw();
    const id = setInterval(updateNextDraw, 5000);
    return () => { stop = true; clearInterval(id); };
  }, [stats, getPublicProvider]);

  return (
    <div className="container mx-auto px-4 py-8">
      <NetworkBanner />
      
      {/* Network Status & Read-Only Mode */}
      {!connected && <ReadOnlyBanner />}
      <NetworkIndicator />
      
      {/* Vault Selector with Help */}
      <motion.div 
        initial={{ opacity: 0, y: -10 }} 
        animate={{ opacity: 1, y: 0 }} 
        transition={{ duration: 0.4 }}
        className="mb-6 flex items-center justify-between"
      >
        <VaultSelector />
        <div className="flex items-center gap-2">
          <Link to="/autonomy">
            <Badge className="bg-green-100 text-green-800 hover:bg-green-200 transition-colors cursor-pointer">
              <Activity className="h-3 w-3 mr-1" />
              Autonomy
            </Badge>
          </Link>
          <FeesAndRisks />
          <OnboardingTour 
            isOpen={showOnboarding}
            onClose={() => setShowOnboarding(false)}
            onComplete={() => setShowOnboarding(false)}
          />
        </div>
      </motion.div>
      
      {/* Loading Progress */}
      {loading.isLoading && (
        <motion.div 
          initial={{ opacity: 0 }} 
          animate={{ opacity: 1 }} 
          className="mb-6"
        >
          <ProgressBar 
            progress={loading.progress || 0} 
            label={loading.stage} 
            className="max-w-md mx-auto"
          />
        </motion.div>
      )}

      {/* Stats Bar */}
      <motion.div initial={{ opacity: 0, y: -20 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.6 }}>
        {loading.isLoading && !stats ? (
          <StatsSkeleton />
        ) : (
          <StatsBar
            tvl={stats?.tvlMas || 0}
            participants={Number(stats?.participants || 0)}
            prizePool={stats?.prizePoolMas || 0}
            nextDrawTime={nextDrawTime}
          />
        )}
      </motion.div>

      {/* Main Content */}
      <div className="mt-8 grid gap-8 lg:grid-cols-3">
        <div className="space-y-6 lg:col-span-2">
          <motion.div initial={{ opacity: 0, x: -30 }} animate={{ opacity: 1, x: 0 }} transition={{ duration: 0.6, delay: 0.1 }}>
            {loading.isLoading && !stats ? (
              <VaultCardSkeleton title="Deposit MAS" />
            ) : (
              <DepositCard />
            )}
          </motion.div>
          <motion.div initial={{ opacity: 0, x: -30 }} animate={{ opacity: 1, x: 0 }} transition={{ duration: 0.6, delay: 0.2 }}>
            {loading.isLoading && !user ? (
              <VaultCardSkeleton title="Withdraw MAS" />
            ) : (
              <WithdrawCard userBalanceMas={user?.principalMas || 0} />
            )}
          </motion.div>
          <motion.div initial={{ opacity: 0, x: -30 }} animate={{ opacity: 1, x: 0 }} transition={{ duration: 0.6, delay: 0.3 }}>
            {loading.isLoading && !stats ? (
              <OddsMeterSkeleton />
            ) : (
              <OddsMeter userTickets={user?.sharesNum || 0} totalTickets={stats?.totalSharesNum || 0} />
            )}
          </motion.div>
        </div>
        <motion.div initial={{ opacity: 0, x: 30 }} animate={{ opacity: 1, x: 0 }} transition={{ duration: 0.6, delay: 0.4 }} className="lg:col-span-1">
          {loading.isLoading ? (
            <WinnersFeedSkeleton />
          ) : (
            <WinnersFeed />
          )}
        </motion.div>
      </div>
      
      {/* Advanced Analytics - Competitive Advantage */}
      <div className="mb-6">
        <AdvancedAnalytics loading={loading.isLoading} />
      </div>
      
      <DiagnosticsPanel />
    </div>
  );
};

export default Vault;