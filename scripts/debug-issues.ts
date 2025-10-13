#!/usr/bin/env npx tsx

import { Args, JsonRpcProvider, SmartContract } from '@massalabs/massa-web3';
import dotenv from 'dotenv';

// Load environment variables from main directory
dotenv.config({ path: '../.env' });

const RPC_URL = "https://buildnet.massa.net/api/v2";
const CONTRACT_ADDRESS = "AS13fFdTwt9zEg6mpZeDqip9xUJnYopfByNUCTX8ZLRPJfzHzJkm";

async function debugIssues() {
  console.log('🔍 Debugging AutoPrize Vault Issues...\n');

  try {
    // Create provider
    const provider = new JsonRpcProvider(RPC_URL, 'BUILDNET');
    const contract = new SmartContract(provider, CONTRACT_ADDRESS);

    console.log(`📡 Connected to: ${RPC_URL}`);
    console.log(`📋 Contract: ${CONTRACT_ADDRESS}\n`);

    // Check vault stats
    console.log('📊 Checking Vault Statistics...');
    try {
      const statsResult = await contract.read('getVaultStats', new Args());
      const statsData = JSON.parse(statsResult);
      console.log('✅ Vault Stats:', {
        tvl: `${(Number(statsData.tvl) / 1e9).toFixed(2)} MAS`,
        prizePool: `${(Number(statsData.prizePool) / 1e9).toFixed(2)} MAS`,
        participants: statsData.participants,
        drawCount: statsData.drawCount,
        nextDrawPeriod: statsData.nextDrawPeriod,
        drawPeriods: statsData.drawPeriods,
        lastDrawPeriod: statsData.lastDrawPeriod
      });
    } catch (error) {
      console.error('❌ Failed to get vault stats:', error);
    }

    // Check if draws are still happening
    console.log('\n🎯 Checking Draw Status...');
    try {
      const nodeStatus = await provider.getNodeStatus();
      const currentPeriod = nodeStatus.last_executed_final_slot?.period || 0;
      console.log(`⏰ Current Period: ${currentPeriod}`);

      // Check last few draws
      console.log('\n🏆 Checking Recent Draws...');
      for (let i = 104; i >= 95; i--) {
        try {
          const drawArgs = new Args().addU64(BigInt(i));
          const drawResult = await contract.read('getDraw', drawArgs);
          const drawData = JSON.parse(drawResult);
          
          if (drawData && !drawData.error) {
            console.log(`Draw ${i}:`, {
              period: drawData.period,
              winner: drawData.winner?.slice(0, 10) + '...',
              prize: `${(Number(drawData.prize) / 1e9).toFixed(3)} MAS`,
              seed: drawData.seed?.slice(0, 10) + '...'
            });
          }
        } catch (e) {
          console.log(`Draw ${i}: Not found or error`);
        }
      }
    } catch (error) {
      console.error('❌ Failed to check draw status:', error);
    }

    console.log('\n🔧 Diagnosis:');
    console.log('1. Check if autonomous scheduling is still active');
    console.log('2. Verify prize pool has sufficient funds');
    console.log('3. Check if contract hit any limits or errors');
    console.log('\n💡 Recommendations:');
    console.log('1. Restart autonomous draws if stopped');
    console.log('2. Add more funds to prize pool if depleted');
    console.log('3. Fix frontend caching by adding cache-busting headers');

  } catch (error) {
    console.error('❌ Debug failed:', error);
  }
}

debugIssues().catch(console.error);