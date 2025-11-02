import {
  Account,
  Args,
  JsonRpcProvider,
  SmartContract,
} from "@massalabs/massa-web3";
import * as dotenv from "dotenv";

dotenv.config();

const CONTRACT = "AS1DCtQW7HiA9JEgEBYaBJgpjXkxqNCAj7nMtFpyvYRxherrRnQW";

async function main() {
  const account = await Account.fromEnv();
  const provider = JsonRpcProvider.buildnet(account);
  const contract = new SmartContract(provider, CONTRACT);

  const result = await contract.read("getVaultStats", new Args());

  // Deserialize Args response
  const args = new Args(result.value);
  const jsonString = args.nextString();
  const json = JSON.parse(jsonString);

  console.log("\n📊 WAVE 4 CONTRACT TVL:");
  console.log("══════════════════════════════");
  console.log(
    "Total TVL:       ",
    (parseInt(json.tvl) / 1e9).toFixed(3),
    "MAS"
  );
  console.log(
    "Conservative:    ",
    (parseInt(json.conservativeTVL) / 1e9).toFixed(3),
    "MAS"
  );
  console.log(
    "Moderate:        ",
    (parseInt(json.moderateTVL) / 1e9).toFixed(3),
    "MAS"
  );
  console.log(
    "Aggressive:      ",
    (parseInt(json.aggressiveTVL) / 1e9).toFixed(3),
    "MAS"
  );
  console.log("══════════════════════════════");
  console.log(
    "Prize Pool:      ",
    (parseInt(json.prizePool) / 1e9).toFixed(3),
    "MAS"
  );
  console.log("Participants:    ", json.participants);
  console.log("\n");
}

main().catch(console.error);
