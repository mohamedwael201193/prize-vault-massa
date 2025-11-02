import {
  Account,
  Args,
  JsonRpcProvider,
  SmartContract,
} from "@massalabs/massa-web3";
import * as dotenv from "dotenv";
import * as path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.join(__dirname, "..", ".env.local") });

async function check() {
  const CONTRACT =
    process.env.VITE_VAULT_ADDRESS ||
    "AS12kyZSPsZLUYwn1tPfkyQaPJTTQgfdEz9GVntEduFr6LyqP7boi";

  console.log("\n📊 Checking Vault Stats\n");
  console.log("Contract:", CONTRACT, "\n");

  const account = await Account.fromEnv();
  const provider = JsonRpcProvider.buildnet(account);
  const contract = new SmartContract(provider, CONTRACT);

  try {
    const tvl = await contract.read("getTVL", new Args());
    const tickets = await contract.read("getTotalTickets", new Args());
    const prize = await contract.read("getPrizePool", new Args());
    const participants = await contract.read("getParticipantCount", new Args());

    console.log("💰 TVL:", (Number(tvl.value) / 1e9).toFixed(2), "MAS");
    console.log("🎟️  Total Tickets:", Number(tickets.value));
    console.log(
      "🏆 Prize Pool:",
      (Number(prize.value) / 1e9).toFixed(2),
      "MAS"
    );
    console.log("👥 Participants:", Number(participants.value));

    // Check tier breakdown
    const consTVL = await contract.read("getConservativeTVL", new Args());
    const modTVL = await contract.read("getModerateTVL", new Args());
    const aggTVL = await contract.read("getAggressiveTVL", new Args());

    const consTickets = await contract.read(
      "getConservativeTickets",
      new Args()
    );
    const modTickets = await contract.read("getModerateTickets", new Args());
    const aggTickets = await contract.read("getAggressiveTickets", new Args());

    console.log("\n📊 Risk Tier Breakdown:");
    console.log(
      "   Conservative:",
      (Number(consTVL.value) / 1e9).toFixed(2),
      "MAS,",
      Number(consTickets.value),
      "tickets"
    );
    console.log(
      "   Moderate:",
      (Number(modTVL.value) / 1e9).toFixed(2),
      "MAS,",
      Number(modTickets.value),
      "tickets"
    );
    console.log(
      "   Aggressive:",
      (Number(aggTVL.value) / 1e9).toFixed(2),
      "MAS,",
      Number(aggTickets.value),
      "tickets"
    );

    console.log("\n✅ Everything working!\n");
  } catch (e: any) {
    console.error("❌", e.message);
  }
}

check().catch(console.error);
