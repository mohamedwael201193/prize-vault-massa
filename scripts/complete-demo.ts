import {
    Account,
    Args,
    JsonRpcProvider,
    Mas,
    SmartContract,
} from '@massalabs/massa-web3';

const PRIVATE_KEY = "S1fJZjjH82tEmKxjrXB8mT1op4RJALfddeXLeuPEmAUT3UHRVZV";
const FAST_CONTRACT = "AS1fkzaT3tmVTdXBp1wF5dNitR9mJBW2aP3oAHgyww4KTX74r2GX";

async function fullSetup() {
  const account = await Account.fromPrivateKey(PRIVATE_KEY);
  const provider = JsonRpcProvider.buildnet(account);
  const contract = new SmartContract(provider, FAST_CONTRACT);
  
  console.log("⚡ COMPLETE FAST SETUP - All Steps");
  console.log("==================================");

  // Fund scheduler first for gas
  console.log("\n⛽ Funding scheduler with gas...");
  const seedResult = await contract.call("seedScheduler", new Args(), { coins: Mas.fromString("1") });
  console.log("✅ Scheduler funded! Op:", seedResult.id);
  await new Promise(resolve => setTimeout(resolve, 5000));

  // Fund prize pool
  console.log("\n💰 Funding prize pool with 50 MAS...");
  const fundResult = await contract.call("fundPrizePool", new Args(), { coins: Mas.fromString("50") });
  console.log("✅ Prize pool funded! Op:", fundResult.id);
  await new Promise(resolve => setTimeout(resolve, 5000));

  // Make deposit  
  console.log("\n🏦 Making 5 MAS deposit...");
  const depositResult = await contract.call("deposit", new Args(), { coins: Mas.fromString("5") });
  console.log("✅ Deposit made! Op:", depositResult.id);
  await new Promise(resolve => setTimeout(resolve, 8000));

  // Check final status
  console.log("\n📊 Final vault status...");
  try {
    const stats = await contract.read("getVaultStats");
    const statsJson = JSON.parse(new TextDecoder().decode(stats.value));
    
    console.log("Prize pool:", (Number(statsJson.prizePool) / 1e9).toFixed(6), "MAS");
    console.log("TVL:", (Number(statsJson.tvl) / 1e9).toFixed(6), "MAS");
    console.log("Participants:", statsJson.participants);
    console.log("Next draw:", statsJson.nextDrawPeriod);
    
    const nodeStatus = await provider.getNodeStatus();
    const currentPeriod = nodeStatus.lastSlot?.period || 0;
    console.log("Current period:", currentPeriod);
    
    // Wait for autonomous draw
    console.log("\n⏳ Waiting for autonomous draw system...");
    let attempts = 0;
    while (attempts < 10) {
      await new Promise(resolve => setTimeout(resolve, 20000)); // Wait 20 seconds
      attempts++;
      
      console.log(`\n🔄 Check ${attempts}/10 - Looking for winners...`);
      
      try {
        const winners = await contract.read("getWinners", new Args().addU64(0n).addU64(10n));
        const winnersJson = JSON.parse(new TextDecoder().decode(winners.value));
        
        if (winnersJson.length > 0) {
          console.log("\n🎉 WINNERS FOUND!");
          for (const winner of winnersJson) {
            console.log(`🏆 Period ${winner.period}: ${winner.winner} won ${(Number(winner.prize) / 1e9).toFixed(6)} MAS!`);
          }
          break;
        } else {
          console.log("No winners yet, waiting for autonomous draw...");
        }
        
        // Show events
        const events = await provider.getEvents({ smartContractAddress: FAST_CONTRACT });
        const recent = events.slice(-3);
        console.log("Recent events:");
        for (const event of recent) {
          console.log(`  - ${event.data}`);
        }
        
      } catch (error) {
        console.log("Error checking winners:", error);
      }
    }
    
  } catch (error) {
    console.log("Error reading stats:", error);
  }

  console.log("\n✅ DEMO SETUP COMPLETE!");
  console.log("Contract Address:", FAST_CONTRACT);
  console.log("The autonomous system is now running!");
}

fullSetup().catch(console.error);