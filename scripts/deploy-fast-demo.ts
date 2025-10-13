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
  return fs.readFileSync(contractPath);
}

async function deployFastContract() {
  try {
    console.log("🚀 Deploying FAST AutoPrize Vault for immediate demo...");
    
    const account = await Account.fromPrivateKey(PRIVATE_KEY);
    const provider = JsonRpcProvider.buildnet(account);
    console.log("Deployer address:", account.address.toString());

    const byteCode = getScByteCode("build", "main-fundable.wasm");
    console.log("Contract size:", byteCode.length, "bytes");

    // SUPER FAST periods for immediate demo
    const drawPeriods = 3n;   // ~3 periods = ~48 seconds
    const tickPeriods = 1n;   // Every period = ~16 seconds
    
    const constructorArgs = new Args()
      .addU64(drawPeriods)
      .addU64(tickPeriods);

    console.log("⚡ FAST DEMO SETTINGS:");
    console.log("- Draw periods:", drawPeriods.toString(), "(~48 seconds)");
    console.log("- Tick periods:", tickPeriods.toString(), "(~16 seconds)");

    const contract = await SmartContract.deploy(
      provider,
      byteCode,
      constructorArgs,
      { coins: Mas.fromString('0.1') }
    );

    console.log("✅ FAST Contract deployed!");
    console.log("Contract address:", contract.address.toString());
    
    const events = await provider.getEvents({
      smartContractAddress: contract.address,
    });

    for (const event of events) {
      console.log('Event:', event.data);
    }
    
    // Update .env with fast contract
    const envPath = path.resolve(__dirname, "../.env");
    let envContent = fs.readFileSync(envPath, "utf-8");
    
    const fastVaultRegex = /FAST_VAULT_ADDR=.*/;
    const newFastEntry = `FAST_VAULT_ADDR=${contract.address.toString()}`;
    
    if (fastVaultRegex.test(envContent)) {
      envContent = envContent.replace(fastVaultRegex, newFastEntry);
    } else {
      envContent += `\n${newFastEntry}`;
    }
    
    fs.writeFileSync(envPath, envContent);
    console.log("✅ Fast contract address saved to .env");
    
    return contract.address.toString();
    
  } catch (error) {
    console.error("❌ Fast deployment failed:", error);
    throw error;
  }
}

deployFastContract()
  .then((address) => {
    console.log("\n🎯 FAST CONTRACT READY!");
    console.log("Address:", address);
    console.log("\nNext steps:");
    console.log("1. Fund this contract with 50 MAS");
    console.log("2. Make a deposit (5 MAS)");
    console.log("3. Wait ~1 minute for draw!");
  })
  .catch(() => process.exit(1));