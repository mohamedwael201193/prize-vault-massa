// src/lib/gas.ts
// Base instance creation is ~2,100,000 on BuildNet; give headroom.
export const GAS_SAFE_CALL = 3_500_000n;     // general SC calls (deposit, withdraw)
export const GAS_SAFE_FIRST_CALL = 5_000_000n; // if you expect cold start/first-ever call
