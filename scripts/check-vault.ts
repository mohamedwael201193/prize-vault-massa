import {
  Account,
  Args,
  JsonRpcProvider,
  SmartContract,
} from "@massalabs/massa-web3";
import * as dotenv from "dotenv";

// Load environment variables from parent directory
dotenv.config({ path: "../.env.local" });

async function checkVault() {
  try {
    console.log("🔍 Checking AutoPrize Vault Status...\n");

    if (!process.env.SECRET_KEY) {
      console.error("Missing SECRET_KEY environment variable");
      console.error(
        "Make sure .env.local exists with SECRET_KEY=your_private_key"
      );
      process.exit(1);
    }

    // Create account from environment
    const account = await Account.fromEnv();
    console.log(`📋 Using account: ${account.address}`);

    // Create provider
    const provider = JsonRpcProvider.buildnet(account);

    const vaultAddr =
      process.env.VAULT_ADDR ||
      "AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz";
    console.log(`🏦 Vault Contract: ${vaultAddr}\n`);

    const contract = new SmartContract(provider, vaultAddr);

    // Get vault statistics
    console.log("📊 Getting Vault Statistics...");
    const statsResult = await contract.read("getVaultStats");

    // Handle massa-web3 response - statsResult.value is Uint8Array
    // The response has a binary prefix, we need to find the JSON part
    let statsJson: string;
    try {
      const decoder = new TextDecoder("utf-8");
      const rawString = decoder.decode(statsResult.value);

      // Find the JSON object (skip any binary prefix)
      const jsonStart = rawString.indexOf("{");
      if (jsonStart !== -1) {
        statsJson = rawString.substring(jsonStart);
      } else {
        statsJson = rawString;
      }
    } catch (e) {
      console.error("Failed to decode response:", e);
      throw e;
    }

    const stats = JSON.parse(statsJson);

    console.log("\n🎯 VAULT OVERVIEW:");
    console.log(`   Total Value Locked: ${Number(stats.tvl) / 1e9} MAS`);
    console.log(`   Total Shares: ${Number(stats.totalShares) / 1e9}`);
    console.log(`   Prize Pool: ${Number(stats.prizePool) / 1e9} MAS`);
    console.log(`   Participants: ${stats.participants}`);
    console.log(`   Winner Count: ${stats.winnerCount}`);
    console.log(
      `   Min Prize Threshold: ${Number(stats.minPrizeThreshold) / 1e9} MAS`
    );
    console.log(`   Draw Periods: ${stats.drawPeriods} periods`);
    console.log(`   Tick Periods: ${stats.tickPeriods} periods`);
    console.log(`   Contract Version: ${stats.contractVersion}`);

    // Calculate time information
    const nodeStatus = await provider.getNodeStatus();
    const currentPeriod =
      nodeStatus.currentCycle * 32 + nodeStatus.currentCycleTime; // Massa periods
    const nextDrawPeriod = parseInt(stats.nextDrawPeriod);
    const periodsUntilDraw = Math.max(0, nextDrawPeriod - currentPeriod);
    const minutesUntilDraw = Math.round((periodsUntilDraw * 16) / 60); // ~16 seconds per period

    console.log("\n⏰ TIMING INFO:");
    console.log(`   Current Period: ${currentPeriod}`);
    console.log(`   Next Draw Period: ${nextDrawPeriod}`);
    console.log(`   Periods Until Draw: ${periodsUntilDraw}`);
    console.log(`   Minutes Until Draw: ${minutesUntilDraw} min`);
    console.log(`   Last Draw Period: ${stats.lastDrawPeriod || "None"}`);

    // Check our position if we have one
    try {
      const args = new Args().addString(account.address.toString());
      const positionResult = await contract.read("getUserPosition", args);
      const position = JSON.parse(
        new TextDecoder().decode(positionResult.value)
      );

      if (Number(position.shares) > 0) {
        console.log("\n👤 YOUR POSITION:");
        console.log(`   Your Shares: ${Number(position.shares) / 1e9}`);
        console.log(
          `   Your Principal: ${Number(position.principal) / 1e9} MAS`
        );
        console.log(
          `   Effective Tickets: ${Number(position.effectiveTickets) / 1e9}`
        );

        if (Number(stats.totalShares) > 0) {
          const winChance =
            (Number(position.shares) / Number(stats.totalShares)) * 100;
          console.log(`   Win Probability: ${winChance.toFixed(4)}%`);
        }
      } else {
        console.log("\n👤 YOUR POSITION: No deposits found");
      }
    } catch (error) {
      console.log("\n👤 YOUR POSITION: Unable to fetch (no deposits)");
    }

    // Get recent winners
    if (Number(stats.winnerCount) > 0) {
      console.log("\n🏆 RECENT WINNERS:");
      const winnersArgs = new Args().addU64(0n).addU64(5n);
      const winnersResult = await contract.read("getWinners", winnersArgs);
      const winners = JSON.parse(new TextDecoder().decode(winnersResult.value));

      winners.forEach((winner: any, index: number) => {
        console.log(
          `   #${index + 1}: ${winner.winner} won ${
            Number(winner.prize) / 1e9
          } MAS in period ${winner.period}`
        );
      });
    } else {
      console.log("\n🏆 RECENT WINNERS: No winners yet");
    }

    // Status assessment
    console.log("\n🚨 DRAW READINESS:");
    const prizePoolMAS = Number(stats.prizePool) / 1e9;
    const minPrizeMAS = Number(stats.minPrizeThreshold) / 1e9;

    if (prizePoolMAS >= minPrizeMAS && Number(stats.participants) > 0) {
      console.log(
        `   ✅ READY TO DRAW! Prize pool (${prizePoolMAS} MAS) >= minimum (${minPrizeMAS} MAS)`
      );
      console.log(`   ✅ Has participants: ${stats.participants}`);
      if (periodsUntilDraw <= 0) {
        console.log(`   🎯 DRAW SHOULD HAPPEN NOW!`);
      } else {
        console.log(`   ⏳ Next draw in ${minutesUntilDraw} minutes`);
      }
    } else {
      console.log(
        `   ❌ NOT READY - Prize pool (${prizePoolMAS} MAS) < minimum (${minPrizeMAS} MAS)`
      );
      console.log(
        `   🎯 Need to fund prize pool with at least ${
          minPrizeMAS - prizePoolMAS
        } MAS`
      );
    }
  } catch (error) {
    console.error("❌ Error checking vault:", error);
    process.exit(1);
  }
}

checkVault();
