import fs from 'fs';
import path from 'path';

async function deployToDeWeb() {
  console.log('🚀 Deploying AutoPrize Vault to DeWeb...\n');
  
  try {
    // Show deployment info
    const distPath = './dist';
    const files = fs.readdirSync(distPath, { recursive: true });
    
    console.log('📁 Files ready for deployment:');
    files.forEach(file => {
      const filePath = path.join(distPath, file.toString());
      if (fs.statSync(filePath).isFile()) {
        const size = fs.statSync(filePath).size;
        console.log(`   ${file} (${(size/1024).toFixed(1)} KB)`);
      }
    });
    
    console.log('\n✅ Build is ready for deployment!');
    console.log('\n🎯 Deployment Instructions:');
    console.log('1. Open Massa Station');
    console.log('2. Go to DeWeb section');
    console.log('3. Click on your "autoprize.massa" domain');
    console.log('4. Look for "Update Website" or "Deploy" button');
    console.log('5. Select the entire "dist" folder');
    console.log('6. Confirm deployment\n');
    
    console.log('🔗 Your domain: autoprize.massa');
    console.log('🌐 Will be accessible at: https://autoprize.massa.net/');
    console.log('\n🎉 Your AutoPrize Vault includes:');
    console.log('   ✅ Real 31 MAS deposits with autonomous operations');
    console.log('   ✅ Professional UI with nanoMAS precision');
    console.log('   ✅ Working fairness verification');
    console.log('   ✅ Live blockchain data integration');
    
  } catch (error: any) {
    console.error('❌ Error:', error.message);
  }
}

deployToDeWeb().catch(console.error);