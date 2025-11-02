import { NetworkBanner } from "@/components/NetworkBanner";
import { NetworkIndicator } from "@/components/onboarding/NetworkIndicator";
import { ReadOnlyBanner } from "@/components/onboarding/ReadOnlyBanner";
import {
  OddsMeterSkeleton,
  StatsSkeleton,
  VaultCardSkeleton,
  WinnersFeedSkeleton,
} from "@/components/ui/loading-skeletons";
import { OddsMeter } from "@/components/vault/OddsMeter";
import { QuickDeposit } from "@/components/vault/QuickDeposit";
import { RiskTierSelectorEnhanced } from "@/components/vault/RiskTierSelectorEnhanced";
import { StatsBar } from "@/components/vault/StatsBar";
import { VaultSelector } from "@/components/vault/VaultSelector";
import { WinnersFeed } from "@/components/vault/WinnersFeed";
import { WithdrawCard } from "@/components/vault/WithdrawCard";
import { useVaultSync } from "@/hooks/useVaultSync";
import { useWallet } from "@/hooks/useWallet";
import { computeNextDrawISO, extractCurrentPeriod } from "@/lib/periods";
import { calculateUserMetrics } from "@/lib/userMetrics";
import { useVaultStore } from "@/state/vaultStore";
import { motion } from "framer-motion";
import { Trophy } from "lucide-react";
import { useEffect, useState } from "react";

const Vault = () => {
  const { connected, connect, address, getContract, getPublicProvider } =
    useWallet();
  const stats = useVaultStore((s) => s.stats);
  const user = useVaultStore((s) => s.user);
  const loading = useVaultStore((s) => s.loading);
  const selectedRiskTier = useVaultStore((s) => s.selectedRiskTier);
  const timeInVault = useVaultStore((s) => s.timeInVault);
  const estimatedYield = useVaultStore((s) => s.estimatedYield);
  const prizesWon = useVaultStore((s) => s.prizesWon);
  const setContext = useVaultStore((s) => s.setContext);
  const setRiskTier = useVaultStore((s) => s.setRiskTier);
  const updateUserMetrics = useVaultStore((s) => s.updateUserMetrics);
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
  }, [
    connected,
    connect,
    address,
    getContract,
    getPublicProvider,
    setContext,
    refetchWithRetry,
  ]);

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
        if (!stop)
          setNextDrawTime(computeNextDrawISO(stats.nextDrawPeriod, curr));
      } catch (e) {
        if (!stop) setNextDrawTime("Drawing...");
      }
    }
    updateNextDraw();
    const id = setInterval(updateNextDraw, 5000);
    return () => {
      stop = true;
      clearInterval(id);
    };
  }, [stats, getPublicProvider]);

  // Update user metrics when user data or risk tier changes
  useEffect(() => {
    if (user?.principalMas && user.principalMas > 0) {
      const firstDepositTime = localStorage.getItem(
        `autoprize-first-deposit-${address}`
      )
        ? parseInt(localStorage.getItem(`autoprize-first-deposit-${address}`)!)
        : Date.now();

      const metrics = calculateUserMetrics(
        user.principalMas,
        firstDepositTime,
        selectedRiskTier
      );

      updateUserMetrics(
        metrics.timeInVault,
        metrics.estimatedYield,
        metrics.prizesWon
      );

      // Store first deposit time if not already stored
      if (!localStorage.getItem(`autoprize-first-deposit-${address}`)) {
        localStorage.setItem(
          `autoprize-first-deposit-${address}`,
          firstDepositTime.toString()
        );
      }
    }
  }, [user?.principalMas, selectedRiskTier, address, updateUserMetrics]);

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950">
      {/* Animated Hero Section */}
      <section className="relative overflow-hidden py-16 border-b border-slate-800/50">
        <motion.div
          className="absolute top-0 left-1/4 w-96 h-96 bg-blue-500/10 rounded-full blur-3xl"
          animate={{
            scale: [1, 1.2, 1],
            opacity: [0.2, 0.4, 0.2],
          }}
          transition={{
            duration: 8,
            repeat: Infinity,
            ease: "easeInOut",
          }}
        />
        <motion.div
          className="absolute bottom-0 right-1/4 w-96 h-96 bg-purple-500/10 rounded-full blur-3xl"
          animate={{
            scale: [1.2, 1, 1.2],
            opacity: [0.2, 0.4, 0.2],
          }}
          transition={{
            duration: 10,
            repeat: Infinity,
            ease: "easeInOut",
          }}
        />

        <div className="relative container mx-auto px-4 text-center">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-gradient-to-r from-blue-500/10 to-purple-500/10 border border-blue-500/20 mb-6"
          >
            <Trophy className="w-4 h-4 text-yellow-400" />
            <span className="text-sm font-medium text-blue-400">
              {stats?.tvlMas?.toFixed(2) || "0"} MAS Total Value Locked
            </span>
          </motion.div>

          <motion.h1
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1, duration: 0.6 }}
            className="text-4xl md:text-5xl font-bold mb-4"
          >
            <span className="bg-gradient-to-r from-white via-blue-100 to-white bg-clip-text text-transparent">
              Prize Vault
            </span>
          </motion.h1>

          <motion.p
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2, duration: 0.6 }}
            className="text-slate-300 text-xl max-w-3xl mx-auto"
          >
            Deposit any amount • Win weekly prizes • Withdraw anytime • 200 MAS
            prize pool
          </motion.p>
        </div>
      </section>

      <div className="container mx-auto px-4 py-8">
        <NetworkBanner />
        {!connected && <ReadOnlyBanner />}
        <NetworkIndicator />

        {/* Vault Selector */}
        <motion.div
          initial={{ opacity: 0, y: -10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4 }}
          className="mb-6"
        >
          <VaultSelector />
        </motion.div>

        {/* Stats Bar */}
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
        >
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

        {/* Risk Tier Selector - Wave 3 Feature */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.2 }}
          className="mt-8"
        >
          <div className="mb-4">
            <h2 className="text-2xl sm:text-3xl font-bold text-center mb-2 bg-gradient-to-r from-primary to-blue-600 bg-clip-text text-transparent">
              Choose Your Risk, Maximize Your Rewards
            </h2>
            <p className="text-muted-foreground text-center max-w-3xl mx-auto text-base sm:text-lg">
              Experience configurable risk/reward with transparent APY up to{" "}
              <span className="font-bold text-primary">20%</span>. Your deposits
              work harder with our autonomous prize system while you maintain
              control over your risk level.
            </p>
          </div>
          <RiskTierSelectorEnhanced
            selectedTier={selectedRiskTier}
            onTierSelect={setRiskTier}
          />
        </motion.div>

        {/* Main Content - Clean & Simple */}
        <div className="mt-8 grid gap-6 lg:grid-cols-3">
          {/* Left Column - Deposit & Withdraw */}
          <div className="space-y-6 lg:col-span-2">
            <motion.div
              initial={{ opacity: 0, y: 30 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.6, delay: 0.1 }}
              whileHover={{ y: -5, transition: { duration: 0.2 } }}
            >
              {loading.isLoading && !stats ? (
                <VaultCardSkeleton title="Deposit" />
              ) : (
                <QuickDeposit
                  selectedRiskTier={selectedRiskTier}
                  onDeposit={(amount) => {
                    setTimeout(() => refetchWithRetry(undefined, true), 2000);
                  }}
                />
              )}
            </motion.div>

            <motion.div
              initial={{ opacity: 0, y: 30 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.6, delay: 0.2 }}
              whileHover={{ y: -5, transition: { duration: 0.2 } }}
            >
              {loading.isLoading && !user ? (
                <VaultCardSkeleton title="Withdraw" />
              ) : (
                <WithdrawCard
                  userBalanceMas={user?.principalMas || 0}
                  selectedRiskTier={selectedRiskTier}
                />
              )}
            </motion.div>

            <motion.div
              initial={{ opacity: 0, y: 30 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.6, delay: 0.3 }}
              whileHover={{ y: -5, transition: { duration: 0.2 } }}
            >
              {loading.isLoading && !stats ? (
                <OddsMeterSkeleton />
              ) : (
                <OddsMeter
                  userTickets={user?.sharesNum || 0}
                  totalTickets={stats?.totalSharesNum || 0}
                />
              )}
            </motion.div>
          </div>

          {/* Right Column - Winners Feed */}
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, delay: 0.4 }}
            className="lg:col-span-1"
          >
            {loading.isLoading ? <WinnersFeedSkeleton /> : <WinnersFeed />}
          </motion.div>
        </div>
      </div>
    </div>
  );
};

export default Vault;
