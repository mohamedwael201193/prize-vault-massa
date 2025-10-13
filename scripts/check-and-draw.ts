import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract,
} from '@massalabs/massa-web3';

const PRIVATE_KEY = "S1fJZjjH82tEmKxjrXB8mT1op4RJALfddeXLeuPEmAUT3UHRVZV";
const CONTRACT_ADDRESS = "AS13fFdTwt9zEg6mpZeDqip9xUJnYopfByNUCTX8ZLRPJfzHzJkm";

async function checkStatus() {
  const account = await Account.fromPrivateKey(PRIVATE_KEY);
  const provider = JsonRpcProvider.buildnet(account);
  const contract = new SmartContract(provider, CONTRACT_ADDRESS);
  
  const nodeStatus = await provider.getNodeStatus();
  const currentPeriod = nodeStatus.lastSlot?.period || 0;
  
  const statsResult = await contract.read("getVaultStats");
  const stats = JSON.parse(new TextDecoder().decode(statsResult.value));
  
  console.log("📊 Status Check:");
  console.log("- Current period:", currentPeriod);
  console.log("- Next draw period:", stats.nextDrawPeriod);
  console.log("- Periods until draw:", Number(stats.nextDrawPeriod) - Number(currentPeriod));
  console.log("- Prize pool:", (Number(stats.prizePool) / 1e9).toFixed(6), "MAS");
  console.log("- Participants:", stats.participants);
  console.log("- Winner count:", stats.winnerCount);
  
  if (Number(currentPeriod) >= Number(stats.nextDrawPeriod)) {
    console.log("\n🎯 Draw period reached! Forcing draw...");
    const result = await contract.call("tick", new Args());
    console.log("Tick called:", result.id);
    
    await new Promise(resolve => setTimeout(resolve, 10000));
    
    const newStatsResult = await contract.read("getVaultStats");
    const newStats = JSON.parse(new TextDecoder().decode(newStatsResult.value));
    console.log("\n📊 After tick:");
    console.log("- New prize pool:", (Number(newStats.prizePool) / 1e9).toFixed(6), "MAS");
    console.log("- New winner count:", newStats.winnerCount);
    console.log("- Next draw:", newStats.nextDrawPeriod);
    
    const winnersResult = await contract.read("getWinners", new Args().addU64(0n).addU64(5n));
    const winners = JSON.parse(new TextDecoder().decode(winnersResult.value));
    console.log("\n🏆 Winners:", winners.length);
    for (const winner of winners) {
      console.log(`- Period ${winner.period}: ${winner.winner.slice(0,20)}... won ${(Number(winner.prize) / 1e9).toFixed(3)} MAS`);
    }
  } else {
    console.log("\n⏳ Not time for draw yet");
  }
}

checkStatus();