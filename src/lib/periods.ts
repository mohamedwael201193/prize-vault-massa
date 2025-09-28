// src/lib/periods.ts
export const PERIOD_MS = 16000; // ~16s per period

function toNum(x: any): number | null {
  if (x === null || x === undefined) return null;
  if (typeof x === "number" && Number.isFinite(x)) return x;
  if (typeof x === "bigint") return Number(x);
  if (typeof x === "string" && x.trim() !== "") {
    const n = Number(x);
    return Number.isFinite(n) ? n : null;
  }
  return null;
}

// Try common API shapes from different massa-web3 versions
export function extractCurrentPeriod(status: any): number | null {
  return (
    toNum(status?.current_period) ??
    toNum(status?.currentPeriod) ??
    toNum(status?.node_status?.current_period) ??
    null
  );
}

export function computeNextDrawISO(nextDrawPeriodLike: any, currentPeriodLike: any): string {
  const nextP = toNum(nextDrawPeriodLike);
  const currP = toNum(currentPeriodLike);
  if (nextP === null || currP === null) return "Drawing...";

  const periodsLeft = Math.max(0, nextP - currP);
  const msLeft = periodsLeft * PERIOD_MS;
  if (!Number.isFinite(msLeft) || msLeft <= 0) return "Drawing...";

  const dt = new Date(Date.now() + msLeft);
  if (isNaN(dt.getTime())) return "Drawing...";
  return dt.toISOString();
}
