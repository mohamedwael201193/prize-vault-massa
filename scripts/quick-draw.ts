import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract
} from '@massalabs/massa-web3';

const PRIVATE_KEY = "S1fJZjjH82tEmKxjrXB8mT1op4RJALfddeXLeuPEmAUT3UHRVZV";
const CONTRACT_ADDRESS = "AS13fFdTwt9zEg6mpZeDqip9xUJnYopfByNUCTX8ZLRPJfzHzJkm";

async function quickDraw() {
  const account = await Account.fromPrivateKey(PRIVATE_KEY);
  const provider = JsonRpcProvider.buildnet(account);
  const contract = new SmartContract(provider, CONTRACT_ADDRESS);
  
  console.log("🎯 Manual draw trigger...");
  
  try {
    const result = await contract.call("tick", new Args());
    console.log("✅ Tick result:", result.id);
    
    await new Promise(resolve => setTimeout(resolve, 8000));
    
    const winnersResult = await contract.read("getWinners", new Args().addU64(0n).addU64(5n));
    const winners = JSON.parse(new TextDecoder().decode(winnersResult.value));
    
    console.log("🏆 Winners:", winners.length);
    for (const winner of winners) {
      console.log(`- ${winner.winner} won ${(Number(winner.prize) / 1e9).toFixed(3)} MAS`);
    }
    
    const statsResult = await contract.read("getVaultStats");
    const stats = JSON.parse(new TextDecoder().decode(statsResult.value));
    console.log("💰 Prize pool now:", (Number(stats.prizePool) / 1e9).toFixed(3), "MAS");
    
  } catch (error) {
    console.error("Error:", error);
  }
}

quickDraw();