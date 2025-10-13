import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract,
} from '@massalabs/massa-web3';

async function setupDraw() {
  if (!process.env.SECRET_KEY) {
    console.error('Missing SECRET_KEY environment variable');
    process.exit(1);
  }

  console.log('🚀 Setting up AutoPrize Vault for successful draw...\n');

  // Create account from secret key
  const account = await Account.fromEnv();
  console.log(`📋 Using account: ${account.address}`);
  
  // Create provider
  const provider = JsonRpcProvider.buildnet(account);

  const vaultAddr = process.env.VAULT_ADDR || 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';
  console.log(`🏦 Vault contract: ${vaultAddr}\n`);

  try {
    const contract = new SmartContract(provider, vaultAddr);
    
    // Step 1: Check current status
    console.log('📊 Step 1: Checking current vault status...');
    const statsResult = await contract.read('getVaultStats');
    const stats = JSON.parse(new TextDecoder().decode(statsResult.value));
    
    const prizePoolMAS = Number(stats.prizePool) / 1e9;
    const minPrizeMAS = Number(stats.minPrizeThreshold) / 1e9;
    const participants = Number(stats.participants);
    const tvlMAS = Number(stats.tvl) / 1e9;
    
    console.log(`   Current TVL: ${tvlMAS} MAS`);
    console.log(`   Prize Pool: ${prizePoolMAS} MAS`);
    console.log(`   Min Prize Threshold: ${minPrizeMAS} MAS`);
    console.log(`   Participants: ${participants}`);
    
    // Step 2: Make sure we have a deposit (participant)
    if (participants === 0 || tvlMAS === 0) {
      console.log('\n💰 Step 2: Making initial deposit to become a participant...');
      const depositAmount = 2.0; // 2 MAS deposit
      const depositNanoMAS = BigInt(Math.floor(depositAmount * 1e9));
      
      const depositOpId = await contract.call(
        'deposit',
        new Args(),
        { coins: depositNanoMAS }
      );
      
      console.log(`✅ Deposit of ${depositAmount} MAS sent: ${depositOpId}`);
      console.log('⏳ Waiting for confirmation...');
      await new Promise(resolve => setTimeout(resolve, 15000));
    } else {
      console.log('\n✅ Step 2: Vault already has participants - skipping deposit');
    }
    
    // Step 3: Fund the scheduler (needed for autonomous operation)
    console.log('\n⛽ Step 3: Funding scheduler for autonomous operation...');
    const schedulerFund = 0.2; // 0.2 MAS for scheduler
    const schedulerNanoMAS = BigInt(Math.floor(schedulerFund * 1e9));
    
    const seedOpId = await contract.call(
      'seedScheduler',
      new Args(),
      { coins: schedulerNanoMAS }
    );
    
    console.log(`✅ Scheduler funded with ${schedulerFund} MAS: ${seedOpId}`);
    console.log('⏳ Waiting for confirmation...');
    await new Promise(resolve => setTimeout(resolve, 10000));
    
    // Step 4: Since the contract doesn't have yield generation active,
    // we need to manually add funds to the prize pool through a different approach
    console.log('\n💎 Step 4: Attempting to fund prize pool...');
    
    // Check if we can call a direct prize pool funding function
    // The current contract accumulates yield through a disabled mechanism
    // We'll need to make additional deposits to increase the pool indirectly
    
    const additionalDeposit = 1.0; // 1 MAS more
    const additionalNanoMAS = BigInt(Math.floor(additionalDeposit * 1e9));
    
    console.log(`   Making additional deposit of ${additionalDeposit} MAS to increase vault activity...`);
    const additionalOpId = await contract.call(
      'deposit',
      new Args(),
      { coins: additionalNanoMAS }
    );
    
    console.log(`✅ Additional deposit sent: ${additionalOpId}`);
    console.log('⏳ Waiting for confirmation...');
    await new Promise(resolve => setTimeout(resolve, 15000));
    
    // Step 5: Check updated status
    console.log('\n📊 Step 5: Checking updated vault status...');
    const newStatsResult = await contract.read('getVaultStats');
    const newStats = JSON.parse(new TextDecoder().decode(newStatsResult.value));
    
    const newPrizePoolMAS = Number(newStats.prizePool) / 1e9;
    const newParticipants = Number(newStats.participants);
    const newTvlMAS = Number(newStats.tvl) / 1e9;
    
    console.log(`   Updated TVL: ${newTvlMAS} MAS`);
    console.log(`   Updated Prize Pool: ${newPrizePoolMAS} MAS`);
    console.log(`   Updated Participants: ${newParticipants}`);
    
    // Step 6: Assessment and recommendations
    console.log('\n🎯 Step 6: Draw Readiness Assessment');
    
    if (newPrizePoolMAS >= minPrizeMAS && newParticipants > 0) {
      console.log('✅ VAULT IS READY FOR DRAW!');
      console.log(`   ✓ Prize pool (${newPrizePoolMAS} MAS) >= minimum (${minPrizeMAS} MAS)`);
      console.log(`   ✓ Has participants: ${newParticipants}`);
      console.log('\n🎲 You can now trigger a draw with: npm run trigger-draw');
    } else {
      console.log('⚠️  VAULT NOT READY FOR DRAW');
      console.log(`   Prize pool: ${newPrizePoolMAS} MAS (need: ${minPrizeMAS} MAS)`);
      console.log(`   Participants: ${newParticipants}`);
      
      if (newPrizePoolMAS < minPrizeMAS) {
        console.log('\n💡 SOLUTION: The contract has yield generation disabled.');
        console.log('To fix this, we need to modify the contract or manually fund the prize pool.');
        console.log('The mock yield was commented out in the tick() function for safety.');
        
        // Suggest creating a manual prize funding function
        console.log('\n🔧 RECOMMENDED NEXT STEPS:');
        console.log('1. Create a direct prize pool funding function in the contract');
        console.log('2. Or enable the yield mechanism in the tick() function');
        console.log('3. Or transfer MAS directly to the contract address to simulate yield');
        
        // Show manual funding option
        console.log('\n💰 MANUAL FUNDING OPTION:');
        console.log(`Send at least ${minPrizeMAS - newPrizePoolMAS} MAS directly to contract: ${vaultAddr}`);
        console.log('This will simulate yield and enable prize draws.');
      }
    }
    
    // Show timing information
    const nodeStatus = await provider.getNodeStatus();
    const currentPeriod = nodeStatus.currentCycle * 32 + nodeStatus.currentCycleTime;
    const nextDrawPeriod = parseInt(newStats.nextDrawPeriod);
    const periodsUntilDraw = Math.max(0, nextDrawPeriod - currentPeriod);
    const minutesUntilDraw = Math.round(periodsUntilDraw * 16 / 60);
    
    console.log('\n⏰ TIMING INFO:');
    console.log(`   Current Period: ${currentPeriod}`);
    console.log(`   Next Scheduled Draw: ${nextDrawPeriod}`);
    console.log(`   Time Until Draw: ${minutesUntilDraw} minutes`);
    
    console.log('\n🎉 Setup completed! Check the vault status with: npm run check-vault');
    
  } catch (error) {
    console.error('❌ Setup failed:', error);
    process.exit(1);
  }
}

setupDraw().catch(console.error);