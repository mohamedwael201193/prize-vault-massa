// Vault configuration for multi-vault support

export interface VaultConfig {
  id: string;
  name: string;
  description: string;
  address: string;
  category: 'weekly' | 'monthly' | 'mega';
  drawPeriods: number;
  tickPeriods: number;
  minPrize: number; // in nanoMAS
  color: string;
  icon: string;
  enabled: boolean;
}

// Main vault configurations
export const VAULT_CONFIGS: VaultConfig[] = [
  {
    id: 'main-vault',
    name: '0.5 MAS Prize Vault (LIVE!)',
    description: 'Fixed 0.5 MAS prizes every ~48 seconds - REAL WINNERS!',
    address: 'AS13fFdTwt9zEg6mpZeDqip9xUJnYopfByNUCTX8ZLRPJfzHzJkm',
    category: 'weekly',
    drawPeriods: 3,    // ~48 seconds for instant demo
    tickPeriods: 1,    // ~16 seconds for instant demo  
    minPrize: 10_000_000, // 0.01 MAS (lowered for demo)
    color: 'violet',
    icon: '💎',
    enabled: true,
  },
  {
    id: 'weekly-vault',
    name: 'Weekly Vault',
    description: 'Fast draws every week with smaller prizes',
    address: import.meta.env.VITE_WEEKLY_VAULT_ADDR || '',
    category: 'weekly',
    drawPeriods: 37800, // ~1 week (604800 seconds / 16 seconds per period)
    tickPeriods: 3600,  // ~1 hour
    minPrize: 50_000_000, // 0.05 MAS
    color: 'green',
    icon: '⚡',
    enabled: !!import.meta.env.VITE_WEEKLY_VAULT_ADDR,
  },
  {
    id: 'monthly-vault',
    name: 'Monthly Vault',
    description: 'Monthly mega draws with accumulated prizes',
    address: import.meta.env.VITE_MONTHLY_VAULT_ADDR || '',
    category: 'monthly',
    drawPeriods: 162000, // ~1 month (2628000 seconds / 16 seconds per period)
    tickPeriods: 5400,   // ~1.5 hours
    minPrize: 1_000_000_000, // 1 MAS
    color: 'purple',
    icon: '🌙',
    enabled: !!import.meta.env.VITE_MONTHLY_VAULT_ADDR,
  },
  {
    id: 'mega-vault',
    name: 'Mega Vault',
    description: 'Quarterly jackpot with massive prizes',
    address: import.meta.env.VITE_MEGA_VAULT_ADDR || '',
    category: 'mega',
    drawPeriods: 486000, // ~3 months
    tickPeriods: 21600,  // ~6 hours
    minPrize: 10_000_000_000, // 10 MAS
    color: 'gold',
    icon: '💰',
    enabled: !!import.meta.env.VITE_MEGA_VAULT_ADDR,
  },
];

// Get enabled vaults
export function getEnabledVaults(): VaultConfig[] {
  return VAULT_CONFIGS.filter(vault => vault.enabled);
}

// Get vault by ID
export function getVaultById(id: string): VaultConfig | undefined {
  return VAULT_CONFIGS.find(vault => vault.id === id);
}

// Get default vault (first enabled vault)
export function getDefaultVault(): VaultConfig {
  const enabled = getEnabledVaults();
  if (enabled.length === 0) {
    throw new Error('No vaults configured');
  }
  return enabled[0];
}

// Get vault address (legacy function for backward compatibility)
export function getVaultAddr(vaultId?: string): string {
  const vault = vaultId ? getVaultById(vaultId) : getDefaultVault();
  if (!vault) {
    throw new Error(`Vault not found: ${vaultId}`);
  }
  if (!vault.address) {
    throw new Error(`Vault address not configured: ${vault.name}`);
  }
  if (!vault.address.startsWith('AS')) {
    throw new Error(`Invalid vault address format: ${vault.address}`);
  }
  return vault.address;
}

// Color mappings for UI
export const VAULT_COLORS = {
  blue: {
    primary: 'bg-blue-500',
    light: 'bg-blue-100',
    text: 'text-blue-700',
    border: 'border-blue-200',
  },
  green: {
    primary: 'bg-green-500',
    light: 'bg-green-100',
    text: 'text-green-700',
    border: 'border-green-200',
  },
  purple: {
    primary: 'bg-purple-500',
    light: 'bg-purple-100',
    text: 'text-purple-700',
    border: 'border-purple-200',
  },
  gold: {
    primary: 'bg-yellow-500',
    light: 'bg-yellow-100',
    text: 'text-yellow-700',
    border: 'border-yellow-200',
  },
} as const;

// Get color classes for a vault
export function getVaultColorClasses(color: string) {
  return VAULT_COLORS[color as keyof typeof VAULT_COLORS] || VAULT_COLORS.blue;
}