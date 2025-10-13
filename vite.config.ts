import react from "@vitejs/plugin-react-swc";
import { componentTagger } from "lovable-tagger";
import path from "path";
import { defineConfig } from "vite";

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => ({
  server: {
    host: "::",
    port: 8080,
  },
  plugins: [react(), mode === "development" && componentTagger()].filter(Boolean),
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
  build: {
    rollupOptions: {
      output: {
        // Add timestamp to asset names for cache busting
        assetFileNames: (assetInfo) => {
          if (!assetInfo.name) return '[name].[ext]';
          const info = assetInfo.name.split('.');
          const ext = info[info.length - 1];
          const name = info.slice(0, -1).join('.');
          return `${name}-${Date.now()}.${ext}`;
        },
        chunkFileNames: `[name]-${Date.now()}.js`,
        entryFileNames: `[name]-${Date.now()}.js`,
      },
    },
  },
}));
