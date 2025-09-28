# AutoPrize Vault Smart Contract

## Overview

The AutoPrize Vault is an autonomous smart contract on Massa blockchain that implements a prize savings system. Users deposit MAS, receive shares (tickets), and participate in periodic draws funded by yield generation.

## Features Implemented

### ✅ Phase 1 - Smart Contract Autonomy + Fairness

1. **Scheduled Draws via ASC**
   - Deferred calls trigger draws at fixed period intervals
   - Automatic rescheduling after each draw (successful or skipped)
   - No off-chain dependencies

2. **Fair On-Chain RNG**
   - Multi-block entropy mixing using recent period hashes
   - Deterministic selection from entropy seed
   - Auditable seed components logged in events
   - Uses `generateFairSeed()` function combining:
     - Current period
     - Previous 2 periods (shifted)
     - Total shares and prize pool

3. **Enhanced Data Model & Events**
   - **Storage**: `totalShares`, `prizePool`, `tvl`, `participants`, `winners[]`, `proposals[]`
   - **Events**: 
     - `deposit:caller:amount`
     - `withdraw:caller:amount`  
     - `draw:period:winner:prize:seed`
     - `draw_entropy:period:seed:target:totalShares` (for auditability)
     - `draw_skipped:reason:details`
   - **Winner History**: Persistent storage with period, winner, prize, seed

4. **No Admin Keys + Governance**
   - **Immutable Core**: No admin functions, no upgrade paths
   - **Governance System**: Share-weighted voting for parameters
     - `createProposal()`: Requires 1% of total shares
     - `voteOnProposal()`: Voting power = user shares
     - `executeProposal()`: 50% quorum, majority wins
     - **Tunables**: `minPrizeThreshold`, `drawPeriods`
     - **Timelock**: 7-day voting period (configurable)

## Build

By default this will build all files in `assembly/contracts` directory.

```shell
npm run build

## Deploy a smart contract

Prerequisites :

- You must add a `.env` file at the root of the repository with the following keys set to valid values :
  - WALLET_SECRET_KEY="wallet_secret_key"
  - JSON_RPC_URL_PUBLIC=<https://test.massa.net/api/v2:33035>

These keys will be the ones used by the deployer script to interact with the blockchain.

The following command will build contracts in `assembly/contracts` directory and execute the deployment script
`src/deploy.ts`. This script will deploy on the node specified in the `.env` file.

```shell
npm run deploy
```

You can modify `src/deploy.ts` to change the smart contract being deployed, and to pass arguments to the constructor
function:

- line 31: specify what contract you want to deploy
- line 33: create the `Args` object to pass to the constructor of the contract you want to deploy

When the deployment operation is executed on-chain, the
[constructor](https://github.com/massalabs/massa-sc-toolkit/blob/main/packages/sc-project-initializer/commands/init/assembly/contracts/main.ts#L10)
function of the smart contract being deployed will
be called with the arguments provided in the deployment script.

You can edit this script and use [massa-web3 library](https://www.npmjs.com/package/@massalabs/massa-web3)
to create advanced deployment procedure.

For more information, please visit our ReadTheDocs about
[Massa smart-contract development](https://docs.massa.net/en/latest/web3-dev/smart-contracts.html).

## Unit tests

The test framework documentation is available here: [as-pect docs](https://as-pect.gitbook.io/as-pect)

```shell
npm run test
```

## Format code

```shell
npm run fmt
```
