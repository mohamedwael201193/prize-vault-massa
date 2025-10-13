import {
    Account,
    Args,
    JsonRpcProvider,
    Mas,
    SmartContract,
} from '@massalabs/massa-web3';

const PRIVATE_KEY = "S1fJZjjH82tEmKxjrXB8mT1op4RJALfddeXLeuPEmAUT3UHRVZV";
const FAST_CONTRACT = "AS1fkzaT3tmVTdXBp1wF5dNitR9mJBW2aP3oAHgyww4KTX74r2GX";

async function quickSetup() {
  const account = await Account.fromPrivateKey(PRIVATE_KEY);
  const provider = JsonRpcProvider.buildnet(account);
  const contract = new SmartContract(provider, FAST_CONTRACT);
  
  console.log("🚀 FAST SETUP - Fund + Deposit + Wait for Draw");
  console.log("===============================================");

  // Step 1: Fund prize pool
  console.log("\n💰 Step 1: Funding prize pool with 50 MAS...");
  const fundResult = await contract.call("fundPrizePool", new Args(), { coins: Mas.fromString("50") });
  console.log("✅ Prize pool funded! Op:", fundResult.id);

  await new Promise(resolve => setTimeout(resolve, 3000));

  // Step 2: Make deposit  
  console.log("\n🏦 Step 2: Making 5 MAS deposit...");
  const depositResult = await contract.call("deposit", new Args(), { coins: Mas.fromString("5") });
  console.log("✅ Deposit made! Op:", depositResult.id);

  await new Promise(resolve => setTimeout(resolve, 3000));

  // Step 3: Check status and wait for draw
  console.log("\n📊 Step 3: Checking vault status...");
  const stats = await contract.read("getVaultStats");
  const statsJson = JSON.parse(new TextDecoder().decode(stats.value));
  
  const nodeStatus = await provider.getNodeStatus();
  const currentPeriod = nodeStatus.lastSlot?.period || 0;
  const nextDraw = Number(statsJson.nextDrawPeriod);
  const periodsLeft = nextDraw - currentPeriod;
  
  console.log("Current period:", currentPeriod);
  console.log("Next draw period:", nextDraw);
  console.log("Periods until draw:", periodsLeft);
  console.log("Prize pool:", (Number(statsJson.prizePool) / 1e9).toFixed(6), "MAS");
  console.log("TVL:", (Number(statsJson.tvl) / 1e9).toFixed(6), "MAS");
  console.log("Participants:", statsJson.participants);

  if (periodsLeft <= 0) {
    console.log("\n🎯 Draw period reached! Triggering draw...");
    const tickResult = await contract.call("tick", new Args());
    console.log("✅ Draw triggered! Op:", tickResult.id);
    
    await new Promise(resolve => setTimeout(resolve, 8000));
    
    // Check for winners
    const winners = await contract.read("getWinners", new Args().addU64(0n).addU64(5n));
    const winnersJson = JSON.parse(new TextDecoder().decode(winners.value));
    
    console.log("\n🏆 WINNERS:");
    if (winnersJson.length > 0) {
      for (const winner of winnersJson) {
        console.log(`🎉 Period ${winner.period}: ${winner.winner} won ${(Number(winner.prize) / 1e9).toFixed(6)} MAS!`);
      }
    } else {
      console.log("No winners yet - checking events...");
    }
  } else {
    console.log(`\n⏳ Waiting ${periodsLeft} periods for draw (~${periodsLeft * 16} seconds)`);
    console.log("The autonomous system will trigger the draw automatically!");
  }

  // Show recent events
  console.log("\n📜 Recent Events:");
  const events = await provider.getEvents({ smartContractAddress: FAST_CONTRACT });
  const recent = events.slice(-5);
  for (const event of recent) {
    console.log(`- ${event.data}`);
  }

  console.log("\n✅ SETUP COMPLETE!");
  console.log("Contract:", FAST_CONTRACT);
  console.log("Check back in ~1 minute for automatic draw results!");
}

quickSetup().catch(console.error);