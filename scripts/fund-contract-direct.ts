import {
    Account,
    JsonRpcProvider,
} from '@massalabs/massa-web3';

async function fundContractDirectly() {
  if (!process.env.SECRET_KEY) {
    console.error('Missing SECRET_KEY environment variable');
    process.exit(1);
  }

  console.log('💰 Funding contract directly to simulate yield...\n');

  // Create account from secret key
  const account = await Account.fromEnv();
  console.log(`📋 Using account: ${account.address}`);
  
  // Create provider  
  const provider = JsonRpcProvider.buildnet(account);

  const vaultAddr = process.env.VAULT_ADDR || 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';
  const amountMAS = process.argv[2] ? parseFloat(process.argv[2]) : 0.5;
  const amountNanoMAS = BigInt(Math.floor(amountMAS * 1e9));

  console.log(`🎯 Sending ${amountMAS} MAS directly to contract: ${vaultAddr}`);
  console.log('This will simulate yield and fund the prize pool.\n');

  try {
    // Send MAS directly to the contract address using the provider
    console.log('📤 Sending transaction...');
    
    const operation = {
      recipientAddress: vaultAddr,
      amount: amountNanoMAS,
      fee: 10000000n, // 0.01 MAS fee
    };

    const opId = await provider.sendOperation(operation);
    
    console.log(`✅ Direct funding transaction sent: ${opId}`);
    console.log(`🔗 Check transaction: https://buildnet-explorer.massa.net/operation/${opId}`);
    
    // Wait for confirmation
    console.log('\n⏳ Waiting for confirmation...');
    await new Promise(resolve => setTimeout(resolve, 15000));
    
    console.log('✅ Direct funding completed!');
    console.log('\n💡 Note: This simulates yield generation for the prize pool.');
    console.log('In production, yield would come from staking, DeFi protocols, etc.');
    console.log('\n🎯 Next steps:');
    console.log('1. Run: npm run check-vault (to verify prize pool)');
    console.log('2. Run: npm run trigger-draw (to trigger a prize draw)');
    
  } catch (error) {
    console.error('❌ Direct funding failed:', error);
    process.exit(1);
  }
}

fundContractDirectly().catch(console.error);