// Simple localStorage persistence for vault data
export const STORAGE_KEY = 'autoprize-vault-cache';

export const saveVaultData = (data: any) => {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify({
      ...data,
      timestamp: Date.now()
    }));
  } catch (e) {
    console.warn('[Cache] Failed to save to localStorage:', e);
  }
};

export const loadVaultData = () => {
  try {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (stored) {
      const parsed = JSON.parse(stored);
      // Only use cached data if it's less than 30 seconds old
      if (Date.now() - parsed.timestamp < 30000) {
        return parsed;
      }
    }
  } catch (e) {
    console.warn('[Cache] Failed to load from localStorage:', e);
  }
  return null;
};