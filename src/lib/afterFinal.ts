// src/lib/afterFinal.ts
type Fetchers<T> = { get: () => Promise<T>; changed: (before: T, after: T) => boolean };

export async function waitForChange<T>(f: Fetchers<T>, tries = 3, delayMs = 1200): Promise<boolean> {
  try {
    const before = await f.get();
    for (let i = 0; i < tries; i++) {
      await new Promise(r => setTimeout(r, delayMs));
      const after = await f.get();
      if (f.changed(before, after)) return true;
    }
  } catch { /* ignore */ }
  return false;
}
