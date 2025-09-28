import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue
} from '@/components/ui/select';
import {
    getEnabledVaults,
    getVaultById,
    getVaultColorClasses
} from '@/config/vaults';
import { useVaultContext } from '@/hooks/useVaultContext';
import { CheckCircle, Clock, Coins } from 'lucide-react';

interface VaultSelectorProps {
  className?: string;
  variant?: 'compact' | 'cards';
}

export function VaultSelector({ className = '', variant = 'compact' }: VaultSelectorProps) {
  const { activeVault, setActiveVault } = useVaultContext();
  const enabledVaults = getEnabledVaults();

  if (enabledVaults.length <= 1) {
    return null; // Don't show selector if only one vault
  }

  const handleVaultChange = (vaultId: string) => {
    const vault = getVaultById(vaultId);
    if (vault) {
      setActiveVault(vault);
    }
  };

  if (variant === 'compact') {
    return (
      <div className={`flex items-center gap-3 ${className}`}>
        <span className="text-sm font-medium text-muted-foreground">
          Vault:
        </span>
        <Select 
          value={activeVault.id} 
          onValueChange={handleVaultChange}
        >
          <SelectTrigger className="w-[180px]">
            <SelectValue>
              <div className="flex items-center gap-2">
                <span>{activeVault.icon}</span>
                <span>{activeVault.name}</span>
              </div>
            </SelectValue>
          </SelectTrigger>
          <SelectContent>
            {enabledVaults.map((vault) => (
              <SelectItem key={vault.id} value={vault.id}>
                <div className="flex items-center gap-2">
                  <span>{vault.icon}</span>
                  <span>{vault.name}</span>
                  <Badge variant="outline" className="ml-auto">
                    {vault.category}
                  </Badge>
                </div>
              </SelectItem>
            ))}
          </SelectContent>
        </Select>
      </div>
    );
  }

  return (
    <div className={`space-y-4 ${className}`}>
      <h3 className="text-lg font-semibold">Select Vault</h3>
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        {enabledVaults.map((vault) => {
          const colors = getVaultColorClasses(vault.color);
          const isActive = activeVault.id === vault.id;
          
          return (
            <Card 
              key={vault.id}
              className={`cursor-pointer transition-all hover:shadow-md ${
                isActive ? `ring-2 ring-offset-2 ring-primary ${colors.border}` : ''
              }`}
              onClick={() => handleVaultChange(vault.id)}
            >
              <CardContent className="p-4">
                <div className="flex items-start justify-between mb-3">
                  <div className="flex items-center gap-2">
                    <span className="text-xl">{vault.icon}</span>
                    <div>
                      <h4 className="font-semibold">{vault.name}</h4>
                      <Badge 
                        variant="secondary" 
                        className={`${colors.light} ${colors.text}`}
                      >
                        {vault.category}
                      </Badge>
                    </div>
                  </div>
                  {isActive && (
                    <CheckCircle className="text-green-500" size={20} />
                  )}
                </div>
                
                <p className="text-sm text-muted-foreground mb-3">
                  {vault.description}
                </p>
                
                <div className="space-y-2 text-xs">
                  <div className="flex items-center justify-between">
                    <span className="flex items-center gap-1">
                      <Clock size={12} />
                      Draw Frequency
                    </span>
                    <span>{vault.drawPeriods} periods</span>
                  </div>
                  <div className="flex items-center justify-between">
                    <span className="flex items-center gap-1">
                      <Coins size={12} />
                      Min Prize
                    </span>
                    <span>{(vault.minPrize / 1e9).toFixed(2)} MAS</span>
                  </div>
                </div>
                
                {isActive && (
                  <Button 
                    size="sm" 
                    className="w-full mt-3" 
                    disabled
                  >
                    Active Vault
                  </Button>
                )}
              </CardContent>
            </Card>
          );
        })}
      </div>
    </div>
  );
}