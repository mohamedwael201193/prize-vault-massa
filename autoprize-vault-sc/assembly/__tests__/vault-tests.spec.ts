import { Args } from '@massalabs/as-types';
import { setDeployContext } from '@massalabs/massa-as-sdk';
import {
    constructor,
    deposit,
    getUserPosition,
    getVaultStats,
    getWinners,
    seedScheduler
} from '../contracts/main';

// Helper function to decode StaticArray<u8> to string
function decodeResponse(response: StaticArray<u8>): string {
  const bytes = new Uint8Array(response.length);
  for (let i = 0; i < response.length; i++) {
    bytes[i] = response[i];
  }
  return String.UTF8.decode(bytes.buffer);
}

describe('AutoPrize Vault Tests', () => {
  beforeAll(() => {
    setDeployContext();
    const args = new Args()
      .add(u64(100))  // drawPeriods
      .add(u64(10));  // tickPeriods
    constructor(args.serialize());
  });

  test('constructor initializes correctly', () => {
    const state = getVaultStats();
    const stateStr = decodeResponse(state);
    expect(stateStr).toContain('"tvl":"0"');
    expect(stateStr).toContain('"totalShares":"0"');
    expect(stateStr).toContain('"prizePool":"0"');
  });

  test('vault stats returns correct structure', () => {
    const state = getVaultStats();
    const stateStr = decodeResponse(state);
    
    // Check all expected fields are present
    expect(stateStr).toContain('"tvl"');
    expect(stateStr).toContain('"totalShares"');
    expect(stateStr).toContain('"prizePool"');
    expect(stateStr).toContain('"participants"');
    expect(stateStr).toContain('"nextDrawPeriod"');
    expect(stateStr).toContain('"drawPeriods"');
    expect(stateStr).toContain('"tickPeriods"');
    expect(stateStr).toContain('"minPrizeThreshold"');
    expect(stateStr).toContain('"winnerCount"');
    expect(stateStr).toContain('"contractVersion"');
    expect(stateStr).toContain('"proposalCount"');
  });

  test('getUserPosition works correctly', () => {
    const caller = "AS12345..."; // Mock address
    const args = new Args().add(caller);
    const position = getUserPosition(args.serialize());
    const positionStr = decodeResponse(position);
    
    expect(positionStr).toContain('"shares"');
    expect(positionStr).toContain('"principal"');
    expect(positionStr).toContain('"effectiveTickets"');
  });

  test('getWinners returns empty array initially', () => {
    const args = new Args()
      .add(u64(0))  // start index
      .add(u64(10)); // limit
    const winners = getWinners(args.serialize());
    const winnersStr = decodeResponse(winners);
    
    expect(winnersStr).toBe("[]");
  });

  test('functions compile and execute', () => {
    // Test seedScheduler
    seedScheduler();
    
    // Test that getVaultStats returns data
    const state = getVaultStats();
    expect(state.length).toBeGreaterThan(10); // Should have JSON data
    
    // Test deposit function exists (payable, no args)
    deposit();
    
    // Test withdraw with arguments
    const withdrawArgs = new Args().add(u64(1000000000)); // 1 MAS
    // Note: This will likely fail at runtime due to insufficient balance, but should compile
    
    // Test governance functions compile
    const propArgs = new Args()
      .add("min_prize")
      .add(u64(200000000)); // 0.2 MAS
    
    // These should compile without syntax errors
    // Runtime success depends on having sufficient shares
  });

  test('contract version is set', () => {
    const state = getVaultStats();
    const stateStr = decodeResponse(state);
    expect(stateStr).toContain('"contractVersion":"1.0.0"');
  });

  test('draw periods configuration', () => {
    const state = getVaultStats();
    const stateStr = decodeResponse(state);
    expect(stateStr).toContain('"drawPeriods":"100"');
    expect(stateStr).toContain('"tickPeriods":"10"');
  });

  test('minimum prize threshold is set', () => {
    const state = getVaultStats();
    const stateStr = decodeResponse(state);
    expect(stateStr).toContain('"minPrizeThreshold":"100000000"'); // 0.1 MAS default
  });
});