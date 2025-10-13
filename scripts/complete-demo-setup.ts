import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract,
} from '@massalabs/massa-web3';
import * as dotenv from 'dotenv';

// Load environment variables from parent directory
dotenv.config({ path: '../.env.local' });

async function setupCompleteDemo() {
  if (!process.env.SECRET_KEY && !process.env.PRIVATE_KEY) {
    console.error('Missing SECRET_KEY or PRIVATE_KEY environment variable');
    process.exit(1);
  }

  console.log('🎉 Setting up COMPLETE AutoPrize Vault Demo...\n');
  console.log('This will make the vault ready for draws with real winners!\n');

  // Create account from secret key
  const account = await Account.fromEnv();
  console.log(`📋 Using account: ${account.address}`);
  
  // Create provider
  const provider = JsonRpcProvider.buildnet(account);

  const vaultAddr = process.env.VAULT_ADDR || 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';
  console.log(`🏦 Vault contract: ${vaultAddr}\n`);

  try {
    const contract = new SmartContract(provider, vaultAddr);
    
    // Step 1: Initial Status Check
    console.log('📊 Step 1: Checking current vault status...');
    let statsResult = await contract.read('getVaultStats');
    let stats = JSON.parse(new TextDecoder().decode(statsResult.value));
    
    console.log(`   TVL: ${Number(stats.tvl) / 1e9} MAS`);
    console.log(`   Prize Pool: ${Number(stats.prizePool) / 1e9} MAS`);
    console.log(`   Participants: ${stats.participants}`);
    console.log(`   Min Prize Threshold: ${Number(stats.minPrizeThreshold) / 1e9} MAS`);
    console.log(`   Winner Count: ${stats.winnerCount}`);
    
    // Step 2: Make sure we're a participant
    console.log('\n💰 Step 2: Ensuring participation...');
    if (Number(stats.participants) === 0 || Number(stats.tvl) === 0) {
      console.log('   Making initial deposit of 5 MAS...');
      const depositAmount = 5n * 1000000000n; // 5 MAS
      
      const depositOpId = await contract.call(
        'deposit',
        new Args(),
        { coins: depositAmount }
      );
      
      console.log(`   ✅ Deposit sent: ${depositOpId}`);
      console.log('   ⏳ Waiting for confirmation...');
      await new Promise(resolve => setTimeout(resolve, 15000));
    } else {
      console.log('   ✅ Vault already has participants');
    }
    
    // Step 3: Fund the scheduler for autonomous operation
    console.log('\n⛽ Step 3: Funding autonomous scheduler...');
    const schedulerAmount = 500000000n; // 0.5 MAS for scheduler
    
    const seedOpId = await contract.call(
      'seedScheduler',
      new Args(),
      { coins: schedulerAmount }
    );
    
    console.log(`   ✅ Scheduler funded: ${seedOpId}`);
    console.log('   ⏳ Waiting for confirmation...');
    await new Promise(resolve => setTimeout(resolve, 10000));
    
    // Step 4: The KEY INSIGHT - Manual Prize Pool Management
    // Since yield is disabled, we need to manually trigger the contract to acknowledge
    // that there's a prize pool available. We'll do this by using governance to lower
    // the minimum threshold, OR by understanding how the contract balance works.
    
    console.log('\n🎯 Step 4: Prize Pool Strategy Analysis...');
    
    // Get updated stats
    statsResult = await contract.read('getVaultStats');
    stats = JSON.parse(new TextDecoder().decode(statsResult.value));
    
    const prizePoolMAS = Number(stats.prizePool) / 1e9;
    const minThresholdMAS = Number(stats.minPrizeThreshold) / 1e9;
    
    console.log(`   Current Prize Pool: ${prizePoolMAS} MAS`);
    console.log(`   Required Threshold: ${minThresholdMAS} MAS`);
    
    if (prizePoolMAS < minThresholdMAS) {
      console.log('\n💡 SOLUTION: Using governance to enable draws');
      console.log('The contract needs either:');
      console.log('1. Prize pool funding (yield generation is disabled)');
      console.log('2. Lower minimum threshold via governance');
      console.log('3. Manual tick() calls to accumulate small amounts');
      
      // Check if we can create a governance proposal
      console.log('\n🗳️ Attempting governance solution...');
      
      try {
        const args = new Args().addString(account.address.toString());
        const positionResult = await contract.read('getUserPosition', args);
        const position = JSON.parse(new TextDecoder().decode(positionResult.value));
        
        const yourShares = Number(position.shares);
        const totalShares = Number(stats.totalShares);
        const requiredShares = totalShares / 100; // 1% minimum
        
        if (yourShares >= requiredShares) {
          console.log('   ✅ You have sufficient shares for governance!');
          console.log(`   Your shares: ${yourShares / 1e9} MAS`);
          console.log(`   Required: ${requiredShares / 1e9} MAS`);
          
          // Create proposal to lower minimum prize threshold
          const newMinPrize = 10000000n; // 0.01 MAS
          console.log(`\n   📝 Creating proposal to lower threshold to ${Number(newMinPrize) / 1e9} MAS...`);
          
          const proposalArgs = new Args()
            .addString('min_prize')
            .addU64(newMinPrize);
          
          const proposalOpId = await contract.call('createProposal', proposalArgs);
          console.log(`   ✅ Proposal created: ${proposalOpId}`);
          
          // Wait for confirmation
          await new Promise(resolve => setTimeout(resolve, 15000));
          
          // Check proposal count
          const newStatsResult = await contract.read('getVaultStats');
          const newStats = JSON.parse(new TextDecoder().decode(newStatsResult.value));
          
          if (Number(newStats.proposalCount) > Number(stats.proposalCount)) {
            const proposalId = BigInt(Number(newStats.proposalCount) - 1);
            console.log(`   ✅ Proposal ${proposalId} created successfully!`);
            
            // Vote YES on the proposal
            console.log('   🗳️ Voting YES on proposal...');
            const voteArgs = new Args()
              .addU64(proposalId)
              .addBool(true);
            
            const voteOpId = await contract.call('voteOnProposal', voteArgs);
            console.log(`   ✅ Vote cast: ${voteOpId}`);
            
            await new Promise(resolve => setTimeout(resolve, 10000));
            
            // Get proposal details
            const proposalArgs2 = new Args().addU64(proposalId);
            const proposalResult = await contract.read('getProposal', proposalArgs2);
            const proposal = JSON.parse(new TextDecoder().decode(proposalResult.value));
            
            console.log('\n   📋 PROPOSAL CREATED:');
            console.log(`      ID: ${proposal.id}`);
            console.log(`      Type: ${proposal.type}`);
            console.log(`      New Value: ${Number(proposal.value) / 1e9} MAS`);
            console.log(`      End Period: ${proposal.endPeriod}`);
            
            // Try to execute if enough votes
            console.log('   ⚡ Attempting to execute proposal...');
            try {
              const executeOpId = await contract.call('executeProposal', new Args().addU64(proposalId));
              console.log(`   ✅ Proposal executed: ${executeOpId}`);
              
              await new Promise(resolve => setTimeout(resolve, 15000));
              
              // Check if threshold was lowered
              const finalStatsResult = await contract.read('getVaultStats');
              const finalStats = JSON.parse(new TextDecoder().decode(finalStatsResult.value));
              
              const newThreshold = Number(finalStats.minPrizeThreshold) / 1e9;
              console.log(`   🎯 New minimum threshold: ${newThreshold} MAS`);
              
              if (newThreshold < minThresholdMAS) {
                console.log('   🎉 SUCCESS! Threshold lowered via governance!');
              }
              
            } catch (executeError) {
              console.log('   ⏳ Proposal created but needs more time/votes to execute');
              console.log('   This is normal - governance has delay periods for safety');
            }
          }
          
        } else {
          console.log('   ❌ Insufficient shares for governance proposal');
          console.log(`   Need ${requiredShares / 1e9} MAS, have ${yourShares / 1e9} MAS`);
        }
        
      } catch (error) {
        console.log('   ⚠️ Could not check governance eligibility');
      }
    }
    
    // Step 5: Alternative Approach - Manual Tick Simulation
    console.log('\n🔄 Step 5: Manual tick to check autonomous system...');
    console.log('Calling tick() to test autonomous operation...');
    
    try {
      const tickOpId = await contract.call('tick', new Args());
      console.log(`   ✅ Manual tick triggered: ${tickOpId}`);
      
      await new Promise(resolve => setTimeout(resolve, 15000));
      
      // Check if anything changed
      const postTickStatsResult = await contract.read('getVaultStats');
      const postTickStats = JSON.parse(new TextDecoder().decode(postTickStatsResult.value));
      
      console.log(`   Post-tick Prize Pool: ${Number(postTickStats.prizePool) / 1e9} MAS`);
      console.log(`   Post-tick Winners: ${postTickStats.winnerCount}`);
      
      if (Number(postTickStats.prizePool) > Number(stats.prizePool)) {
        console.log('   🎉 Prize pool increased! Yield mechanism may be working');
      }
      
      if (Number(postTickStats.winnerCount) > Number(stats.winnerCount)) {
        console.log('   🏆 NEW WINNER! Draw occurred successfully!');
      }
      
    } catch (tickError) {
      console.log('   ⚠️ Manual tick failed - this is expected if conditions not met');
    }
    
    // Step 6: Final Status Report
    console.log('\n📊 Step 6: Final Status Report');
    
    const finalStatsResult = await contract.read('getVaultStats');
    const finalStats = JSON.parse(new TextDecoder().decode(finalStatsResult.value));
    
    console.log('\n🎯 VAULT FINAL STATE:');
    console.log(`   TVL: ${Number(finalStats.tvl) / 1e9} MAS`);
    console.log(`   Prize Pool: ${Number(finalStats.prizePool) / 1e9} MAS`);
    console.log(`   Participants: ${finalStats.participants}`);
    console.log(`   Winners: ${finalStats.winnerCount}`);
    console.log(`   Min Threshold: ${Number(finalStats.minPrizeThreshold) / 1e9} MAS`);
    
    // Step 7: Recommendations
    console.log('\n💡 RECOMMENDATIONS:');
    
    const finalPrizePool = Number(finalStats.prizePool) / 1e9;
    const finalThreshold = Number(finalStats.minPrizeThreshold) / 1e9;
    
    if (finalPrizePool >= finalThreshold && Number(finalStats.participants) > 0) {
      console.log('✅ VAULT IS READY FOR DRAWS!');
      console.log('🎲 Draws should occur automatically via autonomous smart contracts');
      console.log('⏰ Or trigger manually with: npm run trigger-draw');
    } else {
      console.log('⚠️ Vault needs more setup:');
      
      if (finalPrizePool < finalThreshold) {
        console.log(`   - Prize pool (${finalPrizePool} MAS) < threshold (${finalThreshold} MAS)`);
        console.log('   - Wait for autonomous ticks to accumulate yield');
        console.log('   - Or use governance to lower threshold');
      }
      
      if (Number(finalStats.participants) === 0) {
        console.log('   - Need more participants (deposits)');
      }
    }
    
    console.log('\n🎉 Demo setup completed!');
    console.log('🔍 Monitor with: npm run check-vault');
    console.log('⚡ Force draw with: npm run trigger-draw');
    
  } catch (error) {
    console.error('❌ Demo setup failed:', error);
    process.exit(1);
  }
}

setupCompleteDemo().catch(console.error);