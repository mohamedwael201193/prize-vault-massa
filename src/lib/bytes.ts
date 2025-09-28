// src/lib/bytes.ts
// Decode SmartContract.read() return for any massa-web3 version.
const td = new TextDecoder();

function pickBytes(x: any): Uint8Array | null {
  if (!x) return null;
  // Newer API: Uint8Array
  if (x instanceof Uint8Array) return x;
  // ArrayBuffer
  if (x instanceof ArrayBuffer) return new Uint8Array(x);
  // ArrayBufferView (e.g., DataView, typed arrays)
  if (ArrayBuffer.isView(x)) return new Uint8Array((x as ArrayBufferView).buffer);
  // Common older API: { value: Uint8Array }
  if (x.value) return pickBytes(x.value);
  // Some wrappers: { bytes: Uint8Array }
  if (x.bytes) return pickBytes(x.bytes);
  // String already
  if (typeof x === "string") return new TextEncoder().encode(x);
  // Try number[] as a last resort
  if (Array.isArray(x)) return Uint8Array.from(x);
  return null;
}

export function bytesToString(x: any): string {
  const u8 = pickBytes(x);
  if (!u8) throw new Error("Unexpected read() return type; cannot decode bytes.");
  return td.decode(u8);
}
