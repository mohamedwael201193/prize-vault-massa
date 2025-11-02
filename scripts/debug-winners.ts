import {
  Account,
  Args,
  JsonRpcProvider,
  SmartContract,
} from "@massalabs/massa-web3";
import * as dotenv from "dotenv";

dotenv.config({ path: "../.env.local" });

async function debugWinners() {
  console.log("🔍 DEBUG: Raw getWinners Response\n");

  const account = await Account.fromEnv();
  const provider = JsonRpcProvider.buildnet(account);
  const vaultAddr =
    process.env.VAULT_ADDR ||
    "AS122scyNmqE8q7Rer8uKoJHVQiSk7wwwVWpknmKuYjGj6qL9bUWP";

  const contract = new SmartContract(provider, vaultAddr);

  // Get stats
  const statsResult = await contract.read("getVaultStats");
  const statsString = new TextDecoder().decode(statsResult.value);
  console.log("📊 Stats Raw Response:");
  console.log("Type:", typeof statsResult.value);
  console.log("Length:", statsResult.value.length);
  console.log("First 50 bytes:", Array.from(statsResult.value.slice(0, 50)));
  console.log("Decoded:", statsString.substring(0, 200));

  const stats = JSON.parse(statsString);
  console.log("\n✅ Stats Parsed Successfully!");
  console.log("Winner Count:", stats.winnerCount);

  // Get winners
  console.log("\n🏆 Winners Raw Response:");
  const winnersArgs = new Args().addU64(0n).addU64(5n);
  const winnersResult = await contract.read("getWinners", winnersArgs);

  console.log("Type:", typeof winnersResult.value);
  console.log("Length:", winnersResult.value.length);
  console.log(
    "First 100 bytes:",
    Array.from(winnersResult.value.slice(0, 100))
  );

  const winnersString = new TextDecoder().decode(winnersResult.value);
  console.log("\nDecoded String:");
  console.log(winnersString);
  console.log("\nString Length:", winnersString.length);

  try {
    const winners = JSON.parse(winnersString);
    console.log("\n✅ Winners Parsed Successfully!");
    console.log("Array Length:", winners.length);
    console.log("Winners:", JSON.stringify(winners, null, 2));
  } catch (error) {
    console.log("\n❌ JSON Parse Failed:", error);
    console.log("Trying to find JSON in string...");

    // Try to extract JSON
    const jsonStart = winnersString.indexOf("[");
    const jsonEnd = winnersString.lastIndexOf("]") + 1;
    if (jsonStart !== -1 && jsonEnd > jsonStart) {
      const extracted = winnersString.substring(jsonStart, jsonEnd);
      console.log("Extracted:", extracted);
      try {
        const winners = JSON.parse(extracted);
        console.log("✅ Extracted JSON parsed successfully!");
        console.log("Winners:", JSON.stringify(winners, null, 2));
      } catch (e) {
        console.log("❌ Still failed:", e);
      }
    }
  }
}

debugWinners().catch(console.error);
