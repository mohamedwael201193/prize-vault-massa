import { Button } from '@/components/ui/button';
import { Tooltip, TooltipContent, TooltipProvider, TooltipTrigger } from '@/components/ui/tooltip';
import { cn } from '@/lib/utils';
import { Check, Copy } from 'lucide-react';
import React, { useState } from 'react';

interface CopyToClipboardProps {
  text: string;
  children?: React.ReactNode;
  className?: string;
  size?: 'sm' | 'lg' | 'default' | 'icon';
  variant?: 'default' | 'outline' | 'ghost' | 'link';
  showText?: boolean;
  truncateText?: number;
}

export function CopyToClipboard({
  text,
  children,
  className,
  size = 'sm',
  variant = 'ghost',
  showText = true,
  truncateText
}: CopyToClipboardProps) {
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(text);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch (error) {
      console.error('Failed to copy to clipboard:', error);
      // Fallback for older browsers
      const textArea = document.createElement('textarea');
      textArea.value = text;
      document.body.appendChild(textArea);
      textArea.select();
      try {
        document.execCommand('copy');
        setCopied(true);
        setTimeout(() => setCopied(false), 2000);
      } catch (fallbackError) {
        console.error('Fallback copy failed:', fallbackError);
      } finally {
        document.body.removeChild(textArea);
      }
    }
  };

  const displayText = truncateText && text.length > truncateText 
    ? `${text.substring(0, truncateText)}...`
    : text;

  if (children) {
    return (
      <TooltipProvider>
        <Tooltip>
          <TooltipTrigger asChild>
            <Button
              variant={variant}
              size={size}
              onClick={handleCopy}
              className={cn('gap-2', className)}
            >
              {children}
              {copied ? <Check size={14} className="text-green-500" /> : <Copy size={14} />}
            </Button>
          </TooltipTrigger>
          <TooltipContent>
            <p>{copied ? 'Copied!' : 'Copy to clipboard'}</p>
          </TooltipContent>
        </Tooltip>
      </TooltipProvider>
    );
  }

  return (
    <TooltipProvider>
      <Tooltip>
        <TooltipTrigger asChild>
          <Button
            variant={variant}
            size={size}
            onClick={handleCopy}
            className={cn('gap-2 font-mono', className)}
          >
            {showText && <span className="text-sm">{displayText}</span>}
            {copied ? <Check size={14} className="text-green-500" /> : <Copy size={14} />}
          </Button>
        </TooltipTrigger>
        <TooltipContent>
          <p>{copied ? 'Copied!' : 'Copy to clipboard'}</p>
          {truncateText && text.length > truncateText && (
            <p className="text-xs text-muted-foreground mt-1 font-mono break-all max-w-xs">
              {text}
            </p>
          )}
        </TooltipContent>
      </Tooltip>
    </TooltipProvider>
  );
}

interface AddressCopyProps {
  address: string;
  className?: string;
  showFull?: boolean;
}

export function AddressCopy({ address, className, showFull = false }: AddressCopyProps) {
  const displayAddress = showFull ? address : `${address.slice(0, 6)}...${address.slice(-4)}`;
  
  return (
    <CopyToClipboard
      text={address}
      className={cn('text-muted-foreground hover:text-foreground', className)}
      truncateText={showFull ? undefined : 42}
    >
      {displayAddress}
    </CopyToClipboard>
  );
}

interface TransactionHashCopyProps {
  txHash: string;
  className?: string;
  explorerUrl?: string;
}

export function TransactionHashCopy({ txHash, className, explorerUrl }: TransactionHashCopyProps) {
  const displayHash = `${txHash.slice(0, 8)}...${txHash.slice(-8)}`;
  
  return (
    <div className="flex items-center gap-2">
      <CopyToClipboard
        text={txHash}
        className={cn('text-muted-foreground hover:text-foreground', className)}
        truncateText={66}
      >
        {displayHash}
      </CopyToClipboard>
      {explorerUrl && (
        <Button
          variant="ghost"
          size="sm"
          onClick={() => window.open(`${explorerUrl}/tx/${txHash}`, '_blank')}
          className="p-1 h-auto"
        >
          <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
          </svg>
        </Button>
      )}
    </div>
  );
}