// Test script to verify the new contract is working
import { Args, Client, SmartContract } from '@massalabs/massa-web3';

async function testContract() {
  try {
    console.log('Testing contract at: AS1UBjvVGLH7PzTS2DxZRVmW5UXQN6i4fV1ig3czdkSCDT93YZG1');
    
    const client = Client.buildnet();
    const sc = new SmartContract(client, 'AS1UBjvVGLH7PzTS2DxZRVmW5UXQN6i4fV1ig3czdkSCDT93YZG1');
    
    console.log('Calling getVaultStats...');
    const stats = await sc.read('getVaultStats', new Args());
    console.log('Stats response:', stats);
    
    console.log('Contract is working correctly!');
  } catch (error) {
    console.error('Contract test failed:', error);
  }
}

testContract();