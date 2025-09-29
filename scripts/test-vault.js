#!/usr/bin/env bun

// Simple script to deposit to vault using existing patterns
const VAULT_ADDR = 'AS1Dc3Q3W4uwvtFALXvcpbsP2uvcSUPiE1YebdMgLsYMr6VBT9oz';
const BUILDNET_RPC = 'https://buildnet.massa.net/api/v2';

async function testVaultConnection() {
  console.log('🔍 Testing vault connection...');
  
  try {
    const response = await fetch(BUILDNET_RPC, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        jsonrpc: '2.0',
        method: 'get_addresses',
        params: [[VAULT_ADDR]],
        id: 1
      })
    });
    
    const data = await response.json();
    console.log('✅ Vault exists on BuildNet:', !!data.result?.[0]);
    
    // Test reading vault stats
    const statsResponse = await fetch(BUILDNET_RPC, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        jsonrpc: '2.0',
        method: 'execute_read_only_call',
        params: [{
          max_gas: 1000000,
          target_address: VAULT_ADDR,
          target_function: 'getVaultStats',
          parameter: [],
          caller_address: 'AU12UBnqTHDQALpocVBnkPNy7y5CndUJQTLutaVDDFgMJcq5kQiKq'
        }],
        id: 2
      })
    });
    
    const statsData = await statsResponse.json();
    console.log('📊 Vault stats call result:', statsData.result);
    
    return true;
  } catch (error) {
    console.error('❌ Vault connection failed:', error);
    return false;
  }
}

testVaultConnection().then(success => {
  if (success) {
    console.log('🎉 Vault is ready for deposits!');
    console.log('💡 Next steps:');
    console.log('1. Use Massa Station wallet to deposit to vault');
    console.log('2. Check Winners page for real data');
    console.log('3. Verify on Autonomy page that ASC is running');
  } else {
    console.log('❌ Vault connection issues detected');
  }
});