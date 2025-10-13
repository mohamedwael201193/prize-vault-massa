import {
  Account,
  Args,
  Mas,
  SmartContract,
  JsonRpcProvider,
} from '@massalabs/massa-web3';
import fs from "fs";
import path from "path";

// Environment configuration
const PRIVATE_KEY = "S1fJZjjH82tEmKxjrXB8mT1op4RJALfddeXLeuPEmAUT3UHRVZV";

// Load contract address from .env
function getContractAddress(): string {
  const envPath = path.resolve(__dirname, "../.env");
  if (!fs.existsSync(envPath)) {
    throw new Error("No .env file found. Please deploy the fundable contract first.");
  }
  
  const envContent = fs.readFileSync(envPath, "utf-8");
  const match = envContent.match(/FUNDABLE_VAULT_ADDR=(.+)/);
  
  if (!match || !match[1]) {
    throw new Error("FUNDABLE_VAULT_ADDR not found in .env. Please deploy the fundable contract first.");
  }
  
  return match[1].trim();
}

async function fundPrizePool(amount: string = "50") {
  try {
    console.log(`🎯 Funding Prize Pool with ${amount} MAS...`);
    
    // Initialize account and provider
    const account = await Account.fromPrivateKey(PRIVATE_KEY);
    const provider = JsonRpcProvider.buildnet(account);
    console.log("Funding from address:", account.address.toString());

    // Get contract address
    const contractAddress = getContractAddress();
    console.log("Contract address:", contractAddress);
  const amountMAS = process.argv[2] ? parseFloat(process.argv[2]) : 0.5;
  const amountNanoMAS = BigInt(Math.floor(amountMAS * 1e9));

  console.log(`💰 Adding ${amountMAS} MAS to prize pool...`);
  console.log(`📋 Using account: ${account.address}`);
  console.log(`🏦 Vault contract: ${vaultAddr}`);

  try {
    const contract = new SmartContract(provider, vaultAddr);
    
    // Fund scheduler first (needed for autonomous operation)
    console.log('\n⛽ Funding scheduler with some gas...');
    const seedOpId = await contract.call(
      'seedScheduler',
      new Args(),
      { coins: 100_000_000n } // 0.1 MAS for scheduler gas
    );
    console.log(`✅ Scheduler seed transaction: ${seedOpId}`);
    
    // Wait a moment for confirmation
    await new Promise(resolve => setTimeout(resolve, 8000));
    
    // The prize pool funding happens through deposits that accumulate interest
    // For demo purposes, we'll make a deposit then manually add to prize pool
    // In production, prize pool would be funded by yield/interest
    
    console.log(`\n💎 Making deposit of ${amountMAS} MAS (this will be your deposit)...`);
    const depositOpId = await contract.call(
      'deposit',
      new Args(),
      { coins: amountNanoMAS }
    );
    console.log(`✅ Deposit transaction: ${depositOpId}`);
    console.log(`🔗 Check deposit: https://buildnet-explorer.massa.net/operation/${depositOpId}`);
    
    // Wait for confirmation
    console.log('\n⏳ Waiting for confirmation...');
    await new Promise(resolve => setTimeout(resolve, 15000));
    
    // Note: In the actual contract, the prize pool is accumulated through yield
    // For testing purposes, you might need to directly fund the prize pool storage
    // This would require a contract function to manually add to prize pool
    
    console.log('\n🎯 IMPORTANT: Prize pool needs manual funding!');
    console.log('The current contract accumulates prizes through yield generation.');
    console.log('For testing, we need to add funds directly to the prize pool.');
    console.log('\nYour deposit is now in the vault and eligible for draws.');
    console.log('Prize pool still needs funding to trigger draws.');
    
  } catch (error) {
    console.error('❌ Operation failed:', error);
    process.exit(1);
  }
}

fundPrizePool().catch(console.error);