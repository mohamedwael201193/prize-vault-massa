import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract,
} from '@massalabs/massa-web3';
import * as dotenv from 'dotenv';

// Load environment variables from parent directory
dotenv.config({ path: '../.env.local' });

async function executeProposal() {
  if (!process.env.SECRET_KEY && !process.env.PRIVATE_KEY) {
    console.error('Missing SECRET_KEY or PRIVATE_KEY environment variable');
    process.exit(1);
  }

  console.log('⚡ Attempting to execute governance proposal...\n');

  // Create account from secret key
  const account = await Account.fromEnv();
  console.log(`📋 Using account: ${account.address}`);
  
  // Create provider
  const provider = JsonRpcProvider.buildnet(account);

  const vaultAddr = process.env.VAULT_ADDR || 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';
  console.log(`🏦 Vault contract: ${vaultAddr}\n`);

  try {
    const contract = new SmartContract(provider, vaultAddr);
    
    // Get current stats
    const statsResult = await contract.read('getVaultStats');
    const stats = JSON.parse(new TextDecoder().decode(statsResult.value));
    
    console.log(`📊 Proposal count: ${stats.proposalCount}`);
    
    if (Number(stats.proposalCount) === 0) {
      console.log('❌ No proposals found');
      process.exit(1);
    }
    
    // Try to execute the latest proposal (ID 6 from demo)
    const proposalId = 6n;
    console.log(`🗳️ Attempting to execute proposal ${proposalId}...`);
    
    // First get proposal details
    const proposalArgs = new Args().addU64(proposalId);
    const proposalResult = await contract.read('getProposal', proposalArgs);
    const proposal = JSON.parse(new TextDecoder().decode(proposalResult.value));
    
    console.log('\n📋 PROPOSAL DETAILS:');
    console.log(`   ID: ${proposal.id}`);
    console.log(`   Type: ${proposal.type}`);
    console.log(`   New Value: ${Number(proposal.value) / 1e9} MAS`);
    console.log(`   End Period: ${proposal.endPeriod}`);
    console.log(`   Yes Votes: ${Number(proposal.yesVotes) / 1e9}`);
    console.log(`   No Votes: ${Number(proposal.noVotes) / 1e9}`);
    
    // Try to execute
    try {
      const executeOpId = await contract.call('executeProposal', new Args().addU64(proposalId));
      console.log(`\n✅ Proposal execution sent: ${executeOpId}`);
      console.log('⏳ Waiting for confirmation...');
      
      await new Promise(resolve => setTimeout(resolve, 15000));
      
      // Check if execution worked
      const newStatsResult = await contract.read('getVaultStats');
      const newStats = JSON.parse(new TextDecoder().decode(newStatsResult.value));
      
      const newThreshold = Number(newStats.minPrizeThreshold) / 1e9;
      const oldThreshold = Number(stats.minPrizeThreshold) / 1e9;
      
      console.log(`\n📊 RESULTS:`);
      console.log(`   Old threshold: ${oldThreshold} MAS`);
      console.log(`   New threshold: ${newThreshold} MAS`);
      
      if (newThreshold < oldThreshold) {
        console.log('🎉 SUCCESS! Governance proposal executed!');
        console.log(`✅ Minimum prize threshold lowered to ${newThreshold} MAS`);
        console.log('\n🎯 NOW TESTING DRAWS...');
        
        // Now try to trigger a draw
        console.log('🎲 Attempting draw with new threshold...');
        const tickOpId = await contract.call('tick', new Args());
        console.log(`   Draw triggered: ${tickOpId}`);
        
        await new Promise(resolve => setTimeout(resolve, 15000));
        
        // Check for winners
        const finalStatsResult = await contract.read('getVaultStats');
        const finalStats = JSON.parse(new TextDecoder().decode(finalStatsResult.value));
        
        console.log(`\n🏆 FINAL RESULTS:`);
        console.log(`   Prize Pool: ${Number(finalStats.prizePool) / 1e9} MAS`);
        console.log(`   Winner Count: ${finalStats.winnerCount}`);
        
        if (Number(finalStats.winnerCount) > Number(newStats.winnerCount)) {
          console.log('🎉🎉 DRAW SUCCESSFUL! New winner selected!');
        } else {
          console.log('⚠️ Draw attempted but no winner yet (may need more prize funding)');
        }
        
      } else {
        console.log('⚠️ Threshold unchanged - proposal may not have executed');
      }
      
    } catch (executeError) {
      console.log(`\n❌ Proposal execution failed: ${executeError}`);
      console.log('This could mean:');
      console.log('- Voting period not ended yet');
      console.log('- Insufficient votes');
      console.log('- Already executed');
      console.log('- Other governance constraints');
    }
    
  } catch (error) {
    console.error('❌ Error:', error);
    process.exit(1);
  }
}

executeProposal().catch(console.error);