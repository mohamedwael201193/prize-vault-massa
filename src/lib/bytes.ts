// src/lib/bytes.ts
// Decode SmartContract.read() return for any massa-web3 version.
import { Args } from "@massalabs/massa-web3";

const td = new TextDecoder();

function pickBytes(x: any): Uint8Array | null {
  if (!x) return null;
  // Newer API: Uint8Array
  if (x instanceof Uint8Array) return x;
  // ArrayBuffer
  if (x instanceof ArrayBuffer) return new Uint8Array(x);
  // ArrayBufferView (e.g., DataView, typed arrays)
  if (ArrayBuffer.isView(x))
    return new Uint8Array((x as ArrayBufferView).buffer);
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
  if (!u8)
    throw new Error("Unexpected read() return type; cannot decode bytes.");

  // First, try direct decode (most contracts return raw JSON)
  try {
    const decoded = td.decode(u8);
    // Validate it's JSON
    const parsed = JSON.parse(decoded);
    console.log(
      "[bytes] ✓ Direct decode successful, keys:",
      Object.keys(parsed)
    );
    // Log the actual data to debug TVL display issues
    if (parsed.tvl !== undefined) {
      console.log(
        "[bytes] TVL value from contract:",
        parsed.tvl,
        "=",
        Number(parsed.tvl) / 1e9,
        "MAS"
      );
    }
    if (parsed.shares !== undefined) {
      console.log(
        "[bytes] User shares:",
        parsed.shares,
        "=",
        Number(parsed.shares) / 1e9,
        "MAS"
      );
    }
    return decoded;
  } catch (directError) {
    console.log("[bytes] Direct decode failed, trying Args deserialization...");

    // Fallback to Args deserialization (for newer contracts)
    try {
      const args = new Args(u8);
      const str = args.nextString();
      // Validate it's actually JSON
      const parsed = JSON.parse(str);
      console.log(
        "[bytes] ✓ Args deserialization successful, keys:",
        Object.keys(parsed)
      );
      return str;
    } catch (argsError) {
      // If both fail, log the raw data and throw
      console.error("[bytes] ✗ Both deserialization methods failed:", {
        directError,
        argsError,
        bytesPreview: Array.from(u8.slice(0, 20)),
        decodedPreview: td.decode(u8.slice(0, 50)),
      });
      throw new Error(`Cannot decode bytes to valid JSON: ${directError}`);
    }
  }
}
