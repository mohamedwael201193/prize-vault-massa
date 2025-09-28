// Build manifest for DeWeb deployment tracking
export const BUILD_INFO = {
  COMMIT_HASH: import.meta.env.VITE_COMMIT_HASH || 'local-dev',
  BUILD_TIME: import.meta.env.VITE_BUILD_TIME || new Date().toISOString(),
  ROUTER_MODE: import.meta.env.VITE_ROUTER_MODE || 'browser',
  VERSION: '3.0.0',
  NETWORK: 'BuildNet',
  CONTRACT_ADDRESS: 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz'
};

// Runtime DeWeb resource info
export interface DeWebResource {
  resource: string;
  mns: string;
  updated: string;
}

let cachedResource: DeWebResource | null = null;

export async function getDeWebResource(): Promise<DeWebResource> {
  if (cachedResource) return cachedResource;
  
  try {
    const response = await fetch('/resource.json');
    const data = await response.json();
    cachedResource = {
      resource: data.resource || 'local-dev',
      mns: data.mns || 'autoprize.massa',
      updated: data.updated || new Date().toISOString()
    };
    return cachedResource;
  } catch (error) {
    console.warn('Could not load DeWeb resource info:', error);
    return {
      resource: 'local-dev',
      mns: 'autoprize.massa', 
      updated: new Date().toISOString()
    };
  }
}

export function getShortId(fullId: string): string {
  if (fullId === 'local-dev') return 'dev';
  return fullId.length > 12 ? `${fullId.slice(0, 6)}...${fullId.slice(-4)}` : fullId;
}

export function getShortHash(hash: string): string {
  if (hash === 'local-dev') return 'dev';
  return hash.length > 8 ? hash.slice(0, 7) : hash;
}