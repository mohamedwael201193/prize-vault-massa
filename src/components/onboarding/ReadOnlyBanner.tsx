import { Alert, AlertDescription } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";
import { useWallet } from "@/hooks/useWallet";
import { Eye, Info, Wallet } from "lucide-react";

interface ReadOnlyBannerProps {
  className?: string;
}

export function ReadOnlyBanner({ className = "" }: ReadOnlyBannerProps) {
  const { connected, connect } = useWallet();

  // Don't show if wallet is connected
  if (connected) {
    return null;
  }

  return (
    <Alert className={`border-blue-200 bg-blue-50 ${className}`}>
      <Eye className="h-4 w-4 text-blue-600" />
      <AlertDescription>
        <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
          <div>
            <p className="font-medium text-blue-900">Read-Only Mode</p>
            <p className="text-sm text-blue-700">
              You're viewing AutoPrize Vault data without a connected wallet.
              Connect to deposit, withdraw, and participate in draws.
            </p>
          </div>
          <div className="flex gap-2 shrink-0">
            <Button
              size="sm"
              onClick={connect}
              className="bg-blue-600 hover:bg-blue-700 text-white"
            >
              <Wallet size={14} className="mr-1" />
              Connect Wallet
            </Button>
            <Button
              size="sm"
              variant="ghost"
              onClick={() => window.open("/how-it-works", "_blank")}
              className="text-blue-700 hover:bg-blue-100"
            >
              <Info size={14} className="mr-1" />
              Learn More
            </Button>
          </div>
        </div>
      </AlertDescription>
    </Alert>
  );
}

// Minimal version for specific components
export function ReadOnlyLabel() {
  const { connected } = useWallet();

  if (connected) {
    return null;
  }

  return (
    <div className="flex items-center gap-1 text-xs text-muted-foreground bg-muted px-2 py-1 rounded">
      <Eye size={10} />
      <span>Read-only</span>
    </div>
  );
}
