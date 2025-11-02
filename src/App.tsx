import { Navigation } from "@/components/shared/Navigation";
import { DeWebFooter } from "@/components/ui/DeWebFooter";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { Toaster } from "@/components/ui/toaster";
import { TooltipProvider } from "@/components/ui/tooltip";
import { VaultProvider } from "@/hooks/useVaultContext";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { Route, Routes } from "react-router-dom";
import About from "./pages/About";
import HowItWorks from "./pages/HowItWorks";
import Index from "./pages/Index";
import NotFound from "./pages/NotFound";
import Vault from "./pages/Vault";
import Winners from "./pages/Winners";

const queryClient = new QueryClient();

const App = () => {
  return (
    <QueryClientProvider client={queryClient}>
      <TooltipProvider>
        <VaultProvider>
          <Toaster />
          <Sonner />
          <div className="min-h-screen bg-background flex flex-col">
            <Navigation />
            <main className="flex-1">
              <Routes>
                <Route path="/" element={<Index />} />
                <Route path="/vault" element={<Vault />} />
                <Route path="/winners" element={<Winners />} />
                <Route path="/how-it-works" element={<HowItWorks />} />
                <Route path="/about" element={<About />} />
                {/* ADD ALL CUSTOM ROUTES ABOVE THE CATCH-ALL "*" ROUTE */}
                <Route path="*" element={<NotFound />} />
              </Routes>
            </main>
            <DeWebFooter />
          </div>
        </VaultProvider>
      </TooltipProvider>
    </QueryClientProvider>
  );
};

export default App;
