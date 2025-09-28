// Test script to verify proposal storage and retrieval
import { Args, Client, SmartContract } from '@massalabs/massa-web3';

const CONTRACT_ADDRESS = 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';

async function testProposalRetrieval() {
  try {
    console.log('🔍 Testing proposal retrieval from contract:', CONTRACT_ADDRESS);
    
    const client = Client.buildnet();
    const sc = new SmartContract(client, CONTRACT_ADDRESS);
    
    // First, get vault stats to see proposal count
    console.log('1. Getting vault stats...');
    const statsResponse = await sc.read('getVaultStats', new Args());
    const stats = JSON.parse(statsResponse);
    console.log('📊 Vault stats:', stats);
    
    const proposalCount = parseInt(stats.proposalCount || '0');
    console.log(`📋 Proposal count: ${proposalCount}`);
    
    if (proposalCount === 0) {
      console.log('❌ No proposals found in contract');
      return;
    }
    
    // Try to fetch each proposal
    for (let i = 0; i < proposalCount; i++) {
      console.log(`\n2. Fetching proposal ${i}...`);
      try {
        const args = new Args().addU64(BigInt(i));
        const proposalResponse = await sc.read('getProposal', args);
        console.log(`📄 Raw proposal ${i} response:`, proposalResponse);
        
        const proposalData = JSON.parse(proposalResponse);
        console.log(`✅ Parsed proposal ${i}:`, proposalData);
        
        if (proposalData.error) {
          console.log(`❌ Proposal ${i} has error:`, proposalData.error);
        } else {
          console.log(`✅ Proposal ${i} is valid:`, {
            id: proposalData.id,
            type: proposalData.type,
            value: proposalData.value,
            proposer: proposalData.proposer?.substring(0, 10) + '...'
          });
        }
      } catch (err) {
        console.error(`❌ Failed to fetch proposal ${i}:`, err);
      }
    }
    
  } catch (error) {
    console.error('❌ Test failed:', error);
  }
}

testProposalRetrieval();