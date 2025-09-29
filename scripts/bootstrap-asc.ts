import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract,
} from '@massalabs/massa-web3';

async function bootstrapASC() {
  if (!process.env.SECRET_KEY) {
    console.error('Missing SECRET_KEY environment variable');
    process.exit(1);
  }

  // Create account from secret key
  const account = await Account.fromEnv();
  
  // Create provider
  const provider = JsonRpcProvider.buildnet(account);

  const vaultAddr = process.env.VAULT_ADDR || 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';

  console.log(`Bootstrapping ASC for vault ${vaultAddr}...`);

  try {
    // 1. Seed the scheduler with some coins for autonomous operations
    console.log('⚡ Seeding scheduler...');
    const contract = new SmartContract(provider, vaultAddr);
    const seedOpId = await contract.call(
      'seedScheduler',
      new Args(),
      { coins: BigInt(100_000_000) } // 0.1 MAS for autonomous operations
    );
    console.log(`✅ Scheduler seeded: ${seedOpId}`);

    // Wait a moment
    await new Promise(resolve => setTimeout(resolve, 5000));

    // 2. Trigger first tick to start the autonomous cycle
    console.log('🔄 Triggering first tick...');
    const tickOpId = await contract.call(
      'tick',
      new Args(),
      { coins: BigInt(0) }
    );
    console.log(`✅ First tick sent: ${tickOpId}`);
    
    // Wait for confirmations
    console.log('⏳ Waiting for confirmations...');
    await new Promise(resolve => setTimeout(resolve, 10000));
    
    console.log('🎉 ASC bootstrap complete!');
    console.log('📊 Check the Autonomy page to see scheduled operations');
    console.log('🏆 Check the Winners page to see draw results (may take a few minutes)');
    
  } catch (error) {
    console.error('❌ ASC bootstrap failed:', error);
    process.exit(1);
  }
}

bootstrapASC().catch(console.error);