# Withdraw Balance Error Fix

## Problem

Users were getting the error:

```
Withdrawal failed: Error: Final execution failed (error) | {"massa_execution_error":"Runtime error: runtime error when executing operation O1NWA6JTQqQGfSfZE58MioH5pATameohBWKCcrhjC75vb388vB8: VM Error in CallSC context: Depth error: Runtime error: Runtime error: failed to transfer 5 coins from spending address AS1teRCXPRMB3hd4H8EQzni4A2rjMQFHLKpPXexJxcpvXut6Ng2r due to insufficient balance 4.8278"}.
```

## Root Cause

The user was trying to withdraw 5 MAS from their vault balance, but their **wallet** only had 4.8278 MAS. The smart contract successfully deducted 5 MAS from the vault but when it tried to transfer to the wallet, the wallet didn't have enough balance to cover the transaction fee (~0.01 MAS).

**Key Issue**: Vault balance ≠ Wallet balance

- Vault balance: Amount deposited in the smart contract (5+ MAS available)
- Wallet balance: MAS in the user's actual wallet (4.8278 MAS)
- Transaction needs wallet balance > withdrawal amount + fee

## Solution Implemented

### 1. Added Wallet Balance Validation

```typescript
// Get actual wallet balance from useWallet hook
const { balance } = useWallet();
const walletBalanceMas = balance ? Number(balance) / 1_000_000_000 : 0;

// Pre-validate wallet can cover transaction fee
const feeRequired = 0.01; // Transaction fee in MAS
if (walletBalanceMas < feeRequired) {
  throw new Error(
    `Insufficient wallet balance for transaction fee. Need at least ${feeRequired} MAS in wallet, but have ${walletBalanceMas.toFixed(
      4
    )} MAS.`
  );
}
```

### 2. Enhanced UI Validation

- Button disabled when `walletBalanceMas < 0.01`
- Clear error messages for different scenarios:
  - "Insufficient Wallet Balance for Fees"
  - "Exceeds Vault Balance"
  - "Enter Withdrawal Amount"

### 3. Better User Information

Added withdrawal preview showing:

- Withdraw Amount: X MAS
- Transaction Fee: ~0.01 MAS
- Current Wallet: X.XXXX MAS
- Remaining Vault: X.XXXX MAS

### 4. Warning Message

Shows warning when wallet balance < 0.01 MAS:

```
⚠️ Low Wallet Balance: Need at least 0.01 MAS in wallet for transaction fees.
Current wallet: X.XXXX MAS
```

## Testing

1. ✅ Build passes successfully
2. ✅ UI prevents invalid withdrawals
3. ✅ Clear error messages guide users
4. ✅ Wallet balance validation prevents blockchain errors

## Files Modified

- `src/components/vault/WithdrawCard.tsx` - Added wallet balance validation and enhanced UI
