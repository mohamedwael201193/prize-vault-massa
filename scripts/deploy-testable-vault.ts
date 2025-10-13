import {
    Account,
    Args,
    JsonRpcProvider,
    SmartContract,
} from '@massalabs/massa-web3';
import { readFileSync } from 'fs';

async function deployTestableContract() {
  if (!process.env.SECRET_KEY) {
    console.error('Missing SECRET_KEY environment variable');
    process.exit(1);
  }

  console.log('🚀 Deploying testable AutoPrize Vault contract...\n');

  // Create account from secret key
  const account = await Account.fromEnv();
  console.log(`📋 Using account: ${account.address}`);
  
  // Create provider
  const provider = JsonRpcProvider.buildnet(account);

  try {
    // Read the compiled contract
    const contractCode = readFileSync('./autoprize-vault-sc/build/main.wat');
    
    // Constructor arguments
    const drawPeriods = 50n; // Shorter for testing - ~13 minutes
    const tickPeriods = 10n;  // ~2.7 minutes between ticks
    
    console.log(`📝 Contract parameters:`);
    console.log(`   Draw Periods: ${drawPeriods} (~${Number(drawPeriods * 16n) / 60} minutes)`);
    console.log(`   Tick Periods: ${tickPeriods} (~${Number(tickPeriods * 16n) / 60} minutes)`);
    console.log(`   Min Prize: 0.01 MAS (for easy testing)`);
    
    const constructorArgs = new Args()
      .addU64(drawPeriods)
      .addU64(tickPeriods);

    console.log('\n📤 Deploying contract...');
    
    const deployResult = await provider.smartContracts().deploySmartContract(
      contractCode,
      constructorArgs,
      10_000_000n // 10 MAS max coins
    );

    console.log(`✅ Contract deployed successfully!`);
    console.log(`📍 Contract Address: ${deployResult.address}`);
    console.log(`🔗 Deployment Transaction: https://buildnet-explorer.massa.net/operation/${deployResult.opId}`);
    
    // Wait for deployment confirmation
    console.log('\n⏳ Waiting for deployment confirmation...');
    await new Promise(resolve => setTimeout(resolve, 20000));
    
    // Test the contract
    console.log('\n🧪 Testing deployed contract...');
    const contract = new SmartContract(provider, deployResult.address);
    
    // Get initial stats
    const statsResult = await contract.read('getVaultStats');
    const stats = JSON.parse(new TextDecoder().decode(statsResult.value));
    
    console.log('\n📊 INITIAL CONTRACT STATE:');
    console.log(`   Contract Version: ${stats.contractVersion}`);
    console.log(`   Min Prize Threshold: ${Number(stats.minPrizeThreshold) / 1e9} MAS`);
    console.log(`   Draw Periods: ${stats.drawPeriods}`);
    console.log(`   Tick Periods: ${stats.tickPeriods}`);
    console.log(`   TVL: ${Number(stats.tvl) / 1e9} MAS`);
    console.log(`   Prize Pool: ${Number(stats.prizePool) / 1e9} MAS`);
    
    // Update environment file
    console.log('\n📝 Updating environment configuration...');
    
    console.log('\n🎯 NEXT STEPS:');
    console.log(`1. Update your .env.local file with:`);
    console.log(`   VITE_VAULT_ADDR=${deployResult.address}`);
    console.log(`   VAULT_ADDR=${deployResult.address}`);
    console.log('');
    console.log('2. Test the new contract:');
    console.log(`   npm run check-vault`);
    console.log(`   npm run setup-draw`);
    console.log(`   npm run trigger-draw`);
    
    console.log('\n✨ Deployment completed successfully!');
    console.log(`🏦 Your new testable vault: ${deployResult.address}`);
    
  } catch (error) {
    console.error('❌ Deployment failed:', error);
    process.exit(1);
  }
}

deployTestableContract().catch(console.error);