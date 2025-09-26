import { useState } from "react";
import { motion } from "framer-motion";
import confetti from "canvas-confetti";
import { DepositCard } from "@/components/vault/DepositCard";
import { WithdrawCard } from "@/components/vault/WithdrawCard";
import { StatsBar } from "@/components/vault/StatsBar";
import { OddsMeter } from "@/components/vault/OddsMeter";
import { WinnersFeed } from "@/components/vault/WinnersFeed";

const Vault = () => {
  const [userBalance, setUserBalance] = useState(0);
  const [userTickets, setUserTickets] = useState(0);

  const handleDeposit = (amount: number) => {
    setUserBalance(prev => prev + amount);
    setUserTickets(prev => prev + amount);
    
    // Trigger confetti on deposit
    confetti({
      particleCount: 100,
      spread: 70,
      origin: { y: 0.6 }
    });
  };

  const handleWithdraw = (amount: number) => {
    if (amount <= userBalance) {
      setUserBalance(prev => prev - amount);
      setUserTickets(prev => Math.max(0, prev - amount));
    }
  };

  // Mock stats data
  const stats = {
    tvl: 125000,
    participants: 342,
    prizePool: 2500,
    nextDrawTime: "2024-01-15T20:00:00Z"
  };

  return (
    <>
      <div className="container mx-auto px-4 py-8">
        {/* Stats Bar */}
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
        >
          <StatsBar {...stats} />
        </motion.div>

        {/* Main Grid */}
        <div className="mt-8 grid gap-8 lg:grid-cols-3">
          {/* Left Column - Deposit/Withdraw */}
          <div className="space-y-6 lg:col-span-2">
            <motion.div
              initial={{ opacity: 0, x: -30 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ duration: 0.6, delay: 0.1 }}
            >
              <DepositCard onDeposit={handleDeposit} />
            </motion.div>

            <motion.div
              initial={{ opacity: 0, x: -30 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ duration: 0.6, delay: 0.2 }}
            >
              <WithdrawCard
                onWithdraw={handleWithdraw}
                userBalance={userBalance}
              />
            </motion.div>

            <motion.div
              initial={{ opacity: 0, x: -30 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ duration: 0.6, delay: 0.3 }}
            >
              <OddsMeter
                userTickets={userTickets}
                totalTickets={stats.participants * 15} // Mock calculation
              />
            </motion.div>
          </div>

          {/* Right Column - Winners Feed */}
          <motion.div
            initial={{ opacity: 0, x: 30 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ duration: 0.6, delay: 0.4 }}
            className="lg:col-span-1"
          >
            <WinnersFeed />
          </motion.div>
        </div>
      </div>
    </>
  );
};

export default Vault;