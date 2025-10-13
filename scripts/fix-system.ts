#!/usr/bin/env npx tsx

import {
    Args,
    JsonRpcProvider,
    ProviderType,
    SmartContract,
    getAccount
} from '@massalabs/massa-web3';
import * as dotenv from 'dotenv';

// Load environment variables
dotenv.config({ path: '../.env' });

async function restartAutonomousSystem() {
  try {
    console.log('🔄 Restarting AutoPrize Vault Autonomous System...\n');

    const privateKey = process.env.PRIVATE_KEY;
    const contractAddress = process.env.VITE_VAULT_ADDRESS || "AS13fFdTwt9zEg6mpZeDqip9xUJnYopfByNUCTX8ZLRPJfzHzJkm";
    const rpcUrl = "https://buildnet.massa.net/api/v2";

    if (!privateKey) {
      console.error('❌ Missing PRIVATE_KEY in environment');
      process.exit(1);
    }

    console.log(`📋 Contract: ${contractAddress}`);
    console.log(`📡 RPC: ${rpcUrl}\n`);

    // Setup connection
    const provider = new JsonRpcProvider([{ url: rpcUrl, type: ProviderType.PUBLIC }]);
    const account = await getAccount(privateKey, provider);
    const contract = new SmartContract(provider, contractAddress);

    // 1. Check current status
    console.log('📊 Checking current vault status...');
    const statsResult = await contract.read('getVaultStats', new Args());
    const statsString = Array.isArray(statsResult) ? statsResult.join('') : String(statsResult);
    const stats = JSON.parse(statsString || '{}');
    
    console.log(`   Prize Pool: ${(Number(stats.prizePool || 0) / 1e9).toFixed(2)} MAS`);
    console.log(`   Draw Count: ${stats.drawCount || 0}`);
    console.log(`   Next Draw Period: ${stats.nextDrawPeriod || 0}`);
    console.log(`   Tick Periods: ${stats.tickPeriods || 0}`);

    // 2. Get current network period  
    const nodeStatus = await provider.getNodeStatus();
    const currentPeriod = nodeStatus.last_slot?.period || 0;
    console.log(`   Current Period: ${currentPeriod}\n`);

    // 3. Check if draws are stuck
    const nextDrawPeriod = Number(stats.nextDrawPeriod || 0);
    if (currentPeriod >= nextDrawPeriod) {
      console.log('🚨 Draws appear to be stuck! Current period >= next draw period');
      
      // Manual trigger draw
      console.log('🎯 Manually triggering draw...');
      try {
        const drawTx = await account.callSC({
          targetAddress: contractAddress,
          functionName: 'tick',
          parameter: new Args(),
          fee: 10000000n, // 0.01 MAS
          maxGas: 3000000,
        });
        
        console.log(`✅ Draw transaction sent: ${drawTx}`);
        console.log('   Waiting for confirmation...');
        
        // Wait for the transaction to be processed
        await new Promise(resolve => setTimeout(resolve, 5000));
        
      } catch (error) {
        console.error('❌ Failed to trigger manual draw:', error);
      }
    }

    // 4. Add more prize pool funds if needed
    const prizePool = Number(stats.prizePool || 0);
    const minThreshold = Number(stats.minPrizeThreshold || 100000000); // 0.1 MAS default
    
    if (prizePool < minThreshold * 20) { // If less than 20x minimum threshold
      console.log('💰 Adding more funds to prize pool...');
      const fundAmount = 10000000000n; // 10 MAS
      
      try {
        const fundTx = await account.callSC({
          targetAddress: contractAddress,
          functionName: 'fundPrizePool',
          parameter: new Args(),
          fee: 10000000n, // 0.01 MAS
          maxGas: 2000000,
          coins: fundAmount,
        });
        
        console.log(`✅ Funding transaction sent: ${fundTx}`);
        console.log(`   Added ${Number(fundAmount) / 1e9} MAS to prize pool`);
        
        // Wait for funding to process
        await new Promise(resolve => setTimeout(resolve, 3000));
        
      } catch (error) {
        console.error('❌ Failed to fund prize pool:', error);
      }
    }

    // 5. Verify system is working
    console.log('\n🔍 Verifying system restart...');
    await new Promise(resolve => setTimeout(resolve, 3000));
    
    const newStatsResult = await contract.read('getVaultStats', new Args());
    const newStatsString = Array.isArray(newStatsResult) ? newStatsResult.join('') : String(newStatsResult);
    const newStats = JSON.parse(newStatsString || '{}');
    
    console.log('📈 Updated Status:');
    console.log(`   Prize Pool: ${(Number(newStats.prizePool || 0) / 1e9).toFixed(2)} MAS`);
    console.log(`   Draw Count: ${newStats.drawCount || 0}`);
    console.log(`   Next Draw Period: ${newStats.nextDrawPeriod || 0}`);
    
    const drawCountDiff = Number(newStats.drawCount || 0) - Number(stats.drawCount || 0);
    if (drawCountDiff > 0) {
      console.log(`✅ System restarted successfully! ${drawCountDiff} new draw(s) completed.`);
    } else if (Number(newStats.nextDrawPeriod || 0) > nextDrawPeriod) {
      console.log('✅ System appears to be working - next draw period updated.');
    } else {
      console.log('⚠️  System may still have issues - monitor manually.');
    }

    console.log('\n🎯 System restart completed!');
    console.log('📝 Recommendations:');
    console.log('   1. Monitor the frontend for new draws appearing');
    console.log('   2. Check that TVL persists after page reload'); 
    console.log('   3. Verify DeWeb deployment shows updated data');

  } catch (error) {
    console.error('❌ Restart failed:', error);
    process.exit(1);
  }
}

restartAutonomousSystem().catch(console.error);