import {
  Account,
  Args,
  JsonRpcProvider,
  SmartContract,
} from "@massalabs/massa-web3";
import * as dotenv from "dotenv";
import * as path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.join(__dirname, "..", ".env.local") });

async function checkWinners() {
  const CONTRACT =
    process.env.VITE_VAULT_ADDRESS ||
    "AS12kyZSPsZLUYwn1tPfkyQaPJTTQgfdEz9GVntEduFr6LyqP7boi";

  console.log("\n🏆 Checking Winners\n");
  console.log("Contract:", CONTRACT, "\n");

  const account = await Account.fromEnv();
  const provider = JsonRpcProvider.buildnet(account);
  const contract = new SmartContract(provider, CONTRACT);

  try {
    const countResult = await contract.read("getWinnerCount", new Args());
    const count = Number(countResult.value);

    console.log("Total Draws:", count, "\n");

    if (count === 0) {
      console.log("❌ No winners yet. Run: npm run draw\n");
      return;
    }

    for (let i = 0; i < count; i++) {
      const args = new Args().addU64(BigInt(i));
      const winnerResult = await contract.read("getWinner", args);
      const data = winnerResult.value as string;

      if (data) {
        const [period, address, prize, seed] = data.split(":");
        console.log(`🎉 Draw #${i + 1}:`);
        console.log(`   Winner: ${address}`);
        console.log(`   Prize: ${(Number(prize) / 1e9).toFixed(2)} MAS`);
        console.log(`   Period: ${period}`);
        console.log(`   Seed: ${seed}\n`);
      }
    }

    // Map addresses to wallet names
    const walletNames: Record<string, string> = {
      AU12rQ13Pb7B1azLUKzUZJh9vwmtsvMAp6L2kCLeGhpPCdUuJveU:
        "Wallet A (Conservative - 10 tickets - 14% chance)",
      AU1kwtkGP4ZjnqY4iZ4Acia5fGd45Kjk2DnssjhSpNdDo7ZmSyj3:
        "Wallet B (Moderate - 20 tickets - 29% chance)",
      AU12868sJMQwXPHPiz8bFxvs2d6PE6R3oWATo6nNwwZnhkHycyJ6t:
        "Wallet C (Aggressive - 40 tickets - 57% chance)",
    };

    console.log("📊 Participant Info:");
    Object.entries(walletNames).forEach(([addr, name]) => {
      console.log(`   ${name}`);
      console.log(`   Address: ${addr}`);
    });
  } catch (e: any) {
    console.error("❌", e.message);
  }
}

checkWinners().catch(console.error);
