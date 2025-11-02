import { OnboardingTour } from "@/components/onboarding/OnboardingTour";
import { Button } from "@/components/ui/button";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { useWallet } from "@/hooks/useWallet";
import { formatAddress } from "@/lib/utils";
import { AnimatePresence, motion } from "framer-motion";
import { ChevronDown, HelpCircle, LogOut, Menu, Wallet, X } from "lucide-react";
import { useState } from "react";
import { Link, useLocation } from "react-router-dom";

export function Navigation() {
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const [showOnboarding, setShowOnboarding] = useState(false);
  const location = useLocation();
  const { connected, address, connect, disconnect } = useWallet();

  const navItems = [
    { path: "/", label: "Home" },
    { path: "/vault", label: "Vault" },
    { path: "/winners", label: "Winners" },
    { path: "/how-it-works", label: "How it Works" },
    { path: "/about", label: "About" },
  ];

  const isActive = (path: string) => location.pathname === path;

  return (
    <nav className="sticky top-0 z-50 border-b border-border/40 bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60">
      <div className="container mx-auto flex h-16 items-center justify-between px-4">
        {/* Logo */}
        <Link to="/" className="flex items-center space-x-2">
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary glow-primary">
            <span className="text-lg font-bold text-primary-foreground">A</span>
          </div>
          <span className="hidden font-bold sm:inline-block gradient-text">
            AutoPrize Vault
          </span>
        </Link>

        {/* Desktop Navigation */}
        <div className="hidden md:flex items-center space-x-8">
          {navItems.map((item) => (
            <Link
              key={item.path}
              to={item.path}
              className={`text-sm transition-colors hover:text-primary ${
                isActive(item.path)
                  ? "text-primary font-medium"
                  : "text-muted-foreground"
              }`}
            >
              {item.label}
            </Link>
          ))}
        </div>

        {/* Help & Wallet */}
        <div className="flex items-center space-x-4">
          <Button
            variant="ghost"
            size="sm"
            onClick={() => setShowOnboarding(true)}
            className="hidden sm:flex items-center gap-1 text-muted-foreground hover:text-primary"
          >
            <HelpCircle className="h-4 w-4" />
            Help
          </Button>

          {connected && address ? (
            <DropdownMenu>
              <DropdownMenuTrigger asChild>
                <Button
                  variant="outline"
                  size="sm"
                  className="flex items-center gap-2"
                >
                  <Wallet className="h-4 w-4 text-success" />
                  <span>{formatAddress(address)}</span>
                  <ChevronDown className="h-3 w-3" />
                </Button>
              </DropdownMenuTrigger>
              <DropdownMenuContent align="end">
                <DropdownMenuItem onClick={() => setShowOnboarding(true)}>
                  <HelpCircle className="mr-2 h-4 w-4" />
                  Show Tutorial
                </DropdownMenuItem>
                <DropdownMenuItem onClick={disconnect}>
                  <LogOut className="mr-2 h-4 w-4" />
                  Disconnect
                </DropdownMenuItem>
              </DropdownMenuContent>
            </DropdownMenu>
          ) : (
            <Button onClick={connect} className="pulse-primary" size="sm">
              <Wallet className="mr-2 h-4 w-4" />
              Connect Wallet
            </Button>
          )}

          {/* Mobile Menu Button */}
          <Button
            variant="ghost"
            size="sm"
            className="md:hidden"
            onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
          >
            {isMobileMenuOpen ? (
              <X className="h-5 w-5" />
            ) : (
              <Menu className="h-5 w-5" />
            )}
          </Button>
        </div>
      </div>

      {/* Mobile Navigation */}
      <AnimatePresence>
        {isMobileMenuOpen && (
          <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: "auto" }}
            exit={{ opacity: 0, height: 0 }}
            className="border-t border-border/40 bg-background md:hidden"
          >
            <div className="container mx-auto py-4">
              {navItems.map((item) => (
                <Link
                  key={item.path}
                  to={item.path}
                  className={`block px-4 py-2 text-sm transition-colors hover:text-primary ${
                    isActive(item.path)
                      ? "text-primary font-medium"
                      : "text-muted-foreground"
                  }`}
                  onClick={() => setIsMobileMenuOpen(false)}
                >
                  {item.label}
                </Link>
              ))}
              <Button
                variant="ghost"
                size="sm"
                onClick={() => {
                  setShowOnboarding(true);
                  setIsMobileMenuOpen(false);
                }}
                className="flex items-center gap-2 w-full justify-start px-4 py-2 mt-2 text-muted-foreground hover:text-primary"
              >
                <HelpCircle className="h-4 w-4" />
                Show Tutorial
              </Button>
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Onboarding Tour */}
      <OnboardingTour
        isOpen={showOnboarding}
        onClose={() => setShowOnboarding(false)}
        onComplete={() => setShowOnboarding(false)}
      />
    </nav>
  );
}
