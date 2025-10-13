import {
    Account,
    Args,
    JsonRpcProvider,
    Mas,
    SmartContract,
} from '@massalabs/massa-web3';
import fs from "fs";
import path from "path";
import { fileURLToPath } from 'url';

// ES module dirname compatibility
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Environment configuration
const PRIVATE_KEY = "S1fJZjjH82tEmKxjrXB8mT1op4RJALfddeXLeuPEmAUT3UHRVZV";

// Load contract address from .env
function getContractAddress(): string {
  const envPath = path.resolve(__dirname, "../.env");
  if (!fs.existsSync(envPath)) {
    throw new Error("No .env file found. Please deploy the fundable contract first.");
  }
  
  const envContent = fs.readFileSync(envPath, "utf-8");
  const match = envContent.match(/FUNDABLE_VAULT_ADDR=(.+)/);
  
  if (!match || !match[1]) {
    throw new Error("FUNDABLE_VAULT_ADDR not found in .env. Please deploy the fundable contract first.");
  }
  
  return match[1].trim();
}

async function fundPrizePoolNew(amount: string = "50") {
  try {
    console.log(`🎯 Funding Prize Pool with ${amount} MAS...`);
    
    // Initialize account and provider
    const account = await Account.fromPrivateKey(PRIVATE_KEY);
    const provider = JsonRpcProvider.buildnet(account);
    console.log("Funding from address:", account.address.toString());

    // Get contract address
    const contractAddress = getContractAddress();
    console.log("Contract address:", contractAddress);

    // Create contract instance
    const contract = new SmartContract(provider, contractAddress);

    // Check account balance first
    console.log(`Requested amount: ${amount} MAS`);
    console.log("Proceeding with funding (balance check skipped for simplicity)...");

    // Get vault stats before funding
    console.log("\n📊 Vault stats before funding:");
    try {
      const statsBefore = await contract.read("getVaultStats");
      const statsJson = JSON.parse(new TextDecoder().decode(statsBefore.value));
      console.log("- Current prize pool:", (Number(statsJson.prizePool) / 1e9).toFixed(6), "MAS");
      console.log("- Total TVL:", (Number(statsJson.tvl) / 1e9).toFixed(6), "MAS");
      console.log("- Participants:", statsJson.participants);
      console.log("- Min threshold:", (Number(statsJson.minPrizeThreshold) / 1e9).toFixed(6), "MAS");
    } catch (error) {
      console.log("Could not fetch stats before funding");
    }

    // Fund the prize pool using the fundPrizePool function
    console.log(`\n💰 Calling fundPrizePool with ${amount} MAS...`);
    const fundingResult = await contract.call(
      "fundPrizePool",
      new Args(),
      { coins: Mas.fromString(amount) }
    );

    console.log("✅ Prize pool funded successfully!");
    console.log("Operation ID:", fundingResult.id);

    // Wait a moment for the transaction to be processed
    console.log("\n⏳ Waiting for transaction confirmation...");
    await new Promise(resolve => setTimeout(resolve, 10000));

    // Check vault stats after funding
    console.log("\n📊 Vault stats after funding:");
    try {
      const statsAfter = await contract.read("getVaultStats");
      const statsJson = JSON.parse(new TextDecoder().decode(statsAfter.value));
      console.log("- New prize pool:", (Number(statsJson.prizePool) / 1e9).toFixed(6), "MAS");
      console.log("- Total TVL:", (Number(statsJson.tvl) / 1e9).toFixed(6), "MAS");
      console.log("- Participants:", statsJson.participants);
      console.log("- Min threshold:", (Number(statsJson.minPrizeThreshold) / 1e9).toFixed(6), "MAS");
      console.log("- Next draw period:", statsJson.nextDrawPeriod);
      console.log("- Contract version:", statsJson.contractVersion);
      
      // Check if draw is now possible
      const prizePool = Number(statsJson.prizePool);
      const minThreshold = Number(statsJson.minPrizeThreshold);
      
      if (prizePool >= minThreshold) {
        console.log("\n🎉 PRIZE DRAW NOW POSSIBLE!");
        console.log("Prize pool exceeds minimum threshold - draws can now occur!");
      } else {
        console.log(`\n⚠️  Prize pool still below threshold (${(prizePool / 1e9).toFixed(6)} < ${(minThreshold / 1e9).toFixed(6)} MAS)`);
      }
    } catch (error) {
      console.log("Could not fetch stats after funding:", error);
    }

    // Get recent events
    console.log("\n📜 Recent events:");
    try {
      const events = await provider.getEvents({
        smartContractAddress: contractAddress,
      });

      // Show last few events
      const recentEvents = events.slice(-5);
      for (const event of recentEvents) {
        console.log(`- ${event.data}`);
      }
    } catch (error) {
      console.log("Could not fetch events");
    }

    return {
      operationId: fundingResult.id,
      contractAddress: contractAddress
    };

  } catch (error) {
    console.error("❌ Prize pool funding failed:", error);
    throw error;
  }
}

// Command line interface
async function main() {
  const args = process.argv.slice(2);
  const amount = args[0] || "50";
  
  console.log("🚀 AutoPrize Vault - Prize Pool Funding Tool");
  console.log("============================================");
  
  try {
    const result = await fundPrizePoolNew(amount);
    
    console.log("\n✅ FUNDING COMPLETE!");
    console.log("Next steps:");
    console.log("1. Wait for autonomous tick to trigger (every ~1 minute)");
    console.log("2. If draw period reached, winner will be selected automatically");
    console.log("3. Check winner page in the frontend to see results");
    console.log("\nOperation ID:", result.operationId);
    
  } catch (error) {
    console.error("\n❌ Funding failed!");
    process.exit(1);
  }
}

// Run if called directly (ES Module compatible)
main();

export { fundPrizePoolNew };
