/**
 * 💰 Quick Deposit Test
 * Makes a 10 MAS deposit from your main wallet
 */

import {
  ClientFactory,
  DefaultProviderUrls,
  WalletClient,
} from "@massalabs/massa-web3";
import * as dotenv from "dotenv";

dotenv.config({ path: ".env.local" });

const CONTRACT_ADDRESS =
  "AS122scyNmqE8q7Rer8uKoJHVQiSk7wwwVWpknmKuYjGj6qL9bUWP";
const DEPOSIT_AMOUNT = 10_000_000_000n; // 10 MAS

async function quickDeposit() {
  console.log("\n💰 Quick Deposit Test\n");

  const account = await WalletClient.getAccountFromSecretKey(
    process.env.SECRET_KEY!
  );
  const client = await ClientFactory.createDefaultClient(
    DefaultProviderUrls.BUILDNET,
    77658366,
    true,
    account
  );

  console.log(`📤 Depositing 10 MAS from ${account.address}...`);

  const opId = await client.smartContracts().callSmartContract({
    targetAddress: CONTRACT_ADDRESS,
    functionName: "deposit",
    parameter: [],
    coins: DEPOSIT_AMOUNT,
    maxGas: 100_000_000n,
  });

  console.log(`✅ Deposit submitted!`);
  console.log(`Operation ID: ${opId}`);
  console.log(`\n⏳ Wait 10-20s then run: npm run check:vault\n`);
}

quickDeposit().catch(console.error);
