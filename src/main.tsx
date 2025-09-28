import { createRoot } from "react-dom/client";
import App from "./App.tsx";
import "./index.css";
import { getVaultAddr, getRpcUrl } from "@/lib/sanity";

console.info("[Vault addr]", getVaultAddr());
console.info("[RPC]", getRpcUrl());

createRoot(document.getElementById("root")!).render(<App />);
