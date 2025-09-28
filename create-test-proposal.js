// Script to create test proposals for governance demonstration
import { Args, Mas, SmartContract } from '@massalabs/massa-web3';
import { getWallets } from '@massalabs/wallet-provider';

const CONTRACT_ADDRESS = 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';

async function createTestProposal() {
  try {
    console.log('🏛️ Creating test governance proposal...');
    
    // Get wallets
    const wallets = await getWallets();
    if (wallets.length === 0) {
      throw new Error('No wallet found. Please make sure Massa Station is running.');
    }

    const wallet = wallets[0];
    await wallet.connect();
    
    const accounts = await wallet.accounts();
    if (accounts.length === 0) {
      throw new Error('No accounts found in wallet');
    }

    console.log('Using account:', accounts[0].address);
    
    // Create smart contract instance
    const provider = wallet.getProvider();
    const sc = new SmartContract(provider, CONTRACT_ADDRESS);
    
    // Create proposal to change minimum prize threshold to 0.5 MAS
    const args = new Args()
      .addString('min_prize')  // proposal type
      .addU64(BigInt(500_000_000)); // 0.5 MAS in nanoMAS
    
    console.log('Submitting createProposal transaction...');
    
    const op = await sc.call('createProposal', args, {
      fee: Mas.fromString('0.01'),
      maxGas: 3_500_000n,
    });
    
    console.log('Transaction submitted, waiting for finalization...');
    console.log('Operation ID:', op.id);
    
    // Wait for finalization
    await op.waitSpeculativeExecution();
    console.log('✅ Test proposal created successfully!');
    console.log('Check the governance page to see your new proposal.');
    
  } catch (error) {
    console.error('❌ Failed to create test proposal:', error);
  }
}

createTestProposal();