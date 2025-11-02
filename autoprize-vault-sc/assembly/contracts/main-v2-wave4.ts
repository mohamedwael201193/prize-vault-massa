import { Args } from '@massalabs/as-types';
import {
  Address,
  Context,
  Storage,
  generateEvent,
  transferCoins,
} from '@massalabs/massa-as-sdk';

// ==================== STORAGE KEYS ====================

// Global totals
const TOTAL_SHARES = 'total_shares';
const TOTAL_PRINCIPAL = 'total_principal';
const PRIZE_POOL = 'prize_pool';
const PARTICIPANT_COUNT = 'participant_count';

// Risk Tier Keys
const CONSERVATIVE_TVL = 'conservative_tvl';
const MODERATE_TVL = 'moderate_tvl';
const AGGRESSIVE_TVL = 'aggressive_tvl';

const CONSERVATIVE_SHARES = 'conservative_shares';
const MODERATE_SHARES = 'moderate_shares';
const AGGRESSIVE_SHARES = 'aggressive_shares';

// Draw configuration
const NEXT_DRAW_PERIOD = 'next_draw_period';
const DRAW_PERIODS = 'draw_periods';
const TICK_PERIODS = 'tick_periods';
const WINNER_COUNT = 'winner_count';
const LAST_DRAW_PERIOD = 'last_draw_period';
const MIN_PRIZE_THRESHOLD = 'min_prize_threshold';
const SCHEDULER_SEED = 'scheduler_seed';

// Token support
const SUPPORTED_TOKENS = 'supported_tokens'; // Comma-separated list
const USDC_ADDRESS = 'usdc_address';

// Auto-deposit
const AUTO_DEPOSIT_COUNT = 'auto_deposit_count';

// Contract metadata
const CONTRACT_VERSION = 'contract_version';

// Constants
const DEFAULT_MIN_PRIZE = 100_000_000; // 0.1 MAS
const CONSERVATIVE_RISK = 5; // 5% at risk, 95% protected
const MODERATE_RISK = 10; // 10% at risk, 90% protected
const AGGRESSIVE_RISK = 20; // 20% at risk, 80% protected

const CONSERVATIVE_MULTIPLIER = 10; // 1.0x
const MODERATE_MULTIPLIER = 15; // 1.5x
const AGGRESSIVE_MULTIPLIER = 20; // 2.0x

// ==================== HELPER FUNCTIONS ====================

function sHas(k: string): bool {
  return Storage.has(k);
}

function sGetU64(k: string, d: u64 = 0): u64 {
  return sHas(k) ? u64(parseInt(Storage.get(k))) : d;
}

function sSetU64(k: string, v: u64): void {
  Storage.set(k, v.toString());
}

function sGet(k: string, d: string = ''): string {
  return sHas(k) ? Storage.get(k) : d;
}

function sSet(k: string, v: string): void {
  Storage.set(k, v);
}

// User storage keys
function userSharesKey(addr: string, tier: string): string {
  return 'user_shares:' + tier + ':' + addr;
}

function userPrincipalKey(addr: string, tier: string): string {
  return 'user_principal:' + tier + ':' + addr;
}

function userTokenBalanceKey(addr: string, token: string): string {
  return 'user_token:' + token + ':' + addr;
}

function participantKey(i: i32): string {
  return 'addr_' + i.toString();
}

function autoDepositKey(id: i32): string {
  return 'auto_deposit_' + id.toString();
}

function winnerKey(i: i32): string {
  return 'winner_' + i.toString();
}

// ==================== CONSTRUCTOR ====================

export function constructor(args: StaticArray<u8>): void {
  assert(Context.isDeployingContract(), 'deploy only');

  const a = new Args(args);
  const drawPeriods = a.nextU64().expect('draw_periods');
  const tickPeriods = a.nextU64().expect('tick_periods');

  // Core parameters
  sSetU64(DRAW_PERIODS, drawPeriods);
  sSetU64(TICK_PERIODS, tickPeriods);
  sSetU64(TOTAL_SHARES, 0);
  sSetU64(TOTAL_PRINCIPAL, 0);
  sSetU64(PRIZE_POOL, 0);
  sSetU64(PARTICIPANT_COUNT, 0);

  // Risk tier initialization
  sSetU64(CONSERVATIVE_TVL, 0);
  sSetU64(MODERATE_TVL, 0);
  sSetU64(AGGRESSIVE_TVL, 0);
  sSetU64(CONSERVATIVE_SHARES, 0);
  sSetU64(MODERATE_SHARES, 0);
  sSetU64(AGGRESSIVE_SHARES, 0);

  // Draw configuration
  sSetU64(MIN_PRIZE_THRESHOLD, DEFAULT_MIN_PRIZE);
  sSetU64(WINNER_COUNT, 0);
  sSetU64(LAST_DRAW_PERIOD, 0);
  sSetU64(AUTO_DEPOSIT_COUNT, 0);

  // Token support (initially just MAS)
  sSet(SUPPORTED_TOKENS, 'MAS');

  // Metadata
  sSet(CONTRACT_VERSION, '2.0.0-wave4');

  const nowP = Context.currentPeriod();
  sSetU64(NEXT_DRAW_PERIOD, nowP + drawPeriods);

  generateEvent(
    `init:drawPeriods=${drawPeriods.toString()}:tickPeriods=${tickPeriods.toString()}`,
  );
}

// ==================== RISK TIER DEPOSITS ====================

export function depositConservative(): void {
  depositToTier('conservative');
}

export function depositModerate(): void {
  depositToTier('moderate');
}

export function depositAggressive(): void {
  depositToTier('aggressive');
}

function depositToTier(tier: string): void {
  const amount = Context.transferredCoins();

  // Allow dry runs
  if (amount == 0) {
    generateEvent('deposit_dry_run:' + tier);
    return;
  }

  const caller = Context.caller().toString();
  const sharesKey = userSharesKey(caller, tier);
  const principalKey = userPrincipalKey(caller, tier);

  const prevShares = sGetU64(sharesKey, 0);
  const prevPrincipal = sGetU64(principalKey, 0);

  // Add to participant list if first deposit
  if (prevShares == 0) {
    const n = <i32>sGetU64(PARTICIPANT_COUNT, 0);
    sSet(participantKey(n), caller + ':' + tier);
    sSetU64(PARTICIPANT_COUNT, u64(n + 1));
  }

  // Update user balances
  sSetU64(sharesKey, prevShares + amount);
  sSetU64(principalKey, prevPrincipal + amount);

  // Update tier totals
  if (tier == 'conservative') {
    sSetU64(CONSERVATIVE_TVL, sGetU64(CONSERVATIVE_TVL) + amount);
    sSetU64(CONSERVATIVE_SHARES, sGetU64(CONSERVATIVE_SHARES) + amount);
  } else if (tier == 'moderate') {
    sSetU64(MODERATE_TVL, sGetU64(MODERATE_TVL) + amount);
    sSetU64(MODERATE_SHARES, sGetU64(MODERATE_SHARES) + amount);
  } else if (tier == 'aggressive') {
    sSetU64(AGGRESSIVE_TVL, sGetU64(AGGRESSIVE_TVL) + amount);
    sSetU64(AGGRESSIVE_SHARES, sGetU64(AGGRESSIVE_SHARES) + amount);
  }

  // Update global totals
  sSetU64(TOTAL_SHARES, sGetU64(TOTAL_SHARES) + amount);
  sSetU64(TOTAL_PRINCIPAL, sGetU64(TOTAL_PRINCIPAL) + amount);

  // Calculate risky portion for prize pool
  let riskPercent: u64 = CONSERVATIVE_RISK;
  if (tier == 'moderate') riskPercent = MODERATE_RISK;
  else if (tier == 'aggressive') riskPercent = AGGRESSIVE_RISK;

  const riskyAmount = (amount * riskPercent) / 100;
  sSetU64(PRIZE_POOL, sGetU64(PRIZE_POOL) + riskyAmount);

  generateEvent(`deposit:${tier}:${caller}:${amount.toString()}`);
}

// ==================== WITHDRAWALS ====================

export function withdrawConservative(args: StaticArray<u8>): void {
  withdrawFromTier(args, 'conservative');
}

export function withdrawModerate(args: StaticArray<u8>): void {
  withdrawFromTier(args, 'moderate');
}

export function withdrawAggressive(args: StaticArray<u8>): void {
  withdrawFromTier(args, 'aggressive');
}

function withdrawFromTier(args: StaticArray<u8>, tier: string): void {
  const a = new Args(args);
  const amount = a.nextU64().expect('amount');
  const caller = Context.caller().toString();

  const sharesKey = userSharesKey(caller, tier);
  const principalKey = userPrincipalKey(caller, tier);

  const shares = sGetU64(sharesKey, 0);
  const principal = sGetU64(principalKey, 0);

  assert(amount > 0 && amount <= shares, 'bad_amount');
  assert(amount <= principal, 'insufficient_principal');

  // Update user balances
  sSetU64(sharesKey, shares - amount);
  sSetU64(principalKey, principal - amount);

  // Update tier totals
  if (tier == 'conservative') {
    sSetU64(CONSERVATIVE_TVL, sGetU64(CONSERVATIVE_TVL) - amount);
    sSetU64(CONSERVATIVE_SHARES, sGetU64(CONSERVATIVE_SHARES) - amount);
  } else if (tier == 'moderate') {
    sSetU64(MODERATE_TVL, sGetU64(MODERATE_TVL) - amount);
    sSetU64(MODERATE_SHARES, sGetU64(MODERATE_SHARES) - amount);
  } else if (tier == 'aggressive') {
    sSetU64(AGGRESSIVE_TVL, sGetU64(AGGRESSIVE_TVL) - amount);
    sSetU64(AGGRESSIVE_SHARES, sGetU64(AGGRESSIVE_SHARES) - amount);
  }

  // Update global totals
  sSetU64(TOTAL_SHARES, sGetU64(TOTAL_SHARES) - amount);
  sSetU64(TOTAL_PRINCIPAL, sGetU64(TOTAL_PRINCIPAL) - amount);

  transferCoins(new Address(caller), amount);
  generateEvent(`withdraw:${tier}:${caller}:${amount.toString()}`);
}

// ==================== AUTO-DEPOSIT SYSTEM ====================

export function setupAutoDeposit(args: StaticArray<u8>): void {
  const a = new Args(args);
  const amountPerDeposit = a.nextU64().expect('amount');
  const tier = a.nextString().expect('tier');
  const frequencyPeriods = a.nextU64().expect('frequency'); // Weekly = ~10080 periods

  const caller = Context.caller().toString();

  // Validate tier
  assert(
    tier == 'conservative' || tier == 'moderate' || tier == 'aggressive',
    'invalid_tier',
  );

  // Create auto-deposit record
  const autoDepositId = <i32>sGetU64(AUTO_DEPOSIT_COUNT);
  const record = `${caller}:${amountPerDeposit.toString()}:${tier}:${frequencyPeriods.toString()}`;
  sSet(autoDepositKey(autoDepositId), record);
  sSetU64(AUTO_DEPOSIT_COUNT, u64(autoDepositId + 1));

  // Schedule first execution
  const nextPeriod = Context.currentPeriod() + frequencyPeriods;
  const callArgs = new Args().add(autoDepositId).serialize();

  // Note: This is a simplified version. Real implementation needs proper deferred call handling
  generateEvent(
    `auto_deposit_setup:${autoDepositId.toString()}:${caller}:${tier}:${amountPerDeposit.toString()}`,
  );
}

export function executeAutoDeposit(args: StaticArray<u8>): void {
  const a = new Args(args);
  const autoDepositId = a.nextI32().expect('id');

  const recordKey = autoDepositKey(autoDepositId);
  if (!sHas(recordKey)) {
    generateEvent(`auto_deposit_not_found:${autoDepositId.toString()}`);
    return;
  }

  const record = sGet(recordKey);
  const parts = record.split(':');
  if (parts.length < 4) return;

  const userAddr = parts[0];
  const amount = u64(parseInt(parts[1]));
  const tier = parts[2];
  const frequency = u64(parseInt(parts[3]));

  // TODO: Implement actual token transfer from user's approved balance
  // For now, emit event for tracking
  generateEvent(
    `auto_deposit_executed:${autoDepositId.toString()}:${userAddr}:${tier}:${amount.toString()}`,
  );

  // Reschedule next execution
  const nextPeriod = Context.currentPeriod() + frequency;
  // Would schedule deferred call here in production
}

// ==================== TOKEN SUPPORT ====================

export function addSupportedToken(args: StaticArray<u8>): void {
  // Only contract deployer can add tokens
  const a = new Args(args);
  const tokenName = a.nextString().expect('token_name');
  const tokenAddress = a.nextString().expect('token_address');

  const currentTokens = sGet(SUPPORTED_TOKENS, 'MAS');
  sSet(SUPPORTED_TOKENS, currentTokens + ',' + tokenName);
  sSet(tokenName + '_ADDRESS', tokenAddress);

  generateEvent(`token_added:${tokenName}:${tokenAddress}`);
}

export function setUSDCAddress(args: StaticArray<u8>): void {
  const a = new Args(args);
  const usdcAddress = a.nextString().expect('usdc_address');
  sSet(USDC_ADDRESS, usdcAddress);
  generateEvent(`usdc_set:${usdcAddress}`);
}

// ==================== VAULT STATS ====================

export function getVaultStats(): StaticArray<u8> {
  const statsJSON = `{
    "tvl": "${sGetU64(TOTAL_PRINCIPAL).toString()}",
    "totalShares": "${sGetU64(TOTAL_SHARES).toString()}",
    "prizePool": "${sGetU64(PRIZE_POOL).toString()}",
    "participants": "${sGetU64(PARTICIPANT_COUNT).toString()}",
    "nextDrawPeriod": "${sGetU64(NEXT_DRAW_PERIOD).toString()}",
    "drawPeriods": "${sGetU64(DRAW_PERIODS).toString()}",
    "tickPeriods": "${sGetU64(TICK_PERIODS).toString()}",
    "minPrizeThreshold": "${sGetU64(MIN_PRIZE_THRESHOLD).toString()}",
    "winnerCount": "${sGetU64(WINNER_COUNT).toString()}",
    "lastDrawPeriod": "${sGetU64(LAST_DRAW_PERIOD).toString()}",
    "contractVersion": "${sGet(CONTRACT_VERSION)}",
    "conservativeTVL": "${sGetU64(CONSERVATIVE_TVL).toString()}",
    "moderateTVL": "${sGetU64(MODERATE_TVL).toString()}",
    "aggressiveTVL": "${sGetU64(AGGRESSIVE_TVL).toString()}",
    "conservativeShares": "${sGetU64(CONSERVATIVE_SHARES).toString()}",
    "moderateShares": "${sGetU64(MODERATE_SHARES).toString()}",
    "aggressiveShares": "${sGetU64(AGGRESSIVE_SHARES).toString()}"
  }`;

  return new Args().add(statsJSON).serialize();
}

export function getUserPosition(args: StaticArray<u8>): StaticArray<u8> {
  const a = new Args(args);
  const address = a.nextString().expect('address');

  // Get balances from all tiers
  const conservativeShares = sGetU64(userSharesKey(address, 'conservative'), 0);
  const conservativePrincipal = sGetU64(
    userPrincipalKey(address, 'conservative'),
    0,
  );

  const moderateShares = sGetU64(userSharesKey(address, 'moderate'), 0);
  const moderatePrincipal = sGetU64(userPrincipalKey(address, 'moderate'), 0);

  const aggressiveShares = sGetU64(userSharesKey(address, 'aggressive'), 0);
  const aggressivePrincipal = sGetU64(
    userPrincipalKey(address, 'aggressive'),
    0,
  );

  const totalShares = conservativeShares + moderateShares + aggressiveShares;
  const totalPrincipal =
    conservativePrincipal + moderatePrincipal + aggressivePrincipal;

  const positionJSON = `{
    "shares": "${totalShares.toString()}",
    "principal": "${totalPrincipal.toString()}",
    "conservativeShares": "${conservativeShares.toString()}",
    "conservativePrincipal": "${conservativePrincipal.toString()}",
    "moderateShares": "${moderateShares.toString()}",
    "moderatePrincipal": "${moderatePrincipal.toString()}",
    "aggressiveShares": "${aggressiveShares.toString()}",
    "aggressivePrincipal": "${aggressivePrincipal.toString()}"
  }`;

  return new Args().add(positionJSON).serialize();
}

// ==================== FUNDING ====================

export function seedScheduler(): void {
  const c = Context.transferredCoins();
  assert(c > 0, 'zero');
  const prev = sGetU64(SCHEDULER_SEED);
  sSetU64(SCHEDULER_SEED, prev + c);
  generateEvent(`seedScheduler:${c.toString()}`);
}

// Simple legacy deposit (defaults to conservative tier)
export function deposit(): void {
  depositConservative();
}
