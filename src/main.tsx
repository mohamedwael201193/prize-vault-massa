import { getRpcUrl, getVaultAddr } from "@/lib/sanity";
import { createRoot } from "react-dom/client";
import { BrowserRouter, HashRouter } from "react-router-dom";
import App from "./App.tsx";
import "./index.css";

console.info("[Vault addr]", getVaultAddr());
console.info("[RPC]", getRpcUrl());

// Use HashRouter for DeWeb deployment, BrowserRouter for local dev
const Router = import.meta.env.VITE_ROUTER_MODE === 'hash' ? HashRouter : BrowserRouter;

createRoot(document.getElementById("root")!).render(
  <Router>
    <App />
  </Router>
);
