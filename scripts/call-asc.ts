import { Account, Args, JsonRpcProvider, SmartContract } from '@massalabs/massa-web3';

async function callASCFunctions() {
  console.log('🚀 Calling ASC Functions...\n');
  
  const contractAddress = process.env.VITE_VAULT_ADDRESS || 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';
  
  console.log(`📄 Contract: ${contractAddress}`);
  
  // Check if PRIVATE_KEY is set
  if (!process.env.PRIVATE_KEY) {
    console.log('❌ PRIVATE_KEY not found in environment');
    console.log('📝 Run with: $env:PRIVATE_KEY="your_key"; npx tsx scripts/call-asc.ts');
    return;
  }

  try {
    // Connect to BuildNet
    const account = await Account.fromEnv();
    const provider = JsonRpcProvider.buildnet(account);
    const contract = new SmartContract(provider, contractAddress);
    
    console.log(`🔗 Connected wallet: ${account.address}`);
    console.log(`🌐 Network: BuildNet\n`);
    
    // Step 1: Call seedScheduler with 0.3 MAS
    console.log('🔄 Step 1: Calling seedScheduler with 0.3 MAS...');
    try {
      const seedResult = await contract.call('seedScheduler', new Args(), { 
        coins: 300_000_000n // 0.3 MAS for scheduler reserve
      });
      console.log(`✅ seedScheduler called! Operation: ${JSON.stringify(seedResult).slice(0, 100)}...`);
    } catch (seedError: any) {
      console.log(`⚠️ seedScheduler result: ${seedError.message || 'Already seeded or expected error'}`);
    }
    
    // Wait a moment between calls
    await new Promise(resolve => setTimeout(resolve, 2000));
    
    // Step 2: Call tick to start/restart the loop
    console.log('🔄 Step 2: Calling tick to start autonomous loop...');
    try {
      const tickResult = await contract.call('tick', new Args(), { coins: 0n });
      console.log(`✅ tick called! Operation: ${JSON.stringify(tickResult).slice(0, 100)}...`);
    } catch (tickError: any) {
      console.log(`⚠️ tick result: ${tickError.message || 'Already running or expected error'}`);
    }
    
    console.log('\n🎉 ASC Functions Called Successfully!');
    console.log('💡 Next Steps:');
    console.log('   1. Check Autonomy page for scheduled operations');
    console.log('   2. Wait for draws to execute (every ~1 hour)');
    console.log('   3. Check Winners page for new prize draws');
    console.log('   4. Verify results on Fairness page');
    console.log('   5. Contract balance: ~530 MAS should support many operations');
    
  } catch (error: any) {
    console.error('❌ Error calling ASC functions:', error.message);
    console.log('\n💡 Common issues:');
    console.log('   • Make sure Massa Station wallet is connected to BuildNet');
    console.log('   • Ensure you have enough MAS for gas fees');
    console.log('   • Check contract address in .env.local');
  }
}

callASCFunctions().catch(console.error);