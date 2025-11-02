import {
  Account,
  Args,
  JsonRpcProvider,
  Mas,
  SmartContract,
} from "@massalabs/massa-web3";
import * as dotenv from "dotenv";
import * as path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.join(__dirname, "..", ".env.local") });

async function draw() {
  const CONTRACT =
    process.env.VITE_VAULT_ADDRESS ||
    "AS12kyZSPsZLUYwn1tPfkyQaPJTTQgfdEz9GVntEduFr6LyqP7boi";

  console.log("\n🎲 Triggering Manual Draw\n");
  console.log("Contract:", CONTRACT, "\n");

  const account = await Account.fromEnv();
  const provider = JsonRpcProvider.buildnet(account);
  const contract = new SmartContract(provider, CONTRACT);

  try {
    console.log("📤 Calling manualDraw()...");
    const op = await contract.call("manualDraw", new Args(), {
      coins: Mas.fromString("0"),
      fee: Mas.fromString("0.01"),
    });

    console.log("✅ Draw executed!");
    console.log("Operation ID:", op.id);
    console.log("\n⏳ Waiting 10s for finalization...");

    await new Promise((r) => setTimeout(r, 10000));

    console.log("\n🎯 Check winner: npm run check:winners\n");
  } catch (e: any) {
    console.error("❌", e.message);
  }
}

draw().catch(console.error);
