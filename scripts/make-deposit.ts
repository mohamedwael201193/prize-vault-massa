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

async function makeDeposit(amount: string = "5") {
  try {
    console.log(`🎯 Making deposit of ${amount} MAS...`);
    
    // Initialize account and provider
    const account = await Account.fromPrivateKey(PRIVATE_KEY);
    const provider = JsonRpcProvider.buildnet(account);
    console.log("Depositing from address:", account.address.toString());

    // Get contract address
    const contractAddress = getContractAddress();
    console.log("Contract address:", contractAddress);

    // Create contract instance
    const contract = new SmartContract(provider, contractAddress);

    // Get vault stats before deposit
    console.log("\n📊 Vault stats before deposit:");
    try {
      const statsBefore = await contract.read("getVaultStats");
      const statsJson = JSON.parse(new TextDecoder().decode(statsBefore.value));
      console.log("- Current prize pool:", (Number(statsJson.prizePool) / 1e9).toFixed(6), "MAS");
      console.log("- Total TVL:", (Number(statsJson.tvl) / 1e9).toFixed(6), "MAS");
      console.log("- Participants:", statsJson.participants);
    } catch (error) {
      console.log("Could not fetch stats before deposit");
    }

    // Make the deposit
    console.log(`\n💰 Making deposit of ${amount} MAS...`);
    const depositResult = await contract.call(
      "deposit",
      new Args(),
      { coins: Mas.fromString(amount) }
    );

    console.log("✅ Deposit successful!");
    console.log("Operation ID:", depositResult.id);

    // Wait a moment for the transaction to be processed
    console.log("\n⏳ Waiting for transaction confirmation...");
    await new Promise(resolve => setTimeout(resolve, 8000));

    // Check vault stats after deposit
    console.log("\n📊 Vault stats after deposit:");
    try {
      const statsAfter = await contract.read("getVaultStats");
      const statsJson = JSON.parse(new TextDecoder().decode(statsAfter.value));
      console.log("- Prize pool:", (Number(statsJson.prizePool) / 1e9).toFixed(6), "MAS");
      console.log("- New TVL:", (Number(statsJson.tvl) / 1e9).toFixed(6), "MAS");
      console.log("- Participants:", statsJson.participants);
      console.log("- Next draw period:", statsJson.nextDrawPeriod);
      
      // Check user position
      const userPosition = await contract.read("getUserPosition", new Args().addString(account.address.toString()));
      const positionJson = JSON.parse(new TextDecoder().decode(userPosition.value));
      console.log("- Your shares:", (Number(positionJson.shares) / 1e9).toFixed(6));
      console.log("- Your principal:", (Number(positionJson.principal) / 1e9).toFixed(6));
      
    } catch (error) {
      console.log("Could not fetch stats after deposit:", error);
    }

    // Get recent events
    console.log("\n📜 Recent events:");
    try {
      const events = await provider.getEvents({
        smartContractAddress: contractAddress,
      });

      // Show last few events
      const recentEvents = events.slice(-3);
      for (const event of recentEvents) {
        console.log(`- ${event.data}`);
      }
    } catch (error) {
      console.log("Could not fetch events");
    }

    return {
      operationId: depositResult.id,
      contractAddress: contractAddress
    };

  } catch (error) {
    console.error("❌ Deposit failed:", error);
    throw error;
  }
}

// Command line interface
async function main() {
  const args = process.argv.slice(2);
  const amount = args[0] || "5";
  
  console.log("🚀 AutoPrize Vault - Make Deposit");
  console.log("================================");
  
  try {
    const result = await makeDeposit(amount);
    
    console.log("\n✅ DEPOSIT COMPLETE!");
    console.log("You are now eligible for prize draws!");
    console.log("Next draw will happen automatically when draw period is reached.");
    console.log("\nOperation ID:", result.operationId);
    
  } catch (error) {
    console.error("\n❌ Deposit failed!");
    process.exit(1);
  }
}

// Run if called directly (ES Module compatible)
main();

export { makeDeposit };
