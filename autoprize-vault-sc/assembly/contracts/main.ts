import { Args } from '@massalabs/as-types';
import {
  Address,
  Context,
  Storage,
  deferredCallRegister,
  generateEvent,
  transferCoins,
} from '@massalabs/massa-as-sdk';

// Core Keys
const PRIZE_POOL = 'prize_pool';
const NEXT_DRAW_PERIOD = 'next_draw_period';
const DRAW_PERIODS = 'draw_periods';
const TICK_PERIODS = 'tick_periods';
const PARTICIPANT_COUNT = 'participant_count';
const SCHEDULER_SEED = 'scheduler_seed';
const MIN_PRIZE_THRESHOLD = 'min_prize_threshold';
const WINNER_COUNT = 'winner_count';
const LAST_DRAW_PERIOD = 'last_draw_period';

// Risk Tier Keys - TVL per tier
const CONSERVATIVE_TVL = 'conservative_tvl';
const MODERATE_TVL = 'moderate_tvl';
const AGGRESSIVE_TVL = 'aggressive_tvl';

// Risk Tier Keys - Total tickets (shares) per tier
const CONSERVATIVE_TICKETS = 'conservative_tickets';
const MODERATE_TICKETS = 'moderate_tickets';
const AGGRESSIVE_TICKETS = 'aggressive_tickets';

// Ticket multipliers
const CONSERVATIVE_MULTIPLIER: u64 = 1; // 1 ticket per MAS
const MODERATE_MULTIPLIER: u64 = 2; // 2 tickets per MAS
const AGGRESSIVE_MULTIPLIER: u64 = 4; // 4 tickets per MAS

// Protection percentages (stored, not used in v1)
const CONSERVATIVE_PROTECTION: u64 = 95; // 95% protected
const MODERATE_PROTECTION: u64 = 90; // 90% protected
const AGGRESSIVE_PROTECTION: u64 = 80; // 80% protected

const DEFAULT_MIN_PRIZE = 100_000_000; // 0.1 MAS

function sHas(k: string): bool {
  return Storage.has(k);
}
function sGetU64(k: string, d: u64 = 0): u64 {
  return sHas(k) ? u64(parseInt(Storage.get(k))) : d;
}
function sSetU64(k: string, v: u64): void {
  Storage.set(k, v.toString());
}

function participantKey(i: i32): string {
  return 'addr_' + i.toString();
}
function winnerKey(i: i32): string {
  return 'winner_' + i.toString();
}

// User tier tracking: which tier did user deposit into?
function userTierKey(addr: string): string {
  return 'user_tier:' + addr;
}

// User principal per tier
function userPrincipalConservativeKey(addr: string): string {
  return 'user_principal_conservative:' + addr;
}
function userPrincipalModerateKey(addr: string): string {
  return 'user_principal_moderate:' + addr;
}
function userPrincipalAggressiveKey(addr: string): string {
  return 'user_principal_aggressive:' + addr;
}

// User tickets per tier
function userTicketsConservativeKey(addr: string): string {
  return 'user_tickets_conservative:' + addr;
}
function userTicketsModerateKey(addr: string): string {
  return 'user_tickets_moderate:' + addr;
}
function userTicketsAggressiveKey(addr: string): string {
  return 'user_tickets_aggressive:' + addr;
}

// Fair RNG using multi-block entropy
function generateFairSeed(): u64 {
  const currentP = Context.currentPeriod();
  let entropy: u64 = 0;
  entropy ^= u64(currentP);
  entropy ^= u64(currentP - 1) << 16;
  entropy ^= u64(currentP - 2) << 32;
  const totalTickets =
    sGetU64(CONSERVATIVE_TICKETS) +
    sGetU64(MODERATE_TICKETS) +
    sGetU64(AGGRESSIVE_TICKETS);
  const prizePool = sGetU64(PRIZE_POOL);
  entropy ^= totalTickets;
  entropy ^= prizePool << 8;
  return entropy;
}

export function constructor(args: StaticArray<u8>): void {
  assert(Context.isDeployingContract());
  const a = new Args(args);
  const drawPeriods = a.nextU64().expect('draw_periods');
  const tickPeriods = a.nextU64().expect('tick_periods');

  sSetU64(DRAW_PERIODS, drawPeriods);
  sSetU64(TICK_PERIODS, tickPeriods);
  sSetU64(PRIZE_POOL, 0);
  sSetU64(MIN_PRIZE_THRESHOLD, DEFAULT_MIN_PRIZE);
  sSetU64(WINNER_COUNT, 0);
  sSetU64(PARTICIPANT_COUNT, 0);

  // Initialize tier tracking
  sSetU64(CONSERVATIVE_TVL, 0);
  sSetU64(MODERATE_TVL, 0);
  sSetU64(AGGRESSIVE_TVL, 0);
  sSetU64(CONSERVATIVE_TICKETS, 0);
  sSetU64(MODERATE_TICKETS, 0);
  sSetU64(AGGRESSIVE_TICKETS, 0);

  const nowP = Context.currentPeriod();
  sSetU64(NEXT_DRAW_PERIOD, nowP + drawPeriods);

  scheduleTick(nowP + tickPeriods);
  generateEvent(
    `init: drawPeriods=${drawPeriods.toString()} tickPeriods=${tickPeriods.toString()}`,
  );
}

function scheduleTick(targetPeriod: u64): void {
  const thr = Context.currentThread();
  const slot = new Context.Slot(targetPeriod, <u8>thr);
  const maxGas: i32 = 2_000_000;

  const id = deferredCallRegister(
    Context.callee().toString(),
    'tick',
    slot,
    maxGas,
    [],
    0,
  );
  generateEvent(`tick_scheduled:${targetPeriod.toString()}:${id}`);
}

const GAS_SAFE_CALL: u64 = 100_000_000;

export function seedScheduler(): void {
  const c = Context.transferredCoins();
  assert(c > 0, 'zero');
  const prev = sGetU64(SCHEDULER_SEED);
  sSetU64(SCHEDULER_SEED, prev + c);
  generateEvent(`seedScheduler:${c.toString()}`);
}

export function addToPrizePool(): void {
  const c = Context.transferredCoins();
  assert(c > 0, 'zero coins');
  const prev = sGetU64(PRIZE_POOL);
  sSetU64(PRIZE_POOL, prev + c);
  generateEvent(`prizePoolFunded:${c.toString()}`);
}

// DEPOSIT FUNCTIONS - Three separate functions for each tier

export function depositConservative(): void {
  const amount = Context.transferredCoins();
  if (amount == 0) {
    generateEvent('deposit_dry_run');
    return;
  }

  const caller = Context.caller().toString();

  // Track if new participant
  const existingPrincipal = sGetU64(userPrincipalConservativeKey(caller), 0);
  if (existingPrincipal == 0) {
    const n = <i32>sGetU64(PARTICIPANT_COUNT, 0);
    Storage.set(participantKey(n), caller);
    sSetU64(PARTICIPANT_COUNT, u64(n + 1));
  }

  // Calculate tickets: 1 ticket per MAS
  const tickets = amount * CONSERVATIVE_MULTIPLIER;

  // Update user data
  const prevPrincipal = sGetU64(userPrincipalConservativeKey(caller), 0);
  const prevTickets = sGetU64(userTicketsConservativeKey(caller), 0);
  sSetU64(userPrincipalConservativeKey(caller), prevPrincipal + amount);
  sSetU64(userTicketsConservativeKey(caller), prevTickets + tickets);
  Storage.set(userTierKey(caller), 'conservative');

  // Update global tier data
  sSetU64(CONSERVATIVE_TVL, sGetU64(CONSERVATIVE_TVL, 0) + amount);
  sSetU64(CONSERVATIVE_TICKETS, sGetU64(CONSERVATIVE_TICKETS, 0) + tickets);

  generateEvent(
    `depositConservative:${caller}:${amount.toString()}:${tickets.toString()}`,
  );
}

export function depositModerate(): void {
  const amount = Context.transferredCoins();
  if (amount == 0) {
    generateEvent('deposit_dry_run');
    return;
  }

  const caller = Context.caller().toString();

  const existingPrincipal = sGetU64(userPrincipalModerateKey(caller), 0);
  if (existingPrincipal == 0) {
    const n = <i32>sGetU64(PARTICIPANT_COUNT, 0);
    Storage.set(participantKey(n), caller);
    sSetU64(PARTICIPANT_COUNT, u64(n + 1));
  }

  // Calculate tickets: 2 tickets per MAS
  const tickets = amount * MODERATE_MULTIPLIER;

  const prevPrincipal = sGetU64(userPrincipalModerateKey(caller), 0);
  const prevTickets = sGetU64(userTicketsModerateKey(caller), 0);
  sSetU64(userPrincipalModerateKey(caller), prevPrincipal + amount);
  sSetU64(userTicketsModerateKey(caller), prevTickets + tickets);
  Storage.set(userTierKey(caller), 'moderate');

  sSetU64(MODERATE_TVL, sGetU64(MODERATE_TVL, 0) + amount);
  sSetU64(MODERATE_TICKETS, sGetU64(MODERATE_TICKETS, 0) + tickets);

  generateEvent(
    `depositModerate:${caller}:${amount.toString()}:${tickets.toString()}`,
  );
}

export function depositAggressive(): void {
  const amount = Context.transferredCoins();
  if (amount == 0) {
    generateEvent('deposit_dry_run');
    return;
  }

  const caller = Context.caller().toString();

  const existingPrincipal = sGetU64(userPrincipalAggressiveKey(caller), 0);
  if (existingPrincipal == 0) {
    const n = <i32>sGetU64(PARTICIPANT_COUNT, 0);
    Storage.set(participantKey(n), caller);
    sSetU64(PARTICIPANT_COUNT, u64(n + 1));
  }

  // Calculate tickets: 4 tickets per MAS
  const tickets = amount * AGGRESSIVE_MULTIPLIER;

  const prevPrincipal = sGetU64(userPrincipalAggressiveKey(caller), 0);
  const prevTickets = sGetU64(userTicketsAggressiveKey(caller), 0);
  sSetU64(userPrincipalAggressiveKey(caller), prevPrincipal + amount);
  sSetU64(userTicketsAggressiveKey(caller), prevTickets + tickets);
  Storage.set(userTierKey(caller), 'aggressive');

  sSetU64(AGGRESSIVE_TVL, sGetU64(AGGRESSIVE_TVL, 0) + amount);
  sSetU64(AGGRESSIVE_TICKETS, sGetU64(AGGRESSIVE_TICKETS, 0) + tickets);

  generateEvent(
    `depositAggressive:${caller}:${amount.toString()}:${tickets.toString()}`,
  );
}

// WITHDRAW - Supports all tiers
export function withdraw(args: StaticArray<u8>): void {
  const a = new Args(args);
  const amount = a.nextU64().expect('amount');
  const caller = Context.caller().toString();

  assert(amount > 0, 'zero_amount');

  // Check which tier user is in
  const tier = Storage.has(userTierKey(caller))
    ? Storage.get(userTierKey(caller))!
    : 'conservative';

  let principalKey = '';
  let ticketsKey = '';
  let tvlKey = '';
  let ticketsKey_global = '';
  let multiplier: u64 = 1;

  if (tier == 'conservative') {
    principalKey = userPrincipalConservativeKey(caller);
    ticketsKey = userTicketsConservativeKey(caller);
    tvlKey = CONSERVATIVE_TVL;
    ticketsKey_global = CONSERVATIVE_TICKETS;
    multiplier = CONSERVATIVE_MULTIPLIER;
  } else if (tier == 'moderate') {
    principalKey = userPrincipalModerateKey(caller);
    ticketsKey = userTicketsModerateKey(caller);
    tvlKey = MODERATE_TVL;
    ticketsKey_global = MODERATE_TICKETS;
    multiplier = MODERATE_MULTIPLIER;
  } else {
    principalKey = userPrincipalAggressiveKey(caller);
    ticketsKey = userTicketsAggressiveKey(caller);
    tvlKey = AGGRESSIVE_TVL;
    ticketsKey_global = AGGRESSIVE_TICKETS;
    multiplier = AGGRESSIVE_MULTIPLIER;
  }

  const principal = sGetU64(principalKey, 0);
  const tickets = sGetU64(ticketsKey, 0);

  assert(amount <= principal, 'insufficient_principal');

  // Calculate tickets to remove
  const ticketsToRemove = amount * multiplier;
  assert(ticketsToRemove <= tickets, 'insufficient_tickets');

  // Update user balances
  sSetU64(principalKey, principal - amount);
  sSetU64(ticketsKey, tickets - ticketsToRemove);

  // Update global totals
  sSetU64(tvlKey, sGetU64(tvlKey, 0) - amount);
  sSetU64(ticketsKey_global, sGetU64(ticketsKey_global, 0) - ticketsToRemove);

  transferCoins(new Address(caller), amount);
  generateEvent(`withdraw:${caller}:${amount.toString()}:${tier}`);
}

// TICK - Autonomous execution
export function tick(): void {
  const nowP = Context.currentPeriod();
  const nextDraw = sGetU64(NEXT_DRAW_PERIOD);
  const tickP = sGetU64(TICK_PERIODS);

  if (nowP >= nextDraw) {
    const drawResult = enhancedRunDraw();
    if (drawResult) {
      const drawP = sGetU64(DRAW_PERIODS);
      sSetU64(NEXT_DRAW_PERIOD, nowP + drawP);
    }
  }

  scheduleTick(nowP + tickP);
  generateEvent(`tick:${nowP.toString()}`);
}

// MANUAL DRAW - For testing
export function manualDraw(): void {
  const drawResult = enhancedRunDraw();
  if (drawResult) {
    const nowP = Context.currentPeriod();
    const drawP = sGetU64(DRAW_PERIODS);
    sSetU64(NEXT_DRAW_PERIOD, nowP + drawP);
  }
}

// ENHANCED DRAW - Ticket-based weighted selection
function enhancedRunDraw(): bool {
  const prize = sGetU64(PRIZE_POOL);
  const conservativeTickets = sGetU64(CONSERVATIVE_TICKETS);
  const moderateTickets = sGetU64(MODERATE_TICKETS);
  const aggressiveTickets = sGetU64(AGGRESSIVE_TICKETS);
  const totalTickets =
    conservativeTickets + moderateTickets + aggressiveTickets;
  const cnt = i32(sGetU64(PARTICIPANT_COUNT));
  const minThreshold = sGetU64(MIN_PRIZE_THRESHOLD);
  const nowP = Context.currentPeriod();

  if (prize < minThreshold) {
    generateEvent(`draw_skipped:insufficient_prize:${prize.toString()}`);
    return false;
  }

  if (totalTickets == 0 || cnt == 0) {
    generateEvent(`draw_skipped:no_participants`);
    return false;
  }

  // Generate fair seed and select winning ticket
  const seed = generateFairSeed();
  const target = seed % totalTickets;

  generateEvent(
    `draw_entropy:${seed.toString()}:target=${target.toString()}:total=${totalTickets.toString()}`,
  );

  // Find winner by iterating through participants and their tickets
  let cumul: u64 = 0;
  let winner = '';

  for (let i = 0; i < cnt; i++) {
    const addr = Storage.get(participantKey(i))!;

    // Get user's total tickets across all tiers
    const userConservative = sGetU64(userTicketsConservativeKey(addr), 0);
    const userModerate = sGetU64(userTicketsModerateKey(addr), 0);
    const userAggressive = sGetU64(userTicketsAggressiveKey(addr), 0);
    const userTotalTickets = userConservative + userModerate + userAggressive;

    cumul += userTotalTickets;
    if (cumul > target) {
      winner = addr;
      break;
    }
  }

  if (winner.length == 0) {
    generateEvent(`draw_failed:no_winner_selected`);
    return false;
  }

  // Record winner
  const winnerCount = sGetU64(WINNER_COUNT);
  const winnerData = `${nowP.toString()}:${winner}:${prize.toString()}:${seed.toString()}`;
  Storage.set(winnerKey(i32(winnerCount)), winnerData);
  sSetU64(WINNER_COUNT, winnerCount + 1);
  sSetU64(LAST_DRAW_PERIOD, nowP);

  // Transfer full prize pool to winner
  transferCoins(new Address(winner), prize);
  sSetU64(PRIZE_POOL, 0);

  generateEvent(
    `draw:${nowP.toString()}:${winner}:${prize.toString()}:${seed.toString()}`,
  );
  return true;
}

// GETTER FUNCTIONS

export function getTVL(): StaticArray<u8> {
  const total =
    sGetU64(CONSERVATIVE_TVL) + sGetU64(MODERATE_TVL) + sGetU64(AGGRESSIVE_TVL);
  return new Args().add(total).serialize();
}

export function getConservativeTVL(): StaticArray<u8> {
  return new Args().add(sGetU64(CONSERVATIVE_TVL)).serialize();
}

export function getModerateTVL(): StaticArray<u8> {
  return new Args().add(sGetU64(MODERATE_TVL)).serialize();
}

export function getAggressiveTVL(): StaticArray<u8> {
  return new Args().add(sGetU64(AGGRESSIVE_TVL)).serialize();
}

export function getTotalTickets(): StaticArray<u8> {
  const total =
    sGetU64(CONSERVATIVE_TICKETS) +
    sGetU64(MODERATE_TICKETS) +
    sGetU64(AGGRESSIVE_TICKETS);
  return new Args().add(total).serialize();
}

export function getConservativeTickets(): StaticArray<u8> {
  return new Args().add(sGetU64(CONSERVATIVE_TICKETS)).serialize();
}

export function getModerateTickets(): StaticArray<u8> {
  return new Args().add(sGetU64(MODERATE_TICKETS)).serialize();
}

export function getAggressiveTickets(): StaticArray<u8> {
  return new Args().add(sGetU64(AGGRESSIVE_TICKETS)).serialize();
}

export function getPrizePool(): StaticArray<u8> {
  return new Args().add(sGetU64(PRIZE_POOL)).serialize();
}

export function getParticipantCount(): StaticArray<u8> {
  return new Args().add(sGetU64(PARTICIPANT_COUNT)).serialize();
}

export function getNextDrawPeriod(): StaticArray<u8> {
  return new Args().add(sGetU64(NEXT_DRAW_PERIOD)).serialize();
}

export function getUserPrincipal(args: StaticArray<u8>): StaticArray<u8> {
  const a = new Args(args);
  const addr = a.nextString().expect('address');
  const conservative = sGetU64(userPrincipalConservativeKey(addr), 0);
  const moderate = sGetU64(userPrincipalModerateKey(addr), 0);
  const aggressive = sGetU64(userPrincipalAggressiveKey(addr), 0);
  const total = conservative + moderate + aggressive;
  return new Args().add(total).serialize();
}

export function getUserTickets(args: StaticArray<u8>): StaticArray<u8> {
  const a = new Args(args);
  const addr = a.nextString().expect('address');
  const conservative = sGetU64(userTicketsConservativeKey(addr), 0);
  const moderate = sGetU64(userTicketsModerateKey(addr), 0);
  const aggressive = sGetU64(userTicketsAggressiveKey(addr), 0);
  const total = conservative + moderate + aggressive;
  return new Args().add(total).serialize();
}

export function getUserTier(args: StaticArray<u8>): StaticArray<u8> {
  const a = new Args(args);
  const addr = a.nextString().expect('address');
  const tier = Storage.has(userTierKey(addr))
    ? Storage.get(userTierKey(addr))!
    : 'none';
  return new Args().add(tier).serialize();
}

export function getWinnerCount(): StaticArray<u8> {
  return new Args().add(sGetU64(WINNER_COUNT)).serialize();
}

export function getWinner(args: StaticArray<u8>): StaticArray<u8> {
  const a = new Args(args);
  const idx = a.nextU64().expect('index');
  const data = Storage.has(winnerKey(i32(idx)))
    ? Storage.get(winnerKey(i32(idx)))!
    : '';
  return new Args().add(data).serialize();
}

// Frontend compatibility function - returns JSON
export function getVaultStats(): StaticArray<u8> {
  const tvl =
    sGetU64(CONSERVATIVE_TVL) + sGetU64(MODERATE_TVL) + sGetU64(AGGRESSIVE_TVL);
  const tickets =
    sGetU64(CONSERVATIVE_TICKETS) +
    sGetU64(MODERATE_TICKETS) +
    sGetU64(AGGRESSIVE_TICKETS);
  const prize = sGetU64(PRIZE_POOL);
  const participants = sGetU64(PARTICIPANT_COUNT);
  const nextDraw = sGetU64(NEXT_DRAW_PERIOD);
  const lastDraw = sGetU64(LAST_DRAW_PERIOD);
  const winnerCount = sGetU64(WINNER_COUNT);

  const json = `{
    "tvl":${tvl.toString()},
    "totalShares":${tickets.toString()},
    "prizePool":${prize.toString()},
    "participants":${participants.toString()},
    "nextDrawPeriod":${nextDraw.toString()},
    "lastDrawPeriod":${lastDraw.toString()},
    "winnerCount":${winnerCount.toString()},
    "drawPeriods":"5400",
    "tickPeriods":"225",
    "minPrizeThreshold":"100000000",
    "contractVersion":"2.0-tiers",
    "proposalCount":"0",
    "conservativeTVL":${sGetU64(CONSERVATIVE_TVL).toString()},
    "moderateTVL":${sGetU64(MODERATE_TVL).toString()},
    "aggressiveTVL":${sGetU64(AGGRESSIVE_TVL).toString()},
    "conservativeTickets":${sGetU64(CONSERVATIVE_TICKETS).toString()},
    "moderateTickets":${sGetU64(MODERATE_TICKETS).toString()},
    "aggressiveTickets":${sGetU64(AGGRESSIVE_TICKETS).toString()}
  }`;

  return stringToBytes(json);
}

export function getUserPosition(args: StaticArray<u8>): StaticArray<u8> {
  const argsObj = new Args(args);
  const userAddr = argsObj.nextString().unwrap();

  // Get user's tier
  const tierKey = userTierKey(userAddr);
  const hasTier = Storage.has(tierKey);
  let tier = '0';
  let principal: u64 = 0;
  let tickets: u64 = 0;

  if (hasTier) {
    tier = Storage.get(tierKey);

    // Get principal and tickets based on tier
    if (tier == 'conservative') {
      principal = sGetU64(userPrincipalConservativeKey(userAddr), 0);
      tickets = sGetU64(userTicketsConservativeKey(userAddr), 0);
    } else if (tier == 'moderate') {
      principal = sGetU64(userPrincipalModerateKey(userAddr), 0);
      tickets = sGetU64(userTicketsModerateKey(userAddr), 0);
    } else if (tier == 'aggressive') {
      principal = sGetU64(userPrincipalAggressiveKey(userAddr), 0);
      tickets = sGetU64(userTicketsAggressiveKey(userAddr), 0);
    }
  }

  const json = `{
    "shares":${tickets.toString()},
    "principal":${principal.toString()},
    "tier":"${tier}",
    "hasDeposit":${principal > 0 ? 'true' : 'false'}
  }`;

  return stringToBytes(json);
}

export function getWinners(args: StaticArray<u8>): StaticArray<u8> {
  const argsObj = new Args(args);
  const startIdx = argsObj.nextU64().unwrap();
  const count = argsObj.nextU64().unwrap();

  const totalWinners = sGetU64(WINNER_COUNT, 0);
  const endIdx =
    startIdx + count > totalWinners ? totalWinners : startIdx + count;

  let winners: string[] = [];

  for (let i = startIdx; i < endIdx; i++) {
    const winnerData = Storage.get(winnerKey(i32(i)));

    if (winnerData.length > 0) {
      // Parse "period:address:prize:seed"
      const parts = winnerData.split(':');
      if (parts.length >= 4) {
        const period = parts[0];
        const address = parts[1];
        const prize = parts[2];
        const seed = parts[3];

        const winnerJson = `{
          "period":"${period}",
          "address":"${address}",
          "prize":"${prize}",
          "seed":"${seed}",
          "timestamp":${period}
        }`;

        winners.push(winnerJson);
      }
    }
  }

  const json = '[' + winners.join(',') + ']';
  return stringToBytes(json);
}

function stringToBytes(s: string): StaticArray<u8> {
  const encoder = String.UTF8.encode(s);
  const arr = new StaticArray<u8>(encoder.byteLength);
  memory.copy(
    changetype<usize>(arr),
    changetype<usize>(encoder),
    encoder.byteLength,
  );
  return arr;
}

function bytesToStringHelper(bytes: StaticArray<u8>): string {
  let result = '';
  for (let i = 0; i < bytes.length; i++) {
    result += String.fromCharCode(bytes[i]);
  }
  return result;
}
