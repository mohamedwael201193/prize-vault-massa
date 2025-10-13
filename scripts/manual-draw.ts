import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract
} from '@massalabs/massa-web3';

const PRIVATE_KEY = "S1fJZjjH82tEmKxjrXB8mT1op4RJALfddeXLeuPEmAUT3UHRVZV";
const FAST_CONTRACT = "AS1fkzaT3tmVTdXBp1wF5dNitR9mJBW2aP3oAHgyww4KTX74r2GX";

async function manualDraw() {
  const account = await Account.fromPrivateKey(PRIVATE_KEY);
  const provider = JsonRpcProvider.buildnet(account);
  const contract = new SmartContract(provider, FAST_CONTRACT);
  
  console.log("🎯 MANUAL DRAW TRIGGER FOR DEMO");
  console.log("===============================");

  // Check status
  const stats = await contract.read("getVaultStats");
  const statsJson = JSON.parse(new TextDecoder().decode(stats.value));
  
  console.log("Prize pool:", (Number(statsJson.prizePool) / 1e9).toFixed(6), "MAS");
  console.log("TVL:", (Number(statsJson.tvl) / 1e9).toFixed(6), "MAS"); 
  console.log("Participants:", statsJson.participants);

  console.log("\n🎯 Triggering draw...");
  const tickResult = await contract.call("tick", new Args());
  console.log("✅ Draw triggered! Op:", tickResult.id);
  
  await new Promise(resolve => setTimeout(resolve, 15000));
  
  // Check winners
  const winnersResult = await contract.read("getWinners", new Args().addU64(0n).addU64(10n));
  const winners = JSON.parse(new TextDecoder().decode(winnersResult.value));
  
  if (winners.length > 0) {
    console.log("\n🎉 WINNERS FOUND:");
    for (const winner of winners) {
      console.log(`🏆 Period ${winner.period}: ${winner.winner} won ${(Number(winner.prize) / 1e9).toFixed(6)} MAS!`);
    }
  }
  
  // Show events
  const events = await provider.getEvents({ smartContractAddress: FAST_CONTRACT });
  console.log("\n📜 Recent Events:");
  const recent = events.slice(-8);
  for (const event of recent) {
    console.log(`- ${event.data}`);
  }

  console.log("\n✅ DRAW COMPLETE! Check events above for results.");
}

manualDraw().catch(console.error);