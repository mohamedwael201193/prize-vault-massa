import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract,
} from '@massalabs/massa-web3';

async function triggerDraw() {
  if (!process.env.SECRET_KEY) {
    console.error('Missing SECRET_KEY environment variable');
    process.exit(1);
  }

  // Create account from secret key
  const account = await Account.fromEnv();
  
  // Create provider
  const provider = JsonRpcProvider.buildnet(account);

  const vaultAddr = process.env.VAULT_ADDR || 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';

  console.log('🎲 Triggering prize draw...');
  console.log(`📋 Using account: ${account.address}`);
  console.log(`🏦 Vault contract: ${vaultAddr}`);

  try {
    const contract = new SmartContract(provider, vaultAddr);
    
    // First check the vault status
    console.log('\n📊 Checking vault status...');
    const statsResult = await contract.read('getVaultStats');
    const stats = JSON.parse(new TextDecoder().decode(statsResult.value));
    
    console.log(`   Prize Pool: ${Number(stats.prizePool) / 1e9} MAS`);
    console.log(`   Participants: ${stats.participants}`);
    console.log(`   Min Prize Threshold: ${Number(stats.minPrizeThreshold) / 1e9} MAS`);
    console.log(`   Next Draw Period: ${stats.nextDrawPeriod}`);
    
    const prizePoolMAS = Number(stats.prizePool) / 1e9;
    const minPrizeMAS = Number(stats.minPrizeThreshold) / 1e9;
    
    if (prizePoolMAS < minPrizeMAS) {
      console.log(`\n❌ Cannot draw: Prize pool (${prizePoolMAS} MAS) < minimum (${minPrizeMAS} MAS)`);
      console.log(`🎯 Need to add ${minPrizeMAS - prizePoolMAS} MAS to prize pool first`);
      process.exit(1);
    }
    
    if (Number(stats.participants) === 0) {
      console.log('\n❌ Cannot draw: No participants in the vault');
      console.log('🎯 Someone needs to make a deposit first');
      process.exit(1);
    }
    
    console.log('\n✅ Conditions met for draw!');
    
    // Trigger the tick function which handles draws
    console.log('\n🎲 Calling tick() to trigger draw...');
    const opId = await contract.call('tick', new Args());
    
    console.log(`✅ Draw trigger transaction sent: ${opId}`);
    console.log(`🔗 Check transaction: https://buildnet-explorer.massa.net/operation/${opId}`);
    
    // Wait for confirmation
    console.log('\n⏳ Waiting for confirmation...');
    await new Promise(resolve => setTimeout(resolve, 15000));
    
    // Check if draw happened
    console.log('\n🔍 Checking if draw completed...');
    const newStatsResult = await contract.read('getVaultStats');
    const newStats = JSON.parse(new TextDecoder().decode(newStatsResult.value));
    
    const newPrizePool = Number(newStats.prizePool) / 1e9;
    const newWinnerCount = Number(newStats.winnerCount);
    const oldWinnerCount = Number(stats.winnerCount);
    
    if (newWinnerCount > oldWinnerCount) {
      console.log('🎉 DRAW COMPLETED!');
      console.log(`🏆 Winner count increased from ${oldWinnerCount} to ${newWinnerCount}`);
      console.log(`💰 Prize pool after draw: ${newPrizePool} MAS`);
      
      // Get the latest winner
      if (newWinnerCount > 0) {
        try {
          const winnersArgs = new Args().addU64(BigInt(newWinnerCount - 1)).addU64(1n);
          const winnersResult = await contract.read('getWinners', winnersArgs);
          const winners = JSON.parse(new TextDecoder().decode(winnersResult.value));
          
          if (winners.length > 0) {
            const winner = winners[0];
            console.log(`🎯 Latest Winner: ${winner.winner}`);
            console.log(`💎 Prize Amount: ${Number(winner.prize) / 1e9} MAS`);
            console.log(`📊 Draw Period: ${winner.period}`);
          }
        } catch (error) {
          console.log('⚠️ Could not fetch winner details');
        }
      }
    } else {
      console.log('⚠️ Draw may not have occurred or conditions not met');
      console.log(`   Prize pool before: ${prizePoolMAS} MAS`);
      console.log(`   Prize pool after: ${newPrizePool} MAS`);
      
      if (newPrizePool >= prizePoolMAS) {
        console.log('🤔 Prize pool unchanged - draw may have been skipped');
      }
    }
    
  } catch (error) {
    console.error('❌ Draw trigger failed:', error);
    process.exit(1);
  }
}

triggerDraw().catch(console.error);