import {
    Account,
    Args,
    JsonRpcProvider,
    Mas,
    SmartContract,
} from '@massalabs/massa-web3';
import fs from "fs";
import path from "path";
import { fileURLToPath } from 'url';

// ES module dirname compatibility
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Environment configuration
const PRIVATE_KEY = "S1fJZjjH82tEmKxjrXB8mT1op4RJALfddeXLeuPEmAUT3UHRVZV";

function getScByteCode(buildDir: string, fileName: string): Uint8Array {
  const contractPath = path.resolve(__dirname, "../autoprize-vault-sc", buildDir, fileName);
  if (!fs.existsSync(contractPath)) {
    throw new Error(`Contract not found at ${contractPath}. Please compile first with: npm run build`);
  }
  return fs.readFileSync(contractPath);
}

async function deployFundableContract() {
  try {
    console.log("🚀 Deploying Fundable AutoPrize Vault...");
    
    // Initialize account and provider
    const account = await Account.fromPrivateKey(PRIVATE_KEY);
    const provider = JsonRpcProvider.buildnet(account);
    console.log("Deployer address:", account.address.toString());

    // Get contract bytecode
    const byteCode = getScByteCode("build", "main-fundable.wasm");
    console.log("Contract size:", byteCode.length, "bytes");

    // Deploy with parameters - shorter periods for testing
    const drawPeriods = 900n;   // ~15 minutes for testing
    const tickPeriods = 60n;    // ~1 minute for testing
    
    const constructorArgs = new Args()
      .addU64(drawPeriods)
      .addU64(tickPeriods);

    console.log("Deploying with parameters:");
    console.log("- Draw periods:", drawPeriods.toString(), "(~15 minutes)");
    console.log("- Tick periods:", tickPeriods.toString(), "(~1 minute)");

    const contract = await SmartContract.deploy(
      provider,
      byteCode,
      constructorArgs,
      { coins: Mas.fromString('0.1') } // 0.1 MAS for scheduler
    );

    console.log("✅ Contract deployed successfully!");
    console.log("Contract address:", contract.address.toString());
    
    // Get deployment events
    const events = await provider.getEvents({
      smartContractAddress: contract.address,
    });

    for (const event of events) {
      console.log('Event message:', event.data);
    }
    
    // Update environment file
    const envPath = path.resolve(__dirname, "../.env");
    let envContent = "";
    
    if (fs.existsSync(envPath)) {
      envContent = fs.readFileSync(envPath, "utf-8");
    }
    
    // Update or add FUNDABLE_VAULT_ADDR
    const fundableVaultRegex = /FUNDABLE_VAULT_ADDR=.*/;
    const newFundableEntry = `FUNDABLE_VAULT_ADDR=${contract.address.toString()}`;
    
    if (fundableVaultRegex.test(envContent)) {
      envContent = envContent.replace(fundableVaultRegex, newFundableEntry);
    } else {
      envContent += `\n${newFundableEntry}`;
    }
    
    fs.writeFileSync(envPath, envContent.trim() + "\n");
    console.log("✅ Environment updated with fundable contract address");
    
    return {
      address: contract.address.toString(),
      contract: contract
    };
    
  } catch (error) {
    console.error("❌ Deployment failed:", error);
    throw error;
  }
}

// Run if called directly (ES Module compatible)
deployFundableContract()
  .then((result) => {
    console.log("\n🎯 Next steps:");
    console.log("1. Wait for deployment confirmation");
    console.log("2. Use fund-prize-pool-new.ts to add 50 MAS to prize pool");
    console.log("3. Test draw functionality");
    console.log("\nContract Address:", result.address);
  })
  .catch((error) => {
    console.error("Deployment failed:", error);
    process.exit(1);
  });

export { deployFundableContract };
