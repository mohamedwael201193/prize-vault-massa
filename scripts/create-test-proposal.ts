import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract,
} from '@massalabs/massa-web3';

async function createTestProposal() {
  if (!process.env.SECRET_KEY) {
    console.error('Missing SECRET_KEY environment variable');
    process.exit(1);
  }

  console.log('🗳️ Creating test governance proposal...\n');

  // Create account from secret key
  const account = await Account.fromEnv();
  console.log(`📋 Using account: ${account.address}`);
  
  // Create provider
  const provider = JsonRpcProvider.buildnet(account);

  const vaultAddr = process.env.VAULT_ADDR || 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';
  console.log(`🏦 Vault contract: ${vaultAddr}\n`);

  try {
    const contract = new SmartContract(provider, vaultAddr);
    
    // First, let's check if we have enough shares to create a proposal
    console.log('📊 Checking vault status and position...');
    const statsResult = await contract.read('getVaultStats');
    const stats = JSON.parse(new TextDecoder().decode(statsResult.value));
    
    console.log(`Total Shares: ${Number(stats.totalShares) / 1e9}`);
    console.log(`Current Min Prize Threshold: ${Number(stats.minPrizeThreshold) / 1e9} MAS`);
    
    try {
      const args = new Args().addString(account.address.toString());
      const positionResult = await contract.read('getUserPosition', args);
      const position = JSON.parse(new TextDecoder().decode(positionResult.value));
      
      console.log(`Your Shares: ${Number(position.shares) / 1e9}`);
      
      if (Number(position.shares) === 0) {
        console.log('\n❌ You need to make a deposit first to create proposals');
        console.log('Run: npm run deposit 1.0');
        process.exit(1);
      }
      
      const totalShares = Number(stats.totalShares);
      const yourShares = Number(position.shares);
      const requiredShares = totalShares / 100; // 1% minimum
      
      console.log(`Required shares for proposal: ${requiredShares / 1e9}`);
      
      if (yourShares < requiredShares) {
        console.log('\n❌ Insufficient shares to create proposal');
        console.log(`You need at least ${requiredShares / 1e9} shares (1% of total)`);
        process.exit(1);
      }
      
    } catch (error) {
      console.log('\n❌ Could not fetch your position - make sure you have deposits');
      process.exit(1);
    }
    
    // Create a proposal to lower the minimum prize threshold
    console.log('\n📝 Creating proposal to reduce minimum prize threshold...');
    
    const newMinPrize = 10_000_000n; // 0.01 MAS (much lower threshold)
    const proposalArgs = new Args()
      .addString('min_prize')
      .addU64(newMinPrize);
    
    console.log(`Proposing to change min prize from ${Number(stats.minPrizeThreshold) / 1e9} MAS to ${Number(newMinPrize) / 1e9} MAS`);
    
    const opId = await contract.call('createProposal', proposalArgs);
    
    console.log(`✅ Proposal created: ${opId}`);
    console.log(`🔗 Check transaction: https://buildnet-explorer.massa.net/operation/${opId}`);
    
    console.log('\n⏳ Waiting for confirmation...');
    await new Promise(resolve => setTimeout(resolve, 15000));
    
    // Check if proposal was created
    console.log('\n📊 Checking proposal status...');
    const newStatsResult = await contract.read('getVaultStats');
    const newStats = JSON.parse(new TextDecoder().decode(newStatsResult.value));
    
    console.log(`Proposal count: ${newStats.proposalCount}`);
    
    if (Number(newStats.proposalCount) > Number(stats.proposalCount)) {
      console.log('✅ Proposal created successfully!');
      
      // Get proposal details
      const proposalId = BigInt(Number(newStats.proposalCount) - 1);
      const proposalArgs2 = new Args().addU64(proposalId);
      const proposalResult = await contract.read('getProposal', proposalArgs2);
      const proposal = JSON.parse(new TextDecoder().decode(proposalResult.value));
      
      console.log('\n📋 PROPOSAL DETAILS:');
      console.log(`   ID: ${proposal.id}`);
      console.log(`   Type: ${proposal.type}`);
      console.log(`   New Value: ${Number(proposal.value) / 1e9} MAS`);
      console.log(`   Proposer: ${proposal.proposer}`);
      console.log(`   Start Period: ${proposal.startPeriod}`);
      console.log(`   End Period: ${proposal.endPeriod}`);
      
      console.log('\n🗳️ Next steps:');
      console.log(`1. Vote YES on proposal: npx tsx vote-proposal.ts ${proposal.id} true`);
      console.log(`2. Wait for voting period to end (period ${proposal.endPeriod})`);
      console.log(`3. Execute proposal: npx tsx execute-proposal.ts ${proposal.id}`);
      
    } else {
      console.log('⚠️ Proposal creation may have failed');
    }
    
  } catch (error) {
    console.error('❌ Proposal creation failed:', error);
    process.exit(1);
  }
}

createTestProposal().catch(console.error);