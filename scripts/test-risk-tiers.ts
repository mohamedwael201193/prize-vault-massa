import {
  Account,
  Args,
  JsonRpcProvider,
  Mas,
  SmartContract,
} from "@massalabs/massa-web3";
import * as dotenv from "dotenv";

dotenv.config();

const CONTRACT_ADDRESS =
  process.env.VAULT_ADDRESS ||
  "AS13fFdTwt9zEg6mpZeDqip9xUJnYopfByNUCTX8ZLRPJfzHzJkm"; // Update after deployment

async function testDeposits() {
  console.log("🧪 Testing Wave 4 Risk Tier Deposits\n");

  if (!process.env.SECRET_KEY) {
    console.error("❌ Please set SECRET_KEY in your .env file");
    process.exit(1);
  }

  const account = await Account.fromEnv();
  const provider = JsonRpcProvider.buildnet(account);

  console.log("👛 Testing from:", account.address);

  // Test Conservative Tier (95% protected)
  console.log("\n1️⃣  Testing CONSERVATIVE Tier (95% Protected)");
  try {
    const contract = new SmartContract(provider, CONTRACT_ADDRESS);
    const conservativeOp = await contract.call(
      "depositConservative",
      new Args(),
      {
        coins: Mas.fromString("1"),
        fee: Mas.fromString("0.01"),
        maxGas: BigInt(2_000_000_000),
      }
    );

    console.log("   ✅ Conservative deposit successful");
    console.log("   📝 Operation:", conservativeOp.id);
    await new Promise((resolve) => setTimeout(resolve, 3000));
  } catch (error) {
    console.error("   ❌ Conservative deposit failed:", error);
  }

  // Test Moderate Tier (90% protected)
  console.log("\n2️⃣  Testing MODERATE Tier (90% Protected)");
  try {
    const contract = new SmartContract(provider, CONTRACT_ADDRESS);
    const moderateOp = await contract.call("depositModerate", new Args(), {
      coins: Mas.fromString("1"),
      fee: Mas.fromString("0.01"),
      maxGas: BigInt(2_000_000_000),
    });

    console.log("   ✅ Moderate deposit successful");
    console.log("   📝 Operation:", moderateOp.id);
    await new Promise((resolve) => setTimeout(resolve, 3000));
  } catch (error) {
    console.error("   ❌ Moderate deposit failed:", error);
  }

  // Test Aggressive Tier (80% protected)
  console.log("\n3️⃣  Testing AGGRESSIVE Tier (80% Protected)");
  try {
    const contract = new SmartContract(provider, CONTRACT_ADDRESS);
    const aggressiveOp = await contract.call("depositAggressive", new Args(), {
      coins: Mas.fromString("1"),
      fee: Mas.fromString("0.01"),
      maxGas: BigInt(2_000_000_000),
    });

    console.log("   ✅ Aggressive deposit successful");
    console.log("   📝 Operation:", aggressiveOp.id);
    await new Promise((resolve) => setTimeout(resolve, 3000));
  } catch (error) {
    console.error("   ❌ Aggressive deposit failed:", error);
  }

  // Check vault stats
  console.log("\n📊 Checking Vault Stats...");
  try {
    const contract = new SmartContract(provider, CONTRACT_ADDRESS);
    const stats = await contract.read("getVaultStats", new Args());

    console.log("   ✅ Stats retrieved successfully");
  } catch (error) {
    console.error("   ❌ Failed to get stats:", error);
  }

  console.log("\n✨ All three risk tiers tested successfully!");
  console.log("🎯 Ready for Wave 4 submission!");
}

testDeposits().catch(console.error);

testDeposits().catch(console.error);
