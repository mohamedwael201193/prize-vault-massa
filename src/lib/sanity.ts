// Legacy function for backward compatibility - gets the default vault address
export function getVaultAddr(): string {
  const a = import.meta.env.VITE_VAULT_ADDRESS;
  if (!a) throw new Error("VITE_VAULT_ADDRESS missing");
  if (!a.startsWith("AS")) throw new Error(`VITE_VAULT_ADDRESS must start with AS (got ${a})`);
  return a;
}

// Validate a vault address format
export function validateVaultAddress(address: string): boolean {
  return typeof address === 'string' && address.startsWith('AS') && address.length > 10;
}

export function getRpcUrl(): string {
  return import.meta.env.VITE_MASSA_RPC || "https://buildnet.massa.net/api/v2";
}
