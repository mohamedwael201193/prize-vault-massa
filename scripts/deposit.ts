import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract,
} from '@massalabs/massa-web3';

async function depositToVault() {
  if (!process.env.SECRET_KEY) {
    console.error('Missing SECRET_KEY environment variable');
    process.exit(1);
  }

  // Create account from secret key
  const account = await Account.fromEnv();
  
  // Create provider
  const provider = JsonRpcProvider.buildnet(account);

  const vaultAddr = process.env.VAULT_ADDR || 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';
  const amountMAS = process.argv[2] ? parseFloat(process.argv[2]) : 1.0;
  const amountNanoMAS = BigInt(Math.floor(amountMAS * 1e9));

  console.log(`Depositing ${amountMAS} MAS to vault ${vaultAddr}...`);

  try {
    const contract = new SmartContract(provider, vaultAddr);
    const opId = await contract.call(
      'deposit',
      new Args(),
      { coins: amountNanoMAS }
    );

    console.log(`✅ Deposit transaction sent: ${opId}`);
    console.log(`🔗 Check status: https://buildnet-explorer.massa.net/operation/${opId}`);
    
    // Wait for confirmation
    console.log('⏳ Waiting for confirmation...');
    await new Promise(resolve => setTimeout(resolve, 10000));
    console.log(`✅ Deposit should be confirmed!`);
    
  } catch (error) {
    console.error('❌ Deposit failed:', error);
    process.exit(1);
  }
}

depositToVault().catch(console.error);