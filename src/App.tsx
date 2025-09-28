import { Navigation } from "@/components/shared/Navigation";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { Toaster } from "@/components/ui/toaster";
import { TooltipProvider } from "@/components/ui/tooltip";
import { VaultProvider } from "@/hooks/useVaultContext";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import About from "./pages/About";
import Governance from "./pages/Governance";
import HowItWorks from "./pages/HowItWorks";
import Index from "./pages/Index";
import NotFound from "./pages/NotFound";
import Vault from "./pages/Vault";
import Verify from "./pages/Verify";
import Winners from "./pages/Winners";

const queryClient = new QueryClient();

const App = () => {

  return (
    <QueryClientProvider client={queryClient}>
      <TooltipProvider>
        <VaultProvider>
          <Toaster />
          <Sonner />
          <BrowserRouter>
            <div className="min-h-screen bg-background">
              <Navigation />
              <Routes>
              <Route path="/" element={<Index />} />
              <Route path="/vault" element={<Vault />} />
              <Route path="/how-it-works" element={<HowItWorks />} />
              <Route path="/verify" element={<Verify />} />
              <Route path="/about" element={<About />} />
              <Route path="/winners" element={<Winners />} />
              <Route path="/governance" element={<Governance />} />
              {/* ADD ALL CUSTOM ROUTES ABOVE THE CATCH-ALL "*" ROUTE */}
              <Route path="*" element={<NotFound />} />
            </Routes>
          </div>
        </BrowserRouter>
        </VaultProvider>
      </TooltipProvider>
    </QueryClientProvider>
  );
};

export default App;
