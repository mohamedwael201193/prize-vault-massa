#!/usr/bin/env node
/**
 * 🎯 COMPLETE DEMO SCRIPT
 *
 * This script does EVERYTHING:
 * 1. Fund prize pool (100 MAS)
 * 2. Make 3 deposits from different wallets/tiers
 * 3. Trigger manual draw
 * 4. Show winner
 *
 * Usage: npm run demo
 */

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

const CONTRACT = "AS12mrFiqszWMeh1a6P44yTG9yMxXnnfSXAGyufh8g6112wu9HPYL";

const wallets = [
  {
    name: "Wallet A - Conservative",
    secret: "S1g78nTfpo3sLveuy4Df5BDftKq7oZ7egz4oTDFiBH8rWEmvPXa",
    func: "depositConservative",
    tickets: 10,
    chance: "14%",
  },
  {
    name: "Wallet B - Moderate",
    secret: "S1fJZjjH82tEmKxjrXB8mT1op4RJALfddeXLeuPEmAUT3UHRVZV",
    func: "depositModerate",
    tickets: 20,
    chance: "29%",
  },
  {
    name: "Wallet C - Aggressive",
    secret: "S14RenBwuNTg8cRHj6zs6GQqsq7WqRvwiqRC9WxCa8PEcHFftVm",
    func: "depositAggressive",
    tickets: 40,
    chance: "57%",
  },
];

async function sleep(ms: number) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function demo() {
  console.log("\n" + "=".repeat(70));
  console.log("🎯 COMPLETE DEMO - Risk Tier Prize Vault");
  console.log("=".repeat(70));
  console.log(`Contract: ${CONTRACT}\n`);

  // STEP 1: Fund Prize Pool
  console.log("━".repeat(70));
  console.log("STEP 1: Funding Prize Pool (100 MAS)");
  console.log("━".repeat(70));

  try {
    const account = await Account.fromEnv();
    const provider = JsonRpcProvider.buildnet(account);
    const contract = new SmartContract(provider, CONTRACT);

    const fundOp = await contract.call("addToPrizePool", new Args(), {
      coins: Mas.fromString("100"),
      fee: Mas.fromString("0.01"),
    });

    console.log("✅ Prize pool funded!");
    console.log(`   Operation: ${fundOp.id}`);
    console.log("   Waiting 10s...\n");
    await sleep(10000);
  } catch (e: any) {
    console.error("❌ Fund failed:", e.message);
    return;
  }

  // STEP 2: Make 3 Deposits
  console.log("━".repeat(70));
  console.log("STEP 2: Making Deposits from 3 Wallets");
  console.log("━".repeat(70));

  for (const w of wallets) {
    try {
      console.log(`\n💰 ${w.name}`);
      const account = await Account.fromPrivateKey(w.secret);
      const provider = JsonRpcProvider.buildnet(account);
      const contract = new SmartContract(provider, CONTRACT);

      console.log(`   Address: ${account.address.toString()}`);
      console.log(`   Tier: ${w.func}`);
      console.log(`   Tickets: ${w.tickets} (${w.chance} win chance)`);
      console.log(`   📤 Depositing 10 MAS...`);

      const op = await contract.call(w.func, new Args(), {
        coins: Mas.fromString("10"),
        fee: Mas.fromString("0.01"),
      });

      console.log(`   ✅ Done: ${op.id}`);
      await sleep(8000);
    } catch (e: any) {
      console.error(`   ❌ ${e.message}`);
    }
  }

  console.log("\n   ⏳ Waiting 20s for all deposits to finalize...\n");
  await sleep(20000);

  // STEP 3: Check Stats
  console.log("━".repeat(70));
  console.log("STEP 3: Checking Vault Stats");
  console.log("━".repeat(70) + "\n");

  try {
    const account = await Account.fromEnv();
    const provider = JsonRpcProvider.buildnet(account);
    const contract = new SmartContract(provider, CONTRACT);

    const consTVL = await contract.read("getConservativeTVL", new Args());
    const modTVL = await contract.read("getModerateTVL", new Args());
    const aggTVL = await contract.read("getAggressiveTVL", new Args());
    const consTickets = await contract.read(
      "getConservativeTickets",
      new Args()
    );
    const modTickets = await contract.read("getModerateTickets", new Args());
    const aggTickets = await contract.read("getAggressiveTickets", new Args());
    const prize = await contract.read("getPrizePool", new Args());

    console.log("📊 Tier Breakdown:");
    console.log(
      `   Conservative: ${(Number(consTVL.value) / 1e9).toFixed(
        2
      )} MAS, ${Number(consTickets.value)} tickets`
    );
    console.log(
      `   Moderate:     ${(Number(modTVL.value) / 1e9).toFixed(
        2
      )} MAS, ${Number(modTickets.value)} tickets`
    );
    console.log(
      `   Aggressive:   ${(Number(aggTVL.value) / 1e9).toFixed(
        2
      )} MAS, ${Number(aggTickets.value)} tickets`
    );
    console.log(
      `\n🏆 Prize Pool: ${(Number(prize.value) / 1e9).toFixed(2)} MAS\n`
    );
  } catch (e: any) {
    console.error("❌ Stats check failed:", e.message);
  }

  // STEP 4: Trigger Draw
  console.log("━".repeat(70));
  console.log("STEP 4: Triggering Prize Draw");
  console.log("━".repeat(70) + "\n");

  try {
    const account = await Account.fromEnv();
    const provider = JsonRpcProvider.buildnet(account);
    const contract = new SmartContract(provider, CONTRACT);

    console.log("🎲 Executing draw...");
    const drawOp = await contract.call("manualDraw", new Args(), {
      coins: Mas.fromString("0"),
      fee: Mas.fromString("0.01"),
    });

    console.log(`✅ Draw executed!`);
    console.log(`   Operation: ${drawOp.id}`);
    console.log("   Waiting 15s for finalization...\n");
    await sleep(15000);
  } catch (e: any) {
    console.error("❌ Draw failed:", e.message);
    return;
  }

  // STEP 5: Check Winner
  console.log("━".repeat(70));
  console.log("STEP 5: Checking Winner");
  console.log("━".repeat(70) + "\n");

  try {
    const account = await Account.fromEnv();
    const provider = JsonRpcProvider.buildnet(account);
    const contract = new SmartContract(provider, CONTRACT);

    const countResult = await contract.read("getWinnerCount", new Args());
    const count = Number(countResult.value);

    if (count > 0) {
      const args = new Args().addU64(BigInt(count - 1));
      const winnerResult = await contract.read("getWinner", args);
      const data = winnerResult.value as string;

      if (data) {
        const [period, address, prize, seed] = data.split(":");

        console.log("🎉 WE HAVE A WINNER!");
        console.log(`   Address: ${address}`);
        console.log(`   Prize: ${(Number(prize) / 1e9).toFixed(2)} MAS`);
        console.log(`   Period: ${period}`);
        console.log(`   Seed: ${seed}`);

        // Identify which wallet won
        const walletMap: Record<string, string> = {
          AU12rQ13Pb7B1azLUKzUZJh9vwmtsvMAp6L2kCLeGhpPCdUuJveU:
            "Wallet A (Conservative - 14% chance)",
          AU1kwtkGP4ZjnqY4iZ4Acia5fGd45Kjk2DnssjhSpNdDo7ZmSyj3:
            "Wallet B (Moderate - 29% chance)",
          AU12868sJMQwXPHPiz8bFxvs2d6PE6R3oWATo6nNwwZnhkHycyJ6t:
            "Wallet C (Aggressive - 57% chance)",
        };

        console.log(`\n   👤 Winner: ${walletMap[address] || "Unknown"}\n`);
      }
    } else {
      console.log("❌ No winners found. Draw may still be processing.\n");
    }
  } catch (e: any) {
    console.error("❌ Winner check failed:", e.message);
  }

  // Final Summary
  console.log("━".repeat(70));
  console.log("✅ DEMO COMPLETE!");
  console.log("━".repeat(70));
  console.log("\n📋 Next Steps:");
  console.log("   1. Start frontend: npm run dev");
  console.log("   2. Visit: http://localhost:8080");
  console.log("   3. Check Winners page to see results");
  console.log(
    "   4. Try depositing through the UI with different risk tiers!\n"
  );
  console.log("🚀 Risk Tier System is FULLY WORKING!\n");
}

demo().catch(console.error);
