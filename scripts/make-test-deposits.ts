import {
  Account,
  Args,
  JsonRpcProvider,
  Mas,
  SmartContract,
} from "@massalabs/massa-web3";
import * as dotenv from "dotenv";
import * as path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config({ path: path.join(__dirname, "..", ".env.local") });

async function makeTestDeposits() {
  console.log("🎯 MAKING TEST DEPOSITS TO PRIZE VAULT");
  console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  if (!process.env.SECRET_KEY) {
    console.error("❌ Missing SECRET_KEY in .env.local");
    process.exit(1);
  }

  // Create account and provider
  const account = await Account.fromEnv();
  const provider = JsonRpcProvider.buildnet(account);

  const vaultAddr =
    process.env.VAULT_ADDR ||
    process.env.VITE_VAULT_ADDRESS ||
    "AS12iGM4DMi9Fsa3Z61TK3sS4fapQ4DrCmjKQbuZBzsAcdgjM6F1Z";

  console.log("📋 Account:", account.address.toString());
  console.log("🏦 Vault:", vaultAddr);
  console.log();

  const deposits = [
    { amount: 5, tier: "Conservative (1%)", multiplier: 1 },
    { amount: 3, tier: "Moderate (2%)", multiplier: 2 },
    { amount: 2, tier: "Aggressive (5%)", multiplier: 3 },
  ];

  const contract = new SmartContract(provider, vaultAddr);

  for (let i = 0; i < deposits.length; i++) {
    const dep = deposits[i];
    console.log(`💰 DEPOSIT ${i + 1}/3: ${dep.amount} MAS - ${dep.tier}`);
    console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

    try {
      const amountNanoMAS = BigInt(Math.floor(dep.amount * 1e9));

      // Call deposit function (all deposits go to same pool for now)
      const opId = await contract.call("deposit", new Args(), {
        coins: amountNanoMAS,
        fee: Mas.fromString("0.01"),
      });

      console.log(`   ✅ Transaction sent: ${opId}`);
      console.log(
        `   🔗 Explorer: https://buildnet.massa.net/operation/${opId}`
      );
      console.log(`   ⏳ Waiting for confirmation...\n`);

      // Wait for confirmation
      await new Promise((resolve) => setTimeout(resolve, 8000));
    } catch (error) {
      console.error(`   ❌ Deposit failed:`, error);
      if (error instanceof Error) {
        console.error(`   Error: ${error.message}\n`);
      }
    }
  }

  console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  console.log("✅ ALL DEPOSITS COMPLETED!");
  console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

  console.log("📊 Expected results:");
  console.log("   Total Deposited: 10.00 MAS");
  console.log("   Conservative: 5.00 MAS (1% = 0.05 MAS to prize)");
  console.log("   Moderate: 3.00 MAS (2% = 0.06 MAS to prize)");
  console.log("   Aggressive: 2.00 MAS (5% = 0.10 MAS to prize)");
  console.log("   Expected Prize Pool: ~0.21 MAS\n");

  console.log("📋 Next steps:");
  console.log("   1. Check vault: npm run check:vault");
  console.log("   2. Trigger draw: npm run draw");
  console.log("   3. Check winners: npm run check:winners\n");
}

makeTestDeposits()
  .then(() => {
    console.log("✨ Deposits completed successfully!");
    process.exit(0);
  })
  .catch((error) => {
    console.error("Fatal error:", error);
    process.exit(1);
  });
