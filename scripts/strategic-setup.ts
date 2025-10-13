import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract,
} from '@massalabs/massa-web3';
import * as dotenv from 'dotenv';

// Load environment variables from parent directory
dotenv.config({ path: '../.env.local' });

async function strategicDrawSetup() {
  if (!process.env.SECRET_KEY && !process.env.PRIVATE_KEY) {
    console.error('Missing SECRET_KEY or PRIVATE_KEY environment variable');
    process.exit(1);
  }

  console.log('🎯 STRATEGIC APPROACH: Making draws happen NOW!\n');

  const account = await Account.fromEnv();
  console.log(`📋 Using account: ${account.address}`);
  
  const provider = JsonRpcProvider.buildnet(account);
  const vaultAddr = process.env.VAULT_ADDR || 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';
  console.log(`🏦 Vault contract: ${vaultAddr}\n`);

  try {
    const contract = new SmartContract(provider, vaultAddr);
    
    console.log('📊 Current vault analysis...');
    const statsResult = await contract.read('getVaultStats');
    const stats = JSON.parse(new TextDecoder().decode(statsResult.value));
    
    const tvl = Number(stats.tvl) / 1e9;
    const prizePool = Number(stats.prizePool) / 1e9;
    const minThreshold = Number(stats.minPrizeThreshold) / 1e9;
    const participants = Number(stats.participants);
    
    console.log(`   TVL: ${tvl} MAS`);
    console.log(`   Prize Pool: ${prizePool} MAS`);
    console.log(`   Min Threshold: ${minThreshold} MAS`);
    console.log(`   Participants: ${participants}`);
    
    // STRATEGY 1: Multiple strategic deposits to trigger different contract paths
    console.log('\n🎲 STRATEGY 1: Multiple deposits to trigger autonomous systems...');
    
    // Make several small deposits to trigger more activity
    console.log('   Making multiple small deposits to increase vault activity...');
    
    for (let i = 0; i < 3; i++) {
      const smallDeposit = 100000000n; // 0.1 MAS each
      console.log(`   Deposit ${i+1}/3: 0.1 MAS...`);
      
      const depositOpId = await contract.call(
        'deposit', 
        new Args(),
        { coins: smallDeposit }
      );
      console.log(`     ✅ Sent: ${depositOpId}`);
      
      // Short wait between deposits
      await new Promise(resolve => setTimeout(resolve, 5000));
    }
    
    console.log('\n⏳ Waiting for all deposits to confirm...');
    await new Promise(resolve => setTimeout(resolve, 15000));
    
    // STRATEGY 2: Multiple scheduler funding to ensure gas availability
    console.log('\n⛽ STRATEGY 2: Ensuring scheduler has plenty of gas...');
    
    const schedulerFund = 1000000000n; // 1 MAS for scheduler
    console.log('   Adding substantial scheduler funding...');
    
    const seedOpId = await contract.call(
      'seedScheduler',
      new Args(),
      { coins: schedulerFund }
    );
    console.log(`   ✅ Scheduler funded: ${seedOpId}`);
    
    await new Promise(resolve => setTimeout(resolve, 10000));
    
    // STRATEGY 3: Multiple tick calls to trigger potential yield accumulation
    console.log('\n🔄 STRATEGY 3: Multiple autonomous ticks...');
    
    for (let i = 0; i < 5; i++) {
      console.log(`   Tick ${i+1}/5...`);
      
      try {
        const tickOpId = await contract.call('tick', new Args());
        console.log(`     ✅ Tick sent: ${tickOpId}`);
        
        // Wait between ticks
        await new Promise(resolve => setTimeout(resolve, 8000));
        
        // Check if anything changed
        const checkStatsResult = await contract.read('getVaultStats');
        const checkStats = JSON.parse(new TextDecoder().decode(checkStatsResult.value));
        
        const newPrizePool = Number(checkStats.prizePool) / 1e9;
        const newWinners = Number(checkStats.winnerCount);
        
        console.log(`     Prize pool: ${newPrizePool} MAS, Winners: ${newWinners}`);
        
        if (newWinners > Number(stats.winnerCount)) {
          console.log('🎉 WINNER DETECTED! Draw successful!');
          break;
        }
        
        if (newPrizePool > prizePool) {
          console.log('💰 Prize pool increased! Autonomous yield working!');
        }
        
      } catch (tickError) {
        console.log(`     ⚠️ Tick ${i+1} failed (normal if conditions not met)`);
      }
    }
    
    // STRATEGY 4: Check if governance conditions changed
    console.log('\n🏛️ STRATEGY 4: Checking governance status...');
    
    const currentStatsResult = await contract.read('getVaultStats');
    const currentStats = JSON.parse(new TextDecoder().decode(currentStatsResult.value));
    
    const currentThreshold = Number(currentStats.minPrizeThreshold) / 1e9;
    const currentPrizePool = Number(currentStats.prizePool) / 1e9;
    const currentWinners = Number(currentStats.winnerCount);
    const originalWinners = Number(stats.winnerCount);
    
    console.log('\n📊 FINAL COMPARISON:');
    console.log(`   Original threshold: ${minThreshold} MAS`);
    console.log(`   Current threshold: ${currentThreshold} MAS`);
    console.log(`   Original prize pool: ${prizePool} MAS`);
    console.log(`   Current prize pool: ${currentPrizePool} MAS`);
    console.log(`   Original winners: ${originalWinners}`);
    console.log(`   Current winners: ${currentWinners}`);
    
    // Results analysis
    console.log('\n🎯 RESULTS ANALYSIS:');
    
    if (currentWinners > originalWinners) {
      console.log('🎉🏆 SUCCESS! NEW WINNER(S) SELECTED!');
      console.log(`   ${currentWinners - originalWinners} new winner(s) added!`);
      
      // Get winner details
      if (currentWinners > 0) {
        console.log('\n🏆 WINNER DETAILS:');
        const winnersArgs = new Args().addU64(BigInt(Math.max(0, currentWinners - 3))).addU64(3n);
        const winnersResult = await contract.read('getWinners', winnersArgs);
        const winners = JSON.parse(new TextDecoder().decode(winnersResult.value));
        
        winners.forEach((winner: any, index: number) => {
          console.log(`   Winner ${index + 1}:`);
          console.log(`     Address: ${winner.winner}`);
          console.log(`     Prize: ${Number(winner.prize) / 1e9} MAS`);
          console.log(`     Period: ${winner.period}`);
          console.log(`     Seed: ${winner.seed}`);
        });
      }
      
    } else if (currentPrizePool > prizePool) {
      console.log('💰 PROGRESS! Prize pool increased, getting closer to draws');
      console.log(`   Prize pool grew by ${currentPrizePool - prizePool} MAS`);
      
      if (currentPrizePool >= currentThreshold) {
        console.log('✅ Prize pool now meets threshold! Draws should happen soon');
      } else {
        console.log(`⏳ Need ${currentThreshold - currentPrizePool} more MAS in prize pool`);
      }
      
    } else if (currentThreshold < minThreshold) {
      console.log('🏛️ GOVERNANCE SUCCESS! Threshold lowered');
      console.log('   Draws will be much easier to trigger now');
      
    } else {
      console.log('⚠️ No changes detected, but setup is progressing');
      console.log('   Autonomous systems may need more time to activate');
    }
    
    // Final recommendations
    console.log('\n💡 NEXT STEPS:');
    console.log('1. Monitor with: npm run check-vault');
    console.log('2. Wait for autonomous draws (check periodically)');
    console.log('3. Try again: npm run strategic-setup');
    
    if (currentPrizePool >= currentThreshold && Number(currentStats.participants) > 0) {
      console.log('4. 🎯 READY FOR MANUAL DRAW: npm run trigger-draw');
    }
    
    console.log('\n🎉 Strategic setup completed!');
    console.log(`📊 Vault now has ${Number(currentStats.tvl) / 1e9} MAS TVL with ${currentStats.participants} participants`);
    
  } catch (error) {
    console.error('❌ Strategic setup failed:', error);
    process.exit(1);
  }
}

strategicDrawSetup().catch(console.error);