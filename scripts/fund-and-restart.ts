import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract,
} from '@massalabs/massa-web3';
import * as dotenv from 'dotenv';

dotenv.config();

async function addPrizeFunding() {
  console.log('💰 Adding funds to prize pool...\n');

  try {
    const privateKey = process.env.PRIVATE_KEY;
    if (!privateKey) {
      console.error('Missing PRIVATE_KEY environment variable');
      process.exit(1);
    }

    // Use the correct current contract address
    const contractAddress = "AS13fFdTwt9zEg6mpZeDqip9xUJnYopfByNUCTX8ZLRPJfzHzJkm";
    console.log(`📋 Contract: ${contractAddress}`);

    // Create account and provider
    const account = await Account.fromEnv('PRIVATE_KEY');
    const provider = JsonRpcProvider.buildnet(account);
    const contract = new SmartContract(provider, contractAddress);

    // Check current prize pool
    console.log('📊 Checking current status...');
    try {
      const statsResult = await contract.read('getVaultStats', new Args());
      console.log('Raw result:', statsResult);
      // Handle different result formats
      let statsString = '';
      if (typeof statsResult === 'string') {
        statsString = statsResult;
      } else if (Array.isArray(statsResult)) {
        statsString = statsResult.join('');
      } else if (statsResult && typeof statsResult === 'object') {
        if ('value' in statsResult && statsResult.value instanceof Uint8Array) {
          // Convert Uint8Array to string
          statsString = new TextDecoder().decode(statsResult.value);
        } else if ('returnValue' in statsResult) {
          statsString = String(statsResult.returnValue);
        } else {
          statsString = String(statsResult);
        }
      } else {
        statsString = String(statsResult);
      }
      
      const stats = JSON.parse(statsString);
      console.log(`   Prize Pool: ${(Number(stats.prizePool) / 1e9).toFixed(2)} MAS`);
      console.log(`   Draw Count: ${stats.drawCount}`);
    } catch (e) {
      console.log('   Could not parse stats, continuing anyway...');
    }

    // Add 20 MAS to prize pool
    const fundAmount = 20_000_000_000n; // 20 MAS
    console.log(`\n💵 Adding ${Number(fundAmount) / 1e9} MAS to prize pool...`);
    
    const txId = await contract.call('fundPrizePool', new Args(), {
      coins: fundAmount,
      fee: 10_000_000n, // 0.01 MAS
      maxGas: 3_500_000n, // Increased gas limit
    });

    console.log(`✅ Funding transaction sent: ${txId}`);
    console.log(`🔗 Check: https://buildnet-explorer.massa.net/operation/${txId}`);

    // Wait and verify
    console.log('\n⏳ Waiting 5 seconds...');
    await new Promise(resolve => setTimeout(resolve, 5000));

    try {
      const newStatsResult = await contract.read('getVaultStats', new Args());
      let newStatsString = '';
      if (typeof newStatsResult === 'string') {
        newStatsString = newStatsResult;
      } else if (Array.isArray(newStatsResult)) {
        newStatsString = newStatsResult.join('');
      } else {
        newStatsString = String(newStatsResult);
      }
      
      const newStats = JSON.parse(newStatsString);
      console.log('📈 Updated Status:');
      console.log(`   Prize Pool: ${(Number(newStats.prizePool) / 1e9).toFixed(2)} MAS`);
      console.log(`   Draw Count: ${newStats.drawCount}`);
    } catch (e) {
      console.log('📈 Status updated (could not read exact values)');
    }

    // Trigger a draw if possible
    console.log('\n🎯 Triggering draw...');
    const drawTx = await contract.call('tick', new Args(), {
      fee: 10_000_000n,
      maxGas: 3_000_000n,
    });
    console.log(`✅ Draw triggered: ${drawTx}`);

    console.log('\n🎉 Prize pool funded and system restarted!');
    console.log('   The autonomous system should now continue drawing regularly.');

  } catch (error) {
    console.error('❌ Error:', error);
    process.exit(1);
  }
}

addPrizeFunding().catch(console.error);