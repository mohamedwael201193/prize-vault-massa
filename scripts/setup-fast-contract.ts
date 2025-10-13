import {
    Account,
    Args,
    JsonRpcProvider,
    Mas,
    SmartContract,
} from '@massalabs/massa-web3';

const PRIVATE_KEY = "S1fJZjjH82tEmKxjrXB8mT1op4RJALfddeXLeuPEmAUT3UHRVZV";
const CONTRACT_ADDRESS = "AS13fFdTwt9zEg6mpZeDqip9xUJnYopfByNUCTX8ZLRPJfzHzJkm";

async function setupNewContract() {
  try {
    console.log("🚀 Setting up new fast contract...");
    
    const account = await Account.fromPrivateKey(PRIVATE_KEY);
    const provider = JsonRpcProvider.buildnet(account);
    const contract = new SmartContract(provider, CONTRACT_ADDRESS);
    
    console.log("Deployer address:", account.address.toString());
    console.log("Contract address:", CONTRACT_ADDRESS);

    // 1. Seed the scheduler first
    console.log("\n⛽ Seeding scheduler with gas money...");
    const seedResult = await contract.call(
      "seedScheduler", 
      new Args(), 
      { coins: Mas.fromString("0.5") }
    );
    console.log("✅ Scheduler seeded:", seedResult.id);
    
    // Wait for confirmation
    await new Promise(resolve => setTimeout(resolve, 5000));

    // 2. Fund the prize pool
    console.log("\n💰 Funding prize pool with 50 MAS...");
    const fundResult = await contract.call(
      "fundPrizePool", 
      new Args(), 
      { coins: Mas.fromString("50") }
    );
    console.log("✅ Prize pool funded:", fundResult.id);
    
    // Wait for confirmation
    await new Promise(resolve => setTimeout(resolve, 5000));

    // 3. Make a deposit to become eligible
    console.log("\n🏦 Making deposit of 5 MAS...");
    const depositResult = await contract.call(
      "deposit", 
      new Args(), 
      { coins: Mas.fromString("5") }
    );
    console.log("✅ Deposit made:", depositResult.id);
    
    // Wait for confirmation
    await new Promise(resolve => setTimeout(resolve, 8000));

    // 4. Check final stats
    console.log("\n📊 Final vault status:");
    const statsResult = await contract.read("getVaultStats");
    const stats = JSON.parse(new TextDecoder().decode(statsResult.value));
    
    console.log("- Prize Pool:", (Number(stats.prizePool) / 1e9).toFixed(6), "MAS");
    console.log("- TVL:", (Number(stats.tvl) / 1e9).toFixed(6), "MAS");
    console.log("- Participants:", stats.participants);
    console.log("- Next Draw Period:", stats.nextDrawPeriod);
    console.log("- Min threshold:", (Number(stats.minPrizeThreshold) / 1e9).toFixed(6), "MAS");

    // Get current period
    const nodeStatus = await provider.getNodeStatus();
    const currentPeriod = nodeStatus.lastSlot?.period || 0;
    console.log("- Current Period:", currentPeriod);
    console.log("- Periods until draw:", Number(stats.nextDrawPeriod) - Number(currentPeriod));
    
    if (Number(stats.prizePool) >= Number(stats.minPrizeThreshold)) {
      console.log("\n🎉 CONTRACT READY FOR DRAWS!");
      console.log("Prize pool is sufficient, draws will happen automatically!");
    }

    return CONTRACT_ADDRESS;

  } catch (error) {
    console.error("❌ Setup failed:", error);
    throw error;
  }
}

setupNewContract()
  .then((address) => {
    console.log(`\n✅ SETUP COMPLETE! Contract: ${address}`);
    console.log("🎯 Now wait for autonomous draws every ~48 seconds!");
  })
  .catch((error) => {
    console.error("Setup failed!");
    process.exit(1);
  });