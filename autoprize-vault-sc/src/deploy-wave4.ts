import {
  Account,
  Args,
  JsonRpcProvider,
  Mas,
  SmartContract,
} from '@massalabs/massa-web3';
import * as dotenv from 'dotenv';
import * as fs from 'fs';
import * as path from 'path';
import { fileURLToPath } from 'url';

dotenv.config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

if (!process.env.SECRET_KEY) {
  console.error('❌ Please set SECRET_KEY in your .env file');
  process.exit(1);
}

async function deployWave4Contract() {
  console.log('🚀 Starting Wave 4 Contract Deployment...\n');

  // Initialize account and provider
  const account = await Account.fromEnv();
  const provider = JsonRpcProvider.buildnet(account);

  console.log('👛 Deploying from wallet:', account.address);

  // Read contract bytecode
  const contractPath = path.join(
    __dirname,
    '..',
    'build',
    'main-v2-wave4.wasm',
  );
  const contractCode = fs.readFileSync(contractPath);
  console.log(
    '📄 Contract size:',
    (contractCode.length / 1024).toFixed(2),
    'KB',
  );

  // Constructor parameters
  const drawPeriods = 5400; // ~90 minutes (225 periods per draw)
  const tickPeriods = 225; // ~48 seconds

  const constructorArgs = new Args()
    .addU64(BigInt(drawPeriods))
    .addU64(BigInt(tickPeriods));

  console.log('\n⚙️  Constructor Parameters:');
  console.log('   Draw Periods:', drawPeriods, '(~90 minutes)');
  console.log('   Tick Periods:', tickPeriods, '(~48 seconds)');

  try {
    console.log('\n🔄 Deploying contract to BuildNet...');

    const contract = await SmartContract.deploy(
      provider,
      contractCode,
      constructorArgs,
      { coins: Mas.fromString('1'), fee: Mas.fromString('0.1') },
    );

    const contractAddress = contract.address;
    console.log('\n🎉 CONTRACT DEPLOYED SUCCESSFULLY!');
    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    console.log('📍 Contract Address:', contractAddress);
    console.log(
      '🔗 BuildNet Explorer:',
      `https://buildnet.massa.net/address/${contractAddress}`,
    );
    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

    // Save contract address to file
    const configPath = path.join(
      __dirname,
      '..',
      '..',
      'src',
      'config',
      'contract-wave4.ts',
    );
    const configContent = `// Wave 4 Contract Configuration
// Auto-generated on ${new Date().toISOString()}

export const WAVE4_CONTRACT_ADDRESS = "${contractAddress}";
export const BUILDNET_URL = "https://buildnet.massa.net";
export const DRAW_PERIODS = ${drawPeriods};
export const TICK_PERIODS = ${tickPeriods};

// Risk Tier Configuration
export const RISK_TIERS = {
  CONSERVATIVE: {
    protection: 95,
    risk: 5,
    multiplier: 1.0,
    apy: "3-5%"
  },
  MODERATE: {
    protection: 90,
    risk: 10,
    multiplier: 1.5,
    apy: "5-12%"
  },
  AGGRESSIVE: {
    protection: 80,
    risk: 20,
    multiplier: 2.0,
    apy: "8-20%"
  }
} as const;
`;

    fs.writeFileSync(configPath, configContent);
    console.log('\n✅ Contract configuration saved to:', configPath);

    console.log('\n📋 Next Steps:');
    console.log('1. Update VAULT_ADDRESS in src/lib/sanity.ts');
    console.log(
      '2. Test deposits to each tier (Conservative, Moderate, Aggressive)',
    );
    console.log('3. Verify auto-deposit setup works');
    console.log('4. Fund the scheduler with: npm run fund-scheduler');

    return contractAddress;
  } catch (error) {
    console.error('❌ Deployment error:', error);
    process.exit(1);
  }
}

// Execute deployment
deployWave4Contract()
  .then((address) => {
    console.log('\n✨ Deployment completed successfully!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('\n❌ Fatal error:', error);
    process.exit(1);
  });
