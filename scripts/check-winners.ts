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

function bytesToString(bytes: Uint8Array): string {
  const decoder = new TextDecoder("utf-8");
  const rawString = decoder.decode(bytes);
  // Find the start of JSON (either '{' for object or '[' for array)
  const jsonStart = Math.max(rawString.indexOf("{"), rawString.indexOf("["));
  if (jsonStart === -1) return rawString;

  // Find the end of JSON
  let jsonEnd = rawString.length;
  // Look for the closing bracket/brace
  if (rawString[jsonStart] === "[") {
    const lastBracket = rawString.lastIndexOf("]");
    if (lastBracket !== -1) jsonEnd = lastBracket + 1;
  } else if (rawString[jsonStart] === "{") {
    const lastBrace = rawString.lastIndexOf("}");
    if (lastBrace !== -1) jsonEnd = lastBrace + 1;
  }

  return rawString.substring(jsonStart, jsonEnd);
}

async function checkWinners() {
  console.log("🏆 CHECKING PRIZE VAULT WINNERS");
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
    "AS122scyNmqE8q7Rer8uKoJHVQiSk7wwwVWpknmKuYjGj6qL9bUWP";

  console.log("📋 Account:", account.address.toString());
  console.log("🏦 Vault:", vaultAddr);
  console.log();

  try {
    const contract = new SmartContract(provider, vaultAddr);

    // Get vault stats first
    console.log("📊 Fetching vault stats...\n");
    const statsArgs = new Args();
    const statsResult = await contract.read("getVaultStats", statsArgs);
    const statsString = new TextDecoder().decode(statsResult.value);
    const stats = JSON.parse(statsString);

    const winnerCount = parseInt(stats.winnerCount || "0");
    const totalPrizes = Number(stats.prizePool || 0) / 1e9;

    console.log("📈 VAULT STATISTICS:");
    console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    console.log(`   Total Winners: ${winnerCount}`);
    console.log(`   Total Prizes Distributed: ${totalPrizes} MAS`);
    console.log(`   Current Prize Pool: ${Number(stats.prizePool) / 1e9} MAS`);
    console.log(`   Total Draws: ${winnerCount}`);
    console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

    if (winnerCount === 0) {
      console.log("ℹ️  No winners yet!");
      console.log("💡 Run: npm run draw (to trigger first draw)\n");
      return;
    }

    // Fetch winners
    console.log(`🏆 FETCHING ${winnerCount} WINNER(S)...\n`);

    const winnersArgs = new Args()
      .addU64(BigInt(0)) // start index
      .addU64(BigInt(winnerCount)); // fetch all

    const winnersResult = await contract.read("getWinners", winnersArgs);
    const winnersString = new TextDecoder().decode(winnersResult.value);
    const winners = JSON.parse(winnersString);

    if (!Array.isArray(winners) || winners.length === 0) {
      console.log("⚠️  No winner data available\n");
      return;
    }

    console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    console.log("🎉 WINNERS LIST");
    console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");

    let totalDistributed = 0;

    winners.forEach((winner: any, index: number) => {
      const prizeInMas = Number(winner.prize) / 1e9;
      totalDistributed += prizeInMas;

      console.log(`Winner #${index + 1}:`);
      console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
      console.log(`   🏆 Address: ${winner.winner}`);
      console.log(`   💰 Prize: ${prizeInMas.toFixed(4)} MAS`);
      console.log(`   📅 Period: ${winner.period}`);
      console.log(`   🎲 Seed: ${winner.seed}`);

      if (winner.timestamp) {
        const date = new Date(winner.timestamp * 1000);
        console.log(`   🕐 Date: ${date.toLocaleString()}`);
      }

      console.log(
        `   🔗 Explorer: https://buildnet.massa.net/address/${winner.winner}`
      );
      console.log();
    });

    console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    console.log("📊 SUMMARY");
    console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
    console.log(`   Total Winners: ${winners.length}`);
    console.log(`   Total Distributed: ${totalDistributed.toFixed(4)} MAS`);
    console.log(
      `   Average Prize: ${(totalDistributed / winners.length).toFixed(4)} MAS`
    );
    console.log("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n");
  } catch (error) {
    console.error("❌ Error fetching winners:", error);
    if (error instanceof Error) {
      console.error("Error details:", error.message);
    }
    process.exit(1);
  }
}

checkWinners()
  .then(() => {
    console.log("✨ Winner check completed successfully!");
    process.exit(0);
  })
  .catch((error) => {
    console.error("Fatal error:", error);
    process.exit(1);
  });
