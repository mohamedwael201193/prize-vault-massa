import { useVaultContext } from '@/hooks/useVaultContext';
import { useVaultStore } from '@/state/vaultStore';
import { useEffect } from 'react';

/**
 * Hook that connects the vault context with the vault store
 * Automatically updates the vault store when the active vault changes
 */
export function useVaultSync() {
  const { activeVault } = useVaultContext();
  const { vaultAddress, setVaultAddress, refetch } = useVaultStore();

  useEffect(() => {
    if (activeVault.address !== vaultAddress) {
      console.debug(`[VaultSync] Switching to vault: ${activeVault.name} (${activeVault.address})`);
      setVaultAddress(activeVault.address);
      // Trigger refetch for the new vault
      refetch(activeVault.address);
    }
  }, [activeVault.address, vaultAddress, setVaultAddress, refetch]);

  return {
    activeVault,
    vaultAddress,
  };
}