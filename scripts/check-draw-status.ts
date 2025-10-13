import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract
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
  const envContent = fs.readFileSync(envPath, "utf-8");
  const match = envContent.match(/FUNDABLE_VAULT_ADDR=(.+)/);
  return match![1].trim();
}

async function checkDrawStatus() {
  try {
    console.log("🔍 Checking draw status and triggering if needed...");
    
    const account = await Account.fromPrivateKey(PRIVATE_KEY);
    const provider = JsonRpcProvider.buildnet(account);
    const contractAddress = getContractAddress();
    const contract = new SmartContract(provider, contractAddress);

    // Get current blockchain period  
    const nodeStatus = await provider.getNodeStatus();
    const currentPeriod = nodeStatus.lastSlot?.period || 0;
    
    console.log("Current period:", currentPeriod);

    // Get vault stats
    const statsResult = await contract.read("getVaultStats");
    const stats = JSON.parse(new TextDecoder().decode(statsResult.value));
    
    console.log("\n📊 Current Vault Status:");
    console.log("- Prize Pool:", (Number(stats.prizePool) / 1e9).toFixed(6), "MAS");
    console.log("- TVL:", (Number(stats.tvl) / 1e9).toFixed(6), "MAS");
    console.log("- Participants:", stats.participants);
    console.log("- Next Draw Period:", stats.nextDrawPeriod);
    console.log("- Periods until draw:", Number(stats.nextDrawPeriod) - Number(currentPeriod));
    
    // Check if draw should happen now
    if (Number(currentPeriod) >= Number(stats.nextDrawPeriod)) {
      console.log("\n🎯 Draw period reached! Triggering draw...");
      
      // Call tick to trigger the draw
      try {
        const tickResult = await contract.call("tick", new Args());
        console.log("✅ Tick called, draw should be triggered!");
        console.log("Operation ID:", tickResult.id);
        
        // Wait for processing
        await new Promise(resolve => setTimeout(resolve, 10000));
        
        // Check for winners
        const winnersResult = await contract.read("getWinners", new Args().addU64(0n).addU64(10n));
        const winners = JSON.parse(new TextDecoder().decode(winnersResult.value));
        
        console.log("\n🏆 Recent Winners:");
        if (winners.length > 0) {
          for (const winner of winners) {
            console.log(`- Period ${winner.period}: ${winner.winner} won ${(Number(winner.prize) / 1e9).toFixed(6)} MAS`);
          }
        } else {
          console.log("- No winners yet");
        }
        
      } catch (error) {
        console.log("❌ Failed to trigger draw:", error);
      }
    } else {
      console.log(`\n⏳ Waiting for draw period. ${Number(stats.nextDrawPeriod) - Number(currentPeriod)} periods remaining.`);
    }

    // Get recent events
    console.log("\n📜 Recent Events:");
    try {
      const events = await provider.getEvents({
        smartContractAddress: contractAddress,
      });
      
      const recentEvents = events.slice(-8);
      for (const event of recentEvents) {
        console.log(`- ${event.data}`);
      }
    } catch (error) {
      console.log("Could not fetch events");
    }

  } catch (error) {
    console.error("❌ Check failed:", error);
  }
}

checkDrawStatus();