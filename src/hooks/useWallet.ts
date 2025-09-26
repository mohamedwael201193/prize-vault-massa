import { create } from 'zustand';
import { persist } from 'zustand/middleware';
import { massaClient, type MassaAccount } from '@/lib/massa';
import { toast } from '@/hooks/use-toast';

interface WalletState {
  address: string | null;
  connected: boolean;
  connecting: boolean;
  account: MassaAccount | null;
}

interface WalletActions {
  connect: () => Promise<void>;
  disconnect: () => Promise<void>;
  refreshAccount: () => Promise<void>;
  setConnecting: (connecting: boolean) => void;
}

type WalletStore = WalletState & WalletActions;

export const useWallet = create<WalletStore>()(
  persist(
    (set, get) => ({
      // State
      address: null,
      connected: false,
      connecting: false,
      account: null,

      // Actions
      setConnecting: (connecting: boolean) => {
        set({ connecting });
      },

      connect: async () => {
        const { setConnecting } = get();
        
        if (!massaClient.isWalletAvailable()) {
          toast({
            title: "Massa Station Required",
            description: "Please install Massa Station extension to connect your wallet.",
            variant: "destructive",
          });
          return;
        }

        try {
          setConnecting(true);
          const address = await massaClient.connectWallet();
          const account = await massaClient.getAccount();
          
          set({
            address,
            connected: true,
            account,
            connecting: false
          });

          toast({
            title: "Wallet Connected",
            description: `Connected to ${massaClient.formatAddress(address)}`,
          });
        } catch (error) {
          console.error('Connection failed:', error);
          set({ connecting: false });
          
          toast({
            title: "Connection Failed",
            description: error instanceof Error ? error.message : "Failed to connect wallet",
            variant: "destructive",
          });
        }
      },

      disconnect: async () => {
        try {
          await massaClient.disconnect();
          set({
            address: null,
            connected: false,
            account: null,
            connecting: false
          });

          toast({
            title: "Wallet Disconnected",
            description: "Your wallet has been disconnected.",
          });
        } catch (error) {
          console.error('Disconnect failed:', error);
          // Still update state even if disconnect fails
          set({
            address: null,
            connected: false,
            account: null,
            connecting: false
          });
        }
      },

      refreshAccount: async () => {
        const { connected } = get();
        if (!connected) return;

        try {
          const account = await massaClient.getAccount();
          set({ account });
        } catch (error) {
          console.error('Failed to refresh account:', error);
          // If refresh fails, assume disconnected
          set({
            address: null,
            connected: false,
            account: null,
            connecting: false
          });
        }
      },
    }),
    {
      name: 'massa-wallet-storage',
      partialize: (state) => ({
        address: state.address,
        connected: state.connected,
        // Don't persist account data as it can become stale
      }),
      // Rehydrate connection state on app load
      onRehydrateStorage: () => (state) => {
        if (state?.connected && state?.address) {
          // Verify connection is still valid and refresh account
          massaClient.isConnected().then((isConnected) => {
            if (isConnected) {
              massaClient.getAccount().then((account) => {
                useWallet.setState({ account });
              }).catch(() => {
                // If can't get account, disconnect
                useWallet.getState().disconnect();
              });
            } else {
              // If not connected, clear state
              useWallet.setState({
                address: null,
                connected: false,
                account: null,
                connecting: false
              });
            }
          }).catch(() => {
            // If can't check connection, clear state
            useWallet.setState({
              address: null,
              connected: false,
              account: null,
              connecting: false
            });
          });
        }
      },
    }
  )
);

// Hook for transaction states
interface TransactionState {
  pending: boolean;
  hash: string | null;
}

interface TransactionActions {
  setPending: (pending: boolean) => void;
  setHash: (hash: string | null) => void;
  reset: () => void;
}

type TransactionStore = TransactionState & TransactionActions;

export const useTransaction = create<TransactionStore>((set) => ({
  pending: false,
  hash: null,
  
  setPending: (pending: boolean) => set({ pending }),
  setHash: (hash: string | null) => set({ hash }),
  reset: () => set({ pending: false, hash: null }),
}));