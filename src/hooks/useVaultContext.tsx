import { VaultConfig, getDefaultVault, getVaultById } from '@/config/vaults';
import { ReactNode, createContext, useContext, useEffect, useState } from 'react';

interface VaultContextType {
  activeVault: VaultConfig;
  setActiveVault: (vault: VaultConfig) => void;
  switchToVault: (vaultId: string) => boolean;
}

const VaultContext = createContext<VaultContextType | undefined>(undefined);

interface VaultProviderProps {
  children: ReactNode;
}

export function VaultProvider({ children }: VaultProviderProps) {
  const [activeVault, setActiveVaultState] = useState<VaultConfig>(() => {
    // Try to restore from localStorage
    const saved = localStorage.getItem('active-vault-id');
    if (saved) {
      const vault = getVaultById(saved);
      if (vault && vault.enabled) {
        return vault;
      }
    }
    return getDefaultVault();
  });

  // Save to localStorage when active vault changes
  const setActiveVault = (vault: VaultConfig) => {
    setActiveVaultState(vault);
    localStorage.setItem('active-vault-id', vault.id);
  };

  // Switch to vault by ID
  const switchToVault = (vaultId: string): boolean => {
    const vault = getVaultById(vaultId);
    if (vault && vault.enabled) {
      setActiveVault(vault);
      return true;
    }
    return false;
  };

  // Validate active vault on mount (in case config changed)
  useEffect(() => {
    if (!activeVault.enabled) {
      console.warn(`Active vault ${activeVault.id} is disabled, switching to default`);
      setActiveVault(getDefaultVault());
    }
  }, []);

  const value: VaultContextType = {
    activeVault,
    setActiveVault,
    switchToVault,
  };

  return (
    <VaultContext.Provider value={value}>
      {children}
    </VaultContext.Provider>
  );
}

export function useVaultContext(): VaultContextType {
  const context = useContext(VaultContext);
  if (!context) {
    throw new Error('useVaultContext must be used within a VaultProvider');
  }
  return context;
}

// Hook to get current vault address
export function useActiveVaultAddress(): string {
  const { activeVault } = useVaultContext();
  return activeVault.address;
}