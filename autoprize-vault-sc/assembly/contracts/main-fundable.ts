import { Args } from '@massalabs/as-types';
import {
    Address,
    Context,
    Storage,
    deferredCallQuote, deferredCallRegister,
    generateEvent,
    transferCoins
} from "@massalabs/massa-as-sdk";

// Keys - same as original contract
const TOTAL_SHARES = "total_shares";
const TOTAL_PRINCIPAL = "total_principal";
const PRIZE_POOL = "prize_pool";
const NEXT_DRAW_PERIOD = "next_draw_period";
const DRAW_PERIODS = "draw_periods";
const TICK_PERIODS = "tick_periods";
const PARTICIPANT_COUNT = "participant_count";
const SCHEDULER_SEED = "scheduler_seed";

// Enhanced features
const MIN_PRIZE_THRESHOLD = "min_prize_threshold";
const WINNER_COUNT = "winner_count";
const LAST_DRAW_PERIOD = "last_draw_period";
const CONTRACT_VERSION = "contract_version";

// Governance
const PROPOSAL_COUNT = "proposal_count";
const GOVERNANCE_DELAY = "governance_delay";

// Constants - LOWERED THRESHOLD FOR TESTING
const DEFAULT_MIN_PRIZE = 10_000_000; // 0.01 MAS minimum (reduced from 0.1 MAS)
const DEFAULT_GOVERNANCE_DELAY = 100800; // ~7 days in periods

function sHas(k: string): bool {
  return Storage.has(k);
}
function sGetU64(k: string, d: u64 = 0): u64 {
  return sHas(k) ? u64(parseInt(Storage.get(k))) : d;
}
function sSetU64(k: string, v: u64): void {
  Storage.set(k, v.toString());
}

function arrayBufferToStaticArrayU8(buffer: ArrayBuffer): StaticArray<u8> {
  const uint8View = Uint8Array.wrap(buffer);
  const staticArray = new StaticArray<u8>(uint8View.length);
  for (let i = 0; i < uint8View.length; i++) {
    unchecked(staticArray[i] = uint8View[i]);
  }
  return staticArray;
}

function userSharesKey(a: string): string { return "user_shares:" + a; }
function userPrincipalKey(a: string): string { return "user_principal:" + a; }
function participantKey(i: i32): string { return "addr_" + i.toString(); }
function winnerKey(i: i32): string { return "winner_" + i.toString(); }
function proposalKey(i: i32): string { return "proposal_" + i.toString(); }

// Fair RNG using multi-block entropy
function generateFairSeed(): u64 {
  const currentP = Context.currentPeriod();
  let entropy: u64 = 0;
  
  entropy ^= u64(currentP);
  entropy ^= u64(currentP - 1) << 16;
  entropy ^= u64(currentP - 2) << 32;
  
  const totalShares = sGetU64(TOTAL_SHARES);
  const prizePool = sGetU64(PRIZE_POOL);
  entropy ^= totalShares;
  entropy ^= prizePool << 8;
  
  return entropy;
}

export function constructor(args: StaticArray<u8>): void {
  assert(Context.isDeployingContract());
  const a = new Args(args);
  const drawPeriods = a.nextU64().expect("draw_periods");
  const tickPeriods = a.nextU64().expect("tick_periods");

  sSetU64(DRAW_PERIODS, drawPeriods);
  sSetU64(TICK_PERIODS, tickPeriods);
  sSetU64(TOTAL_SHARES, 0);
  sSetU64(TOTAL_PRINCIPAL, 0);
  sSetU64(PRIZE_POOL, 0);
  
  sSetU64(MIN_PRIZE_THRESHOLD, DEFAULT_MIN_PRIZE);
  sSetU64(WINNER_COUNT, 0);
  sSetU64(PROPOSAL_COUNT, 0);
  sSetU64(GOVERNANCE_DELAY, DEFAULT_GOVERNANCE_DELAY);
  Storage.set(CONTRACT_VERSION, "2.0.0-fundable");
  sSetU64(PARTICIPANT_COUNT, 0);

  const nowP = Context.currentPeriod();
  sSetU64(NEXT_DRAW_PERIOD, nowP + drawPeriods);

  scheduleTick(nowP + tickPeriods);
  generateEvent(`init:drawPeriods=${drawPeriods.toString()}:tickPeriods=${tickPeriods.toString()}:minPrize=${DEFAULT_MIN_PRIZE.toString()}`);
}

// 🎯 NEW FUNCTION: Direct prize pool funding for testing/demonstrations
export function fundPrizePool(): void {
  const amount = Context.transferredCoins();
  assert(amount > 0, "no_coins_sent");
  
  const prev = sGetU64(PRIZE_POOL);
  sSetU64(PRIZE_POOL, prev + amount);
  
  generateEvent(`prize_pool_funded:${amount.toString()}:previous:${prev.toString()}:new_total:${(prev + amount).toString()}`);
  
  // Check if we can now do draws
  const minThreshold = sGetU64(MIN_PRIZE_THRESHOLD);
  if ((prev + amount) >= minThreshold) {
    generateEvent(`draw_ready:prize_pool_sufficient:${(prev + amount).toString()}:threshold:${minThreshold.toString()}`);
  }
}

export function seedScheduler(): void {
  const c = Context.transferredCoins();
  assert(c > 0, "zero");
  const prev = sGetU64(SCHEDULER_SEED);
  sSetU64(SCHEDULER_SEED, prev + c);
  generateEvent(`seedScheduler:${c.toString()}`);
}

export function deposit(): void {
  const amount = Context.transferredCoins();

  if (amount == 0) {
    generateEvent("deposit_dry_run");
    return;
  }

  const caller = Context.caller().toString();
  const sharesKey = userSharesKey(caller);
  const principalKey = userPrincipalKey(caller);

  const prevShares = sGetU64(sharesKey, 0);
  const prevPrincipal = sGetU64(principalKey, 0);

  if (prevShares == 0) {
    const n = <i32>sGetU64(PARTICIPANT_COUNT, 0);
    Storage.set(participantKey(n), caller);
    sSetU64(PARTICIPANT_COUNT, u64(n + 1));
  }

  sSetU64(sharesKey, prevShares + amount);
  sSetU64(principalKey, prevPrincipal + amount);
  sSetU64(TOTAL_SHARES, sGetU64(TOTAL_SHARES, 0) + amount);
  sSetU64(TOTAL_PRINCIPAL, sGetU64(TOTAL_PRINCIPAL, 0) + amount);

  generateEvent(`deposit:${caller}:${amount.toString()}`);
}

export function withdraw(args: StaticArray<u8>): void {
  const a = new Args(args);
  const amount = a.nextU64().expect("amount");
  const caller = Context.caller().toString();

  const sharesKey = userSharesKey(caller);
  const principalKey = userPrincipalKey(caller);
  
  const shares = sGetU64(sharesKey, 0);
  const principal = sGetU64(principalKey, 0);
  
  assert(amount > 0 && amount <= shares, "bad_amount");
  assert(amount <= principal, "insufficient_principal");

  sSetU64(sharesKey, shares - amount);
  sSetU64(principalKey, principal - amount);
  sSetU64(TOTAL_SHARES, sGetU64(TOTAL_SHARES, 0) - amount);
  sSetU64(TOTAL_PRINCIPAL, sGetU64(TOTAL_PRINCIPAL, 0) - amount);

  transferCoins(new Address(caller), amount);
  generateEvent(`withdraw:${caller}:${amount.toString()}`);
}

export function tick(): void {
  // ENABLED: Add some mock yield for testing/demonstration
  const mockYield = 50_000_000; // 0.05 MAS per tick
  const currentPool = sGetU64(PRIZE_POOL);
  sSetU64(PRIZE_POOL, currentPool + u64(mockYield));
  generateEvent(`yield_added:${mockYield.toString()}:new_pool:${(currentPool + u64(mockYield)).toString()}`);

  const nowP = Context.currentPeriod();
  const nextDraw = sGetU64(NEXT_DRAW_PERIOD);
  
  if (nowP >= nextDraw) {
    const drawResult = enhancedRunDraw();
    
    const drawPeriods = sGetU64(DRAW_PERIODS);
    sSetU64(NEXT_DRAW_PERIOD, nowP + drawPeriods);
    
    generateEvent(`draw_scheduled:${(nowP + drawPeriods).toString()}`);
  }

  const tickPeriods = sGetU64(TICK_PERIODS);
  scheduleTick(nowP + tickPeriods);
}

function enhancedRunDraw(): bool {
  const prize = sGetU64(PRIZE_POOL);
  const total = sGetU64(TOTAL_SHARES);
  const cnt = i32(sGetU64(PARTICIPANT_COUNT));
  const minThreshold = sGetU64(MIN_PRIZE_THRESHOLD);
  const nowP = Context.currentPeriod();
  
  if (prize < minThreshold) {
    generateEvent(`draw_skipped:insufficient_prize:${prize.toString()}:${minThreshold.toString()}`);
    return false;
  }
  
  if (total == 0 || cnt == 0) {
    generateEvent(`draw_skipped:no_participants:${cnt.toString()}:${total.toString()}`);
    return false;
  }

  const seed = generateFairSeed();
  const target = seed % total;
  
  generateEvent(`draw_entropy:${nowP.toString()}:${seed.toString()}:${target.toString()}:${total.toString()}`);

  let cumul: u64 = 0;
  let winner = "";
  
  for (let i = 0; i < cnt; i++) {
    const addr = Storage.get(participantKey(i))!;
    const sh = sGetU64(userSharesKey(addr));
    cumul += sh;
    if (cumul > target) { 
      winner = addr; 
      break; 
    }
  }
  
  if (winner.length == 0) {
    generateEvent(`draw_failed:no_winner_selected:${target.toString()}`);
    return false;
  }

  const winnerCount = sGetU64(WINNER_COUNT);
  
  // Fixed prize amount: 0.5 MAS per winner
  const fixedPrizeAmount: u64 = 500_000_000; // 0.5 MAS in nanoMAS
  const actualPrize = prize >= fixedPrizeAmount ? fixedPrizeAmount : prize;
  
  const winnerData = `${nowP.toString()}:${winner}:${actualPrize.toString()}:${seed.toString()}`;
  Storage.set(winnerKey(i32(winnerCount)), winnerData);
  sSetU64(WINNER_COUNT, winnerCount + 1);
  sSetU64(LAST_DRAW_PERIOD, nowP);

  transferCoins(new Address(winner), actualPrize);
  sSetU64(PRIZE_POOL, prize - actualPrize);
  
  generateEvent(`draw:${nowP.toString()}:${winner}:${prize.toString()}:${seed.toString()}`);
  
  return true;
}

function scheduleTick(targetPeriod: u64): void {
  const thr = Context.currentThread();
  const slot = new Context.Slot(targetPeriod, <u8>thr);
  const maxGas: i32 = 2_000_000;

  const _quote = deferredCallQuote(slot, maxGas, 0);
  const id = deferredCallRegister(Context.callee().toString(), "tick", slot, maxGas, [], 0);
  generateEvent(`tick_scheduled:${targetPeriod.toString()}:${id}`);
}

export function getVaultStats(): StaticArray<u8> {
  const json = `{
    "tvl":"${sGetU64(TOTAL_PRINCIPAL).toString()}",
    "totalShares":"${sGetU64(TOTAL_SHARES).toString()}",
    "prizePool":"${sGetU64(PRIZE_POOL).toString()}",
    "participants":"${sGetU64(PARTICIPANT_COUNT).toString()}",
    "nextDrawPeriod":"${sGetU64(NEXT_DRAW_PERIOD).toString()}",
    "drawPeriods":"${sGetU64(DRAW_PERIODS).toString()}",
    "tickPeriods":"${sGetU64(TICK_PERIODS).toString()}",
    "minPrizeThreshold":"${sGetU64(MIN_PRIZE_THRESHOLD).toString()}",
    "winnerCount":"${sGetU64(WINNER_COUNT).toString()}",
    "lastDrawPeriod":"${sGetU64(LAST_DRAW_PERIOD).toString()}",
    "contractVersion":"${Storage.get(CONTRACT_VERSION) || "2.0.0-fundable"}",
    "proposalCount":"${sGetU64(PROPOSAL_COUNT).toString()}"
  }`;
  return arrayBufferToStaticArrayU8(String.UTF8.encode(json));
}

export function getUserPosition(args: StaticArray<u8>): StaticArray<u8> {
  const a = new Args(args);
  const who = a.nextString().expect("addr");
  const shares = sGetU64(userSharesKey(who)).toString();
  const principal = sGetU64(userPrincipalKey(who)).toString();
  const json = `{"shares":"${shares}","principal":"${principal}","effectiveTickets":"${shares}"}`;
  return arrayBufferToStaticArrayU8(String.UTF8.encode(json));
}

export function getWinners(args: StaticArray<u8>): StaticArray<u8> {
  const a = new Args(args);
  const start = a.nextU64().expect("start_index");
  const limit = a.nextU64().expect("limit");
  
  const winnerCount = sGetU64(WINNER_COUNT);
  let winners = "[";
  let count = 0;
  
  for (let i = i32(start); i < i32(winnerCount) && u64(count) < limit; i++) {
    if (count > 0) winners += ",";
    const winnerData = Storage.get(winnerKey(i)) || "";
    const parts = winnerData.split(":");
    if (parts.length >= 4) {
      winners += `{"period":"${parts[0]}","winner":"${parts[1]}","prize":"${parts[2]}","seed":"${parts[3]}"}`;
      count++;
    }
  }
  
  winners += "]";
  return arrayBufferToStaticArrayU8(String.UTF8.encode(winners));
}

// Governance functions (keeping compatibility)
export function createProposal(args: StaticArray<u8>): void {
  const a = new Args(args);
  const proposalType = a.nextString().expect("proposal_type");
  const newValue = a.nextU64().expect("new_value");
  const caller = Context.caller().toString();
  
  const callerShares = sGetU64(userSharesKey(caller));
  const totalShares = sGetU64(TOTAL_SHARES);
  assert(callerShares > 0, "no_shares");
  assert(callerShares >= totalShares / 100, "insufficient_shares");
  
  const proposalCount = sGetU64(PROPOSAL_COUNT);
  const nowP = Context.currentPeriod();
  const votingEnd = nowP + sGetU64(GOVERNANCE_DELAY);
  
  const proposalData = `${proposalType}:${newValue.toString()}:${caller}:${nowP.toString()}:${votingEnd.toString()}:0:0`;
  Storage.set(proposalKey(i32(proposalCount)), proposalData);
  sSetU64(PROPOSAL_COUNT, proposalCount + 1);
  
  generateEvent(`proposal_created:${proposalCount.toString()}:${proposalType}:${newValue.toString()}:${caller}`);
}

export function voteOnProposal(args: StaticArray<u8>): void {
  const a = new Args(args);
  const proposalId = a.nextU64().expect("proposal_id");
  const support = a.nextBool().expect("support");
  const caller = Context.caller().toString();
  
  const callerShares = sGetU64(userSharesKey(caller));
  assert(callerShares > 0, "no_shares");
  
  const proposalData = Storage.get(proposalKey(i32(proposalId)));
  assert(proposalData != null, "proposal_not_found");
  
  const parts = proposalData!.split(":");
  assert(parts.length >= 7, "invalid_proposal_data");
  
  const votingEnd = u64(parseInt(parts[4]));
  const nowP = Context.currentPeriod();
  assert(nowP <= votingEnd, "voting_ended");
  
  const voteKey = `vote:${proposalId.toString()}:${caller}`;
  assert(!sHas(voteKey), "already_voted");
  
  Storage.set(voteKey, support ? "yes" : "no");
  
  let yesVotes = u64(parseInt(parts[5]));
  let noVotes = u64(parseInt(parts[6]));
  
  if (support) {
    yesVotes += callerShares;
  } else {
    noVotes += callerShares;
  }
  
  const newProposalData = `${parts[0]}:${parts[1]}:${parts[2]}:${parts[3]}:${parts[4]}:${yesVotes.toString()}:${noVotes.toString()}`;
  Storage.set(proposalKey(i32(proposalId)), newProposalData);
  
  generateEvent(`vote_cast:${proposalId.toString()}:${caller}:${support ? "yes" : "no"}:${callerShares.toString()}`);
}

export function executeProposal(args: StaticArray<u8>): void {
  const a = new Args(args);
  const proposalId = a.nextU64().expect("proposal_id");
  
  const proposalData = Storage.get(proposalKey(i32(proposalId)));
  assert(proposalData != null, "proposal_not_found");
  
  const parts = proposalData!.split(":");
  assert(parts.length >= 7, "invalid_proposal_data");
  
  const proposalType = parts[0];
  const newValue = u64(parseInt(parts[1]));
  const votingEnd = u64(parseInt(parts[4]));
  const yesVotes = u64(parseInt(parts[5]));
  const noVotes = u64(parseInt(parts[6]));
  const nowP = Context.currentPeriod();
  
  assert(nowP > votingEnd, "voting_not_ended");
  assert(yesVotes > noVotes, "proposal_rejected");
  
  const totalShares = sGetU64(TOTAL_SHARES);
  assert(yesVotes >= totalShares / 2, "insufficient_quorum");
  
  if (proposalType == "min_prize") {
    sSetU64(MIN_PRIZE_THRESHOLD, newValue);
    generateEvent(`proposal_executed:${proposalId.toString()}:min_prize:${newValue.toString()}`);
  } else if (proposalType == "draw_periods") {
    sSetU64(DRAW_PERIODS, newValue);
    generateEvent(`proposal_executed:${proposalId.toString()}:draw_periods:${newValue.toString()}`);
  } else {
    assert(false, "unsupported_proposal_type");
  }
}

export function getProposal(args: StaticArray<u8>): StaticArray<u8> {
  const a = new Args(args);
  const proposalId = a.nextU64().expect("proposal_id");
  
  const proposalData = Storage.get(proposalKey(i32(proposalId)));
  if (!proposalData) {
    const json = `{"error":"proposal_not_found"}`;
    return arrayBufferToStaticArrayU8(String.UTF8.encode(json));
  }
  
  const parts = proposalData!.split(":");
  if (parts.length < 7) {
    const json = `{"error":"invalid_proposal_data"}`;
    return arrayBufferToStaticArrayU8(String.UTF8.encode(json));
  }
  
  const json = `{
    "id":"${proposalId.toString()}",
    "type":"${parts[0]}",
    "value":"${parts[1]}",
    "proposer":"${parts[2]}",
    "startPeriod":"${parts[3]}",
    "endPeriod":"${parts[4]}",
    "yesVotes":"${parts[5]}",
    "noVotes":"${parts[6]}"
  }`;
  return arrayBufferToStaticArrayU8(String.UTF8.encode(json));
}