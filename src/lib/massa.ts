// Massa wallet integration with typed JsonRPC client
interface MassaAccount {
  address: string;
  balance: string;
}

interface MassaProvider {
  isConnected(): Promise<boolean>;
  connect(): Promise<string[]>;
  disconnect(): Promise<void>;
  getAccounts(): Promise<string[]>;
  getBalance(address: string): Promise<string>;
  callSmartContract(params: {
    contractAddress: string;
    functionName: string;
    parameter?: Uint8Array;
    coins: string;
  }): Promise<string>;
  readSmartContract(params: {
    contractAddress: string;
    functionName: string;
    parameter?: Uint8Array;
  }): Promise<string>;
}

declare global {
  interface Window {
    massa?: MassaProvider;
  }
}

// Contract configuration
const CONTRACT_ADDRESS = "AU1YourContractAddressHere123456789"; // Replace with actual contract address

class MassaClient {
  private provider: MassaProvider | null = null;

  constructor() {
    this.provider = window.massa || null;
  }

  isWalletAvailable(): boolean {
    return !!window.massa;
  }

  async connectWallet(): Promise<string> {
    if (!this.provider) {
      throw new Error("Massa Station not installed. Please install Massa Station extension.");
    }

    try {
      const accounts = await this.provider.connect();
      if (accounts.length === 0) {
        throw new Error("No accounts found. Please create an account in Massa Station.");
      }
      return accounts[0];
    } catch (error) {
      console.error("Failed to connect wallet:", error);
      throw new Error("Failed to connect to Massa Station. Please try again.");
    }
  }

  async getAccount(): Promise<MassaAccount | null> {
    if (!this.provider) return null;

    try {
      const accounts = await this.provider.getAccounts();
      if (accounts.length === 0) return null;

      const address = accounts[0];
      const balance = await this.provider.getBalance(address);
      
      return { address, balance };
    } catch (error) {
      console.error("Failed to get account:", error);
      return null;
    }
  }

  async isConnected(): Promise<boolean> {
    if (!this.provider) return false;
    
    try {
      return await this.provider.isConnected();
    } catch (error) {
      console.error("Failed to check connection:", error);
      return false;
    }
  }

  async disconnect(): Promise<void> {
    if (!this.provider) return;
    
    try {
      await this.provider.disconnect();
    } catch (error) {
      console.error("Failed to disconnect:", error);
      throw error;
    }
  }

  // Convert MAS amount to smallest unit (nano-MAS)
  private masToNanoMas(amount: number): string {
    return (amount * 1_000_000_000).toString();
  }

  // Encode u64 parameter for smart contract calls
  private encodeU64(value: number): Uint8Array {
    const buffer = new ArrayBuffer(8);
    const view = new DataView(buffer);
    view.setBigUint64(0, BigInt(value), true); // little-endian
    return new Uint8Array(buffer);
  }

  async callSC(method: string, coins: number, params?: number): Promise<string> {
    if (!this.provider) {
      throw new Error("Wallet not connected");
    }

    try {
      const parameter = params !== undefined ? this.encodeU64(params) : undefined;
      
      const txHash = await this.provider.callSmartContract({
        contractAddress: CONTRACT_ADDRESS,
        functionName: method,
        parameter,
        coins: this.masToNanoMas(coins)
      });

      return txHash;
    } catch (error) {
      console.error(`Failed to call ${method}:`, error);
      throw new Error(`Transaction failed: ${error instanceof Error ? error.message : 'Unknown error'}`);
    }
  }

  async readOnly(method: string, params?: number): Promise<string> {
    if (!this.provider) {
      throw new Error("Wallet not connected");
    }

    try {
      const parameter = params !== undefined ? this.encodeU64(params) : undefined;
      
      const result = await this.provider.readSmartContract({
        contractAddress: CONTRACT_ADDRESS,
        functionName: method,
        parameter
      });

      return result;
    } catch (error) {
      console.error(`Failed to read ${method}:`, error);
      throw new Error(`Read operation failed: ${error instanceof Error ? error.message : 'Unknown error'}`);
    }
  }

  // Specific contract methods
  async deposit(amount: number): Promise<string> {
    if (amount < 0.01) {
      throw new Error("Minimum deposit amount is 0.01 MAS");
    }
    return this.callSC('deposit', amount);
  }

  async withdraw(shares: number): Promise<string> {
    if (shares <= 0) {
      throw new Error("Invalid shares amount");
    }
    return this.callSC('withdraw', 0, shares);
  }

  // Utility function to format address for display
  formatAddress(address: string): string {
    if (address.length <= 10) return address;
    return `${address.slice(0, 6)}...${address.slice(-4)}`;
  }
}

export const massaClient = new MassaClient();
export type { MassaAccount };