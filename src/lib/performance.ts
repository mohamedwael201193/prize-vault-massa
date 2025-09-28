
// Enhanced retry utility with exponential backoff
export class RetryManager {
  private retryAttempts = new Map<string, number>();
  private backoffTimes = new Map<string, number>();
  
  async executeWithRetry<T>(
    key: string,
    operation: () => Promise<T>,
    options: {
      maxRetries?: number;
      baseDelay?: number;
      maxDelay?: number;
      exponentialBase?: number;
    } = {}
  ): Promise<T> {
    const {
      maxRetries = 3,
      baseDelay = 1000,
      maxDelay = 10000,
      exponentialBase = 2
    } = options;

    const attempts = this.retryAttempts.get(key) || 0;
    
    try {
      const result = await operation();
      // Reset on success
      this.retryAttempts.delete(key);
      this.backoffTimes.delete(key);
      return result;
    } catch (error) {
      if (attempts >= maxRetries) {
        console.error(`[RetryManager] Max retries (${maxRetries}) exceeded for ${key}:`, error);
        throw error;
      }

      const newAttempts = attempts + 1;
      this.retryAttempts.set(key, newAttempts);
      
      // Calculate exponential backoff with jitter
      const delay = Math.min(
        baseDelay * Math.pow(exponentialBase, newAttempts - 1),
        maxDelay
      );
      const jitter = Math.random() * 0.1 * delay; // 10% jitter
      const finalDelay = delay + jitter;
      
      this.backoffTimes.set(key, Date.now() + finalDelay);
      
      console.warn(`[RetryManager] Retry ${newAttempts}/${maxRetries} for ${key} in ${Math.round(finalDelay)}ms:`, error);
      
      await new Promise(resolve => setTimeout(resolve, finalDelay));
      return this.executeWithRetry(key, operation, options);
    }
  }

  isInBackoff(key: string): boolean {
    const backoffUntil = this.backoffTimes.get(key);
    return backoffUntil ? Date.now() < backoffUntil : false;
  }

  getRetryCount(key: string): number {
    return this.retryAttempts.get(key) || 0;
  }

  reset(key?: string) {
    if (key) {
      this.retryAttempts.delete(key);
      this.backoffTimes.delete(key);
    } else {
      this.retryAttempts.clear();
      this.backoffTimes.clear();
    }
  }
}

// Multi-block confirmation utility
export class BlockConfirmationWaiter {
  private provider: any;
  
  constructor(provider: any) {
    this.provider = provider;
  }

  async waitForConfirmation(
    txId: string, 
    requiredBlocks: number = 3,
    maxWaitTime: number = 30000
  ): Promise<boolean> {
    const startTime = Date.now();
    const startStatus = await this.provider.getNodeStatus();
    const startBlock = startStatus.period;
    
    console.debug(`[BlockWaiter] Starting confirmation wait for tx ${txId} at block ${startBlock}, need ${requiredBlocks} confirmations`);
    
    return new Promise((resolve) => {
      const checkConfirmation = async () => {
        try {
          if (Date.now() - startTime > maxWaitTime) {
            console.warn(`[BlockWaiter] Timeout waiting for confirmation of tx ${txId}`);
            resolve(false);
            return;
          }

          const currentStatus = await this.provider.getNodeStatus();
          const currentBlock = currentStatus.period;
          const confirmations = currentBlock - startBlock;
          
          console.debug(`[BlockWaiter] Tx ${txId} has ${confirmations}/${requiredBlocks} confirmations`);
          
          if (confirmations >= requiredBlocks) {
            console.debug(`[BlockWaiter] Tx ${txId} confirmed with ${confirmations} blocks`);
            resolve(true);
          } else {
            setTimeout(checkConfirmation, 1000); // Check every second
          }
        } catch (error) {
          console.error(`[BlockWaiter] Error checking confirmation:`, error);
          setTimeout(checkConfirmation, 2000); // Retry in 2 seconds on error
        }
      };
      
      checkConfirmation();
    });
  }
}

// Performance monitoring utility
export class PerformanceMonitor {
  private static instance: PerformanceMonitor;
  private metrics = new Map<string, { count: number; totalTime: number; failures: number }>();
  
  static getInstance(): PerformanceMonitor {
    if (!this.instance) {
      this.instance = new PerformanceMonitor();
    }
    return this.instance;
  }

  async measure<T>(operation: string, fn: () => Promise<T>): Promise<T> {
    const start = performance.now();
    const metric = this.metrics.get(operation) || { count: 0, totalTime: 0, failures: 0 };
    
    try {
      const result = await fn();
      const duration = performance.now() - start;
      
      metric.count++;
      metric.totalTime += duration;
      this.metrics.set(operation, metric);
      
      console.debug(`[PerformanceMonitor] ${operation}: ${Math.round(duration)}ms (avg: ${Math.round(metric.totalTime / metric.count)}ms)`);
      
      return result;
    } catch (error) {
      const duration = performance.now() - start;
      metric.count++;
      metric.totalTime += duration;
      metric.failures++;
      this.metrics.set(operation, metric);
      
      console.error(`[PerformanceMonitor] ${operation} failed in ${Math.round(duration)}ms:`, error);
      throw error;
    }
  }

  getMetrics(): Record<string, { avgTime: number; successRate: number; totalCalls: number }> {
    const result: Record<string, { avgTime: number; successRate: number; totalCalls: number }> = {};
    
    for (const [operation, metric] of this.metrics) {
      result[operation] = {
        avgTime: Math.round(metric.totalTime / metric.count),
        successRate: ((metric.count - metric.failures) / metric.count) * 100,
        totalCalls: metric.count
      };
    }
    
    return result;
  }

  reset() {
    this.metrics.clear();
  }
}

// Enhanced loading states
export interface LoadingState {
  isLoading: boolean;
  operation?: string;
  progress?: number;
  stage?: string;
  error?: string;
  retryCount?: number;
}

export const createLoadingState = (
  isLoading = false, 
  operation?: string, 
  stage?: string, 
  progress?: number
): LoadingState => ({
  isLoading,
  operation,
  stage,
  progress,
  retryCount: 0
});