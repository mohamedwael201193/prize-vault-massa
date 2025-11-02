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

async function fundPrizePool() {
  console.log("💰 FUNDING PRIZE POOL");
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

  // Get amount from command line or use default
  const amountMAS = process.argv[2] ? parseFloat(process.argv[2]) : 1.0;
  const amountNanoMAS = BigInt(Math.floor(amountMAS * 1e9));

  console.log("📋 Account:", account.address.toString());
  console.log("🏦 Vault:", vaultAddr);
  console.log("💰 Funding amount:", amountMAS, "MAS\n");

  try {
    const contract = new SmartContract(provider, vaultAddr);

    console.log("📤 Calling addToPrizePool()...");
    const opId = await contract.call("addToPrizePool", new Args(), {
      coins: amountNanoMAS,
      fee: Mas.fromString("0.01"),
    });

    console.log("✅ Transaction sent:", opId);
    console.log("🔗 Explorer:", `https://buildnet.massa.net/operation/${opId}`);
    console.log("⏳ Waiting for confirmation...\n");

    await new Promise((resolve) => setTimeout(resolve, 8000));

    console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    console.log("✅ PRIZE POOL FUNDED!");
    console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

    console.log("📋 Next steps:");
    console.log("   1. Check vault: npm run check:vault");
    console.log("   2. Trigger draw: npm run draw");
    console.log("   3. Check winners: npm run check:winners\n");
  } catch (error) {
    console.error("❌ Fund failed:", error);
    if (error instanceof Error) {
      console.error("Error:", error.message);
    }
    process.exit(1);
  }
}

fundPrizePool()
  .then(() => {
    console.log("✨ Funding completed successfully!");
    process.exit(0);
  })
  .catch((error) => {
    console.error("Fatal error:", error);
    process.exit(1);
  });
