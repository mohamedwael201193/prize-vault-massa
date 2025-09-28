import * as web3 from "@massalabs/massa-web3";

const OpEnum = (web3 as any).EOperationStatus ?? (web3 as any).OperationStatus ?? {};

function normalizeStatus(s: any): string {
  let v = s;
  if (v && typeof v === "object" && "status" in v) v = (v as any).status;
  if (typeof v === "number") {
    const name = Object.keys(OpEnum).find(k => (OpEnum as any)[k] === v) || String(v);
    return name.toLowerCase();
  }
  if (typeof v === "string") return v.toLowerCase();
  return String(v ?? "").toLowerCase();
}

function isFinalSuccess(s: any): boolean {
  const n = normalizeStatus(s);
  return n.includes("final_success") || n === "success" || n === "ok";
}

export async function assertFinalSuccess(op: any, label = "operation") {
  const res = await op.waitFinalExecution();
  if (isFinalSuccess(res)) return;

  let reason = "";
  let gasHint = "";
  try {
    const events = await op.getFinalEvents?.();
    if (Array.isArray(events)) {
      const merged = events.map((e: any) => String(e?.data ?? "")).join(" | ");
      if (merged) reason = ` | ${merged}`;
      const m = merged.match(/Provided gas (\d+)\D+base .*? (\d+)/i);
      if (m) {
        const base = Number(m[2]); const suggest = Math.ceil(base + 300000);
        gasHint = ` Try increasing maxGas to at least ~${suggest}.`;
      }
    }
  } catch {}
  const name = normalizeStatus(res);
  throw new Error(`Final execution failed (${name || "unknown"})${reason}.${gasHint}`);
}