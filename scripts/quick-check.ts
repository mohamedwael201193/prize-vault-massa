import { Args, JsonRpcProvider, PublicAPI, SmartContract } from '@massalabs/massa-web3';

async function quickCheck() {
  console.log('🔍 Quick AutoPrize Vault Check...\n');

  const RPC_URL = "https://buildnet.massa.net/api/v2";
  const CONTRACT_ADDRESS = "AS13fFdTwt9zEg6mpZeDqip9xUJnYopfByNUCTX8ZLRPJfzHzJkm";

  try {
    const publicApi = new PublicAPI(RPC_URL);
    const provider = new JsonRpcProvider(publicApi);
    const contract = new SmartContract(provider, CONTRACT_ADDRESS);

    console.log(`📋 Checking contract: ${CONTRACT_ADDRESS}\n`);

    // Check vault stats
    try {
      const statsResult = await contract.read('getVaultStats', new Args());
      const statsJson = statsResult.returnValue;
      const statsData = JSON.parse(statsJson);
      
      console.log('📊 Current Vault Stats:');
      console.log(`   TVL: ${(Number(statsData.tvl) / 1e9).toFixed(2)} MAS`);
      console.log(`   Prize Pool: ${(Number(statsData.prizePool) / 1e9).toFixed(2)} MAS`);
      console.log(`   Participants: ${statsData.participants}`);
      console.log(`   Draw Count: ${statsData.drawCount}`);
      console.log(`   Next Draw Period: ${statsData.nextDrawPeriod}`);
      console.log(`   Draw Periods Interval: ${statsData.drawPeriods}`);
      console.log(`   Last Draw Period: ${statsData.lastDrawPeriod}\n`);

      // Check if draws stopped
      const drawCount = Number(statsData.drawCount);
      if (drawCount >= 100) {
        console.log('⚠️  ISSUE FOUND: Draws stopped at 100+');
        
        // Check last few draws
        console.log('🔍 Checking recent draws:');
        for (let i = Math.max(0, drawCount - 5); i < drawCount; i++) {
          try {
            const drawArgs = new Args().addU64(BigInt(i));
            const drawResult = await contract.read('getDraw', drawArgs);
            const drawData = JSON.parse(drawResult.returnValue);
            console.log(`   Draw ${i}: Winner ${drawData.winner.slice(0,8)}... Prize: ${(Number(drawData.prize) / 1e9).toFixed(3)} MAS`);
          } catch (e) {
            console.log(`   Draw ${i}: Error reading draw`);
          }
        }
      }

      // Check current network period
      const nodeStatus = await provider.getNodeStatus();
      const currentPeriod = nodeStatus.last_slot?.period || 0;
      console.log(`⏰ Current Network Period: ${currentPeriod}`);
      console.log(`📅 Next Expected Draw: Period ${statsData.nextDrawPeriod}`);
      
      if (currentPeriod >= statsData.nextDrawPeriod) {
        console.log('🚨 ISSUE: Current period >= next draw period but no new draw!');
        console.log('   The autonomous system may have stopped or encountered an error.');
      }

    } catch (error) {
      console.error('❌ Failed to read vault stats:', error);
    }

  } catch (error) {
    console.error('❌ Connection failed:', error);
  }
}

quickCheck().catch(console.error);