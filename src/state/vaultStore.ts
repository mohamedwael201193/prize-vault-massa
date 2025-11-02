import { bytesToString } from "@/lib/bytes";
import {
  BlockConfirmationWaiter,
  LoadingState,
  PerformanceMonitor,
  RetryManager,
  createLoadingState,
} from "@/lib/performance";
import { getVaultAddr } from "@/lib/sanity";
import { Args, SmartContract } from "@massalabs/massa-web3";
import { create } from "zustand";

type Stats = {
  tvl: string;
  totalShares: string;
  prizePool: string;
  participants: string;
  nextDrawPeriod: string;
  drawPeriods: string;
  tickPeriods: string;
  minPrizeThreshold: string;
  winnerCount: string;
  lastDrawPeriod: string;
  contractVersion: string;
  proposalCount: string;
  tvlMas: number;
  prizePoolMas: number;
  totalSharesNum: number;
};

type User = {
  shares: string;
  principal: string;
  sharesNum: number;
  principalMas: number;
};

type SCFactory = (addr: string) => SmartContract;

type Ctx = {
  getContract: SCFactory;
  address: string;
  getPublicProvider?: () => any;
} | null;

function nanoToMas(n: string | number | bigint) {
  const v =
    typeof n === "string" ? BigInt(n) : typeof n === "number" ? BigInt(n) : n;
  return Number(v) / 1e9; // 1 MAS = 1e9 nano
}

type VaultState = {
  stats: Stats | null;
  user: User | null;
  vaultAddress: string;
  loading: LoadingState;
  selectedRiskTier: string;
  timeInVault: number; // days since first deposit
  estimatedYield: number; // MAS earned from staking
  prizesWon: number; // MAS earned from prizes
  setContext: (c: Ctx) => void;
  setVaultAddress: (address: string) => void;
  setRiskTier: (tierId: string) => void;
  updateUserMetrics: (
    timeInVault: number,
    estimatedYield: number,
    prizesWon: number
  ) => void;
  refetch: (vaultAddr?: string, forceUpdate?: boolean) => Promise<void>;
  refetchWithRetry: (
    vaultAddr?: string,
    forceUpdate?: boolean
  ) => Promise<void>;
  mutateAfterEvent: (evts: readonly any[]) => void;
  waitForConfirmation: (txId: string) => Promise<boolean>;
  setLoading: (loading: LoadingState) => void;
};

let ctx: Ctx = null;
let version = 0; // monotonic refetch version
let lastOptimisticUpdate = 0; // timestamp of last optimistic update

// Performance utilities
const retryManager = new RetryManager();
const performanceMonitor = PerformanceMonitor.getInstance();

// Helper applies optimistic updates from events
function applyVaultEvents(
  prev: { stats: Stats | null; user: User | null },
  events: readonly any[]
): { stats: Stats | null; user: User | null } {
  let stats = prev.stats ? { ...prev.stats } : null;
  let user = prev.user ? { ...prev.user } : null;

  console.debug(
    "[Store] Applying vault events optimistically:",
    events?.length || 0
  );

  for (const e of events ?? []) {
    const data = String(e?.data ?? "");
    // Accept formats like: "deposit:address:1000000000" or "withdraw:address:1990000000"
    const m = data.match(/^(deposit|withdraw):([^:]+):(\d+)$/i);
    if (!m) {
      console.debug("[Store] Skipping unmatched event:", data);
      continue;
    }

    const kind = m[1].toLowerCase();
    const addr = m[2];
    const shares = BigInt(m[3]);
    const mas = Number(shares) / 1e9; // assume 1:1 shares to nano MAS

    console.debug(`[Store] Processing ${kind} event: ${addr} ${mas} MAS`);
    console.debug(`[Store] Current user address: ${ctx?.address}`);
    console.debug(`[Store] Event address: ${addr}`);
    console.debug(`[Store] Address match: ${ctx?.address === addr}`);

    // Update TVL for all events
    if (kind === "deposit") {
      if (stats) {
        stats.tvlMas = Math.max(0, (stats.tvlMas ?? 0) + mas);
        stats.totalSharesNum = (stats.totalSharesNum ?? 0) + Number(shares);
      }
      // Update user only if it's their event
      if (user && ctx?.address && addr === ctx.address) {
        user.principalMas = Math.max(0, (user.principalMas ?? 0) + mas);
        user.sharesNum = (user.sharesNum ?? 0) + Number(shares);
      }
    } else if (kind === "withdraw") {
      if (stats) {
        console.debug(
          `[Store] WITHDRAW: TVL before: ${stats.tvlMas}, subtracting: ${mas}`
        );
        stats.tvlMas = Math.max(0, (stats.tvlMas ?? 0) - mas);
        stats.totalSharesNum = Math.max(
          0,
          (stats.totalSharesNum ?? 0) - Number(shares)
        );
        console.debug(`[Store] WITHDRAW: TVL after: ${stats.tvlMas}`);
      }
      // Update user only if it's their event
      if (user && ctx?.address && addr === ctx.address) {
        user.principalMas = Math.max(0, (user.principalMas ?? 0) - mas);
        user.sharesNum = Math.max(0, (user.sharesNum ?? 0) - Number(shares));
      }
    }
  }

  return { stats, user };
}

// Load persisted risk tier
const getPersistedRiskTier = () => {
  try {
    return localStorage.getItem("autoprize-risk-tier") || "conservative";
  } catch {
    return "conservative";
  }
};

export const useVaultStore = create<VaultState>((set, get) => ({
  stats: null,
  user: null,
  vaultAddress: getVaultAddr(),
  loading: createLoadingState(),
  selectedRiskTier: getPersistedRiskTier(),
  timeInVault: 0,
  estimatedYield: 0,
  prizesWon: 0,
  setContext: (c) => {
    ctx = c;
  },
  setRiskTier: (tierId) => {
    set({ selectedRiskTier: tierId });
    // Persist to localStorage
    localStorage.setItem("autoprize-risk-tier", tierId);
  },
  updateUserMetrics: (timeInVault, estimatedYield, prizesWon) => {
    set({ timeInVault, estimatedYield, prizesWon });
  },
  setVaultAddress: (address) => {
    set({
      vaultAddress: address,
      stats: null,
      user: null,
      loading: createLoadingState(),
    });
  },
  setLoading: (loading) => {
    set({ loading });
  },
  mutateAfterEvent: (events) => {
    // Optimistic reducer based on SC event data
    lastOptimisticUpdate = Date.now();
    console.debug(
      `[Store] Optimistic update at timestamp: ${lastOptimisticUpdate}`
    );
    set((prev) => ({ ...prev, ...applyVaultEvents(prev, events) }));
  },
  waitForConfirmation: async (txId: string) => {
    if (!ctx?.getPublicProvider) return false;

    try {
      const waiter = new BlockConfirmationWaiter(ctx.getPublicProvider());
      return await waiter.waitForConfirmation(txId, 2, 20000); // 2 blocks, 20 second timeout
    } catch (error) {
      console.error("[Store] Error waiting for confirmation:", error);
      return false;
    }
  },
  refetchWithRetry: async (vaultAddr?: string, forceUpdate = false) => {
    const targetVault = vaultAddr || get().vaultAddress;

    return await retryManager.executeWithRetry(
      `refetch-${targetVault}`,
      () =>
        performanceMonitor.measure("refetch", () =>
          get().refetch(vaultAddr, forceUpdate)
        ),
      {
        maxRetries: 3,
        baseDelay: 1000,
        maxDelay: 8000,
      }
    );
  },
  refetch: async (vaultAddr?: string, forceUpdate = false) => {
    if (!ctx) return;
    const myV = ++version; // Capture version at start
    const targetVault = vaultAddr || get().vaultAddress;

    // Update loading state
    set({
      loading: createLoadingState(true, "refetch", "Loading vault data...", 0),
    });

    console.debug(
      `[Store] Starting refetch version ${myV} for vault ${targetVault}${
        forceUpdate ? " (FORCE UPDATE)" : ""
      }`
    );

    const readerProv = ctx.getPublicProvider?.();
    const sc = readerProv
      ? new SmartContract(readerProv as any, targetVault) // public provider for consistent reads
      : ctx.getContract(targetVault); // fallback to wallet-bound SC

    try {
      // Update progress
      set({
        loading: createLoadingState(
          true,
          "refetch",
          "Fetching contract data...",
          25
        ),
      });

      // Add retry logic for new contract deployments
      let rawStats, rawUser;
      try {
        [rawStats, rawUser] = await Promise.all([
          sc.read("getVaultStats", new Args()),
          sc.read("getUserPosition", new Args().addString(ctx.address)),
        ]);
      } catch (contractError) {
        // If contract is not ready yet (new deployment), provide default values
        console.warn(
          "[Store] Contract not ready yet, using defaults:",
          contractError
        );
        rawStats = JSON.stringify({
          tvl: "0",
          totalShares: "0",
          prizePool: "0",
          participants: "0",
          nextDrawPeriod: "0",
          drawPeriods: "5400",
          tickPeriods: "225",
          minPrizeThreshold: "100000000",
          winnerCount: "0",
          lastDrawPeriod: "0",
          contractVersion: "1.0.0",
          proposalCount: "0",
        });
        rawUser = JSON.stringify({
          shares: "0",
          principal: "0",
          effectiveTickets: "0",
        });
      }

      // Update progress
      set({
        loading: createLoadingState(true, "refetch", "Processing data...", 75),
      });

      // If a newer refetch started, drop this response
      if (myV !== version) {
        console.debug(
          `[Store] Dropping stale refetch ${myV}, current is ${version}`
        );
        return;
      }

      // If this refetch is too close to a recent optimistic update, it might be stale
      const timeSinceOptimistic = Date.now() - lastOptimisticUpdate;
      if (timeSinceOptimistic < 5000) {
        // 5 seconds grace period
        console.debug(
          `[Store] Refetch ${myV} might be stale (${timeSinceOptimistic}ms since optimistic), proceeding with caution`
        );
      }

      const s = JSON.parse(bytesToString(rawStats));
      const u = JSON.parse(bytesToString(rawUser));

      console.debug(`[Store] Refetch ${myV} completed, updating state`);
      console.debug(
        `[Store] Raw TVL from contract: ${s.tvl}, converted: ${nanoToMas(
          s.tvl
        )}`
      );

      // Get current state to compare with authoritative data
      const currentState = useVaultStore.getState();
      const currentTvl = currentState.stats?.tvlMas || 0;
      const authoritativeTvl = nanoToMas(s.tvl);

      console.log(
        `[Store] 📊 Authoritative TVL from blockchain: ${authoritativeTvl} MAS`
      );
      console.log(
        `[Store] 📊 Current displayed TVL (optimistic): ${currentTvl} MAS`
      );
      console.log(
        `[Store] ⏰ Time since last optimistic update: ${timeSinceOptimistic}ms`
      );

      // Check if we recently made a withdraw - if so, trust optimistic update longer
      const lastWithdrawTime = (currentState as any).lastWithdrawTime || 0;
      const timeSinceWithdraw = Date.now() - lastWithdrawTime;

      // If we recently made an optimistic update and the authoritative data doesn't match,
      // give the blockchain more time to update (especially for withdraws)
      const graceTime = timeSinceWithdraw < 30000 ? 15000 : 10000; // 15s for recent withdraws, 10s otherwise

      // Skip grace period if forceUpdate is true
      if (
        !forceUpdate &&
        timeSinceOptimistic < graceTime &&
        Math.abs(currentTvl - authoritativeTvl) > 0.01
      ) {
        console.warn(
          `[Store] 🚫 BLOCKING UPDATE: Authoritative TVL (${authoritativeTvl} MAS) differs from optimistic (${currentTvl} MAS)`
        );
        console.warn(
          `[Store] 🚫 Grace period: ${graceTime}ms, time since optimistic: ${timeSinceOptimistic}ms`
        );
        console.warn(
          `[Store] 🚫 Wait ${Math.ceil(
            (graceTime - timeSinceOptimistic) / 1000
          )}s more, then refresh to see blockchain data`
        );

        // Don't override if we're within grace period
        return; // Keep optimistic update
      }

      if (forceUpdate) {
        console.log(
          `[Store] 💪 FORCE UPDATE: Bypassing grace period to show blockchain data`
        );
      }

      console.log(
        `[Store] ✅ Updating display with authoritative blockchain data: ${authoritativeTvl} MAS`
      );

      set({
        stats: {
          ...s,
          nextDrawPeriod: String(s.nextDrawPeriod ?? ""),
          drawPeriods: String(s.drawPeriods ?? "100"),
          tickPeriods: String(s.tickPeriods ?? "10"),
          minPrizeThreshold: String(s.minPrizeThreshold ?? "100000000"),
          winnerCount: String(s.winnerCount ?? "0"),
          lastDrawPeriod: String(s.lastDrawPeriod ?? "0"),
          contractVersion: String(s.contractVersion ?? "1.0.0"),
          proposalCount: String(s.proposalCount ?? "0"),
          tvlMas: authoritativeTvl,
          prizePoolMas: nanoToMas(s.prizePool),
          totalSharesNum: Number(s.totalShares),
        },
        user: {
          ...u,
          sharesNum: Number(u.shares),
          principalMas: nanoToMas(u.principal),
        },
        loading: createLoadingState(false), // Success - clear loading
      });
    } catch (error) {
      console.error(`[Store] Refetch ${myV} failed:`, error);
      const retryCount = retryManager.getRetryCount(`refetch-${targetVault}`);
      set({
        loading: {
          ...createLoadingState(false),
          error: String(error),
          retryCount,
        },
      });
    }
  },
}));
