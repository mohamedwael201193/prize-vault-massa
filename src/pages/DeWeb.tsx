import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { BUILD_INFO, getDeWebResource } from '@/lib/build'
import { CheckCircle, Clock, Copy, ExternalLink, Globe, Shield, Zap } from 'lucide-react'
import { useEffect, useState } from 'react'
import { toast } from 'sonner'

export default function DeWeb() {
  const [resourceInfo, setResourceInfo] = useState({ resource: 'loading...', mns: 'autoprize.massa', updated: '' })
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    getDeWebResource().then((info) => {
      setResourceInfo(info)
      setLoading(false)
    })
  }, [])

  const copyToClipboard = (text: string, label: string) => {
    navigator.clipboard.writeText(text).then(() => {
      toast.success(`${label} copied to clipboard`)
    }).catch(() => {
      toast.error(`Failed to copy ${label}`)
    })
  }

  const isDeWebDeployed = resourceInfo.resource !== 'local-dev' && resourceInfo.resource !== 'loading...'

  return (
    <div className="container mx-auto px-4 py-8 max-w-6xl">
      {/* Header */}
      <div className="text-center mb-12">
        <div className="flex items-center justify-center gap-3 mb-4">
          <Globe className="w-12 h-12 text-blue-500" />
          <h1 className="text-5xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent">
            DeWeb Deployment
          </h1>
        </div>
        <p className="text-xl text-gray-600 dark:text-gray-400 mb-6">
          Fully decentralized hosting on Massa blockchain infrastructure
        </p>
        <div className="flex items-center justify-center gap-4">
          <Badge 
            className={isDeWebDeployed 
              ? "bg-green-100 text-green-800 border-green-300 text-base px-4 py-2" 
              : "bg-yellow-100 text-yellow-800 border-yellow-300 text-base px-4 py-2"
            }
          >
            {isDeWebDeployed ? '🌐 Live on DeWeb' : '🔧 Local Development'}
          </Badge>
          <Badge variant="outline" className="text-base px-4 py-2">
            BuildNet Network
          </Badge>
        </div>
      </div>

      {/* Deployment Status */}
      <Card className="mb-8 border-2 border-blue-200 dark:border-blue-800">
        <CardHeader>
          <CardTitle className="flex items-center gap-3">
            <CheckCircle className="w-6 h-6 text-green-500" />
            Deployment Information
          </CardTitle>
          <CardDescription className="text-lg">
            Complete details about this decentralized deployment
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-6">
          {/* MNS Domain */}
          <div className="flex items-center justify-between p-4 bg-gradient-to-r from-blue-50 to-purple-50 dark:from-blue-900/20 dark:to-purple-900/20 rounded-lg border border-blue-200 dark:border-blue-700">
            <div>
              <h4 className="font-semibold text-lg text-blue-900 dark:text-blue-100">MNS Domain</h4>
              <p className="text-sm text-blue-700 dark:text-blue-300">
                Massa Name Service human-readable address
              </p>
            </div>
            <div className="flex items-center gap-3">
              <code className="px-4 py-2 bg-white dark:bg-gray-900 rounded-lg text-lg font-mono border">
                {resourceInfo.mns}
              </code>
              <Button
                size="lg"
                variant="outline"
                onClick={() => copyToClipboard(resourceInfo.mns, 'MNS Name')}
              >
                <Copy className="w-4 h-4" />
              </Button>
            </div>
          </div>

          {/* Resource ID */}
          <div className="flex items-center justify-between p-4 bg-gradient-to-r from-green-50 to-teal-50 dark:from-green-900/20 dark:to-teal-900/20 rounded-lg border border-green-200 dark:border-green-700">
            <div>
              <h4 className="font-semibold text-lg text-green-900 dark:text-green-100">DeWeb Resource ID</h4>
              <p className="text-sm text-green-700 dark:text-green-300">
                Immutable content identifier on blockchain
              </p>
            </div>
            <div className="flex items-center gap-3">
              <code className="px-4 py-2 bg-white dark:bg-gray-900 rounded-lg font-mono border max-w-60 truncate">
                {loading ? 'Loading...' : resourceInfo.resource}
              </code>
              <Button
                size="lg"
                variant="outline"
                onClick={() => copyToClipboard(resourceInfo.resource, 'Resource ID')}
                disabled={loading}
              >
                <Copy className="w-4 h-4" />
              </Button>
            </div>
          </div>

          {/* Smart Contract */}
          <div className="flex items-center justify-between p-4 bg-gradient-to-r from-purple-50 to-pink-50 dark:from-purple-900/20 dark:to-pink-900/20 rounded-lg border border-purple-200 dark:border-purple-700">
            <div>
              <h4 className="font-semibold text-lg text-purple-900 dark:text-purple-100">Smart Contract</h4>
              <p className="text-sm text-purple-700 dark:text-purple-300">
                AutoPrize Vault contract address
              </p>
            </div>
            <div className="flex items-center gap-3">
              <code className="px-4 py-2 bg-white dark:bg-gray-900 rounded-lg font-mono border">
                {BUILD_INFO.CONTRACT_ADDRESS.slice(0, 25)}...
              </code>
              <Button
                size="lg"
                variant="outline"
                onClick={() => copyToClipboard(BUILD_INFO.CONTRACT_ADDRESS, 'Contract Address')}
              >
                <Copy className="w-4 h-4" />
              </Button>
              <Button
                size="lg"
                variant="outline"
                onClick={() => window.open(`https://buildnet-explorer.massa.net/address/${BUILD_INFO.CONTRACT_ADDRESS}`, '_blank')}
              >
                <ExternalLink className="w-4 h-4" />
              </Button>
            </div>
          </div>

          {/* Build Information */}
          <div className="flex items-center justify-between p-4 bg-gradient-to-r from-gray-50 to-slate-50 dark:from-gray-900/20 dark:to-slate-900/20 rounded-lg border border-gray-200 dark:border-gray-700">
            <div>
              <h4 className="font-semibold text-lg text-gray-900 dark:text-gray-100">Build Information</h4>
              <p className="text-sm text-gray-700 dark:text-gray-300">
                Source code version and deployment time
              </p>
            </div>
            <div className="flex items-center gap-3">
              <div className="text-right">
                <code className="block px-4 py-1 bg-white dark:bg-gray-900 rounded font-mono border text-sm">
                  Commit: {BUILD_INFO.COMMIT_HASH}
                </code>
                <code className="block px-4 py-1 bg-white dark:bg-gray-900 rounded font-mono border text-sm mt-2">
                  Mode: {BUILD_INFO.ROUTER_MODE}
                </code>
              </div>
              <Button
                size="lg"
                variant="outline"
                onClick={() => copyToClipboard(BUILD_INFO.COMMIT_HASH, 'Commit Hash')}
              >
                <Copy className="w-4 h-4" />
              </Button>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* DeWeb Benefits */}
      <div className="grid lg:grid-cols-3 gap-8 mb-12">
        <Card className="border-2 border-blue-200 dark:border-blue-700 bg-gradient-to-br from-blue-50 to-blue-100 dark:from-blue-900/20 dark:to-blue-800/20">
          <CardHeader>
            <CardTitle className="flex items-center gap-3 text-xl">
              <Shield className="w-8 h-8 text-blue-600" />
              Censorship Resistant
            </CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-gray-700 dark:text-gray-300 leading-relaxed">
              Hosted entirely on Massa blockchain infrastructure. No single point of failure, 
              government censorship, or corporate takedowns possible.
            </p>
          </CardContent>
        </Card>

        <Card className="border-2 border-green-200 dark:border-green-700 bg-gradient-to-br from-green-50 to-green-100 dark:from-green-900/20 dark:to-green-800/20">
          <CardHeader>
            <CardTitle className="flex items-center gap-3 text-xl">
              <Zap className="w-8 h-8 text-green-600" />
              Always Available
            </CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-gray-700 dark:text-gray-300 leading-relaxed">
              Distributed across thousands of Massa network nodes worldwide. 
              99.9%+ uptime guaranteed by blockchain consensus mechanisms.
            </p>
          </CardContent>
        </Card>

        <Card className="border-2 border-purple-200 dark:border-purple-700 bg-gradient-to-br from-purple-50 to-purple-100 dark:from-purple-900/20 dark:to-purple-800/20">
          <CardHeader>
            <CardTitle className="flex items-center gap-3 text-xl">
              <Globe className="w-8 h-8 text-purple-600" />
              Truly Decentralized
            </CardTitle>
          </CardHeader>
          <CardContent>
            <p className="text-gray-700 dark:text-gray-300 leading-relaxed">
              Zero dependency on hosting providers, CDNs, or centralized infrastructure. 
              Pure peer-to-peer web hosting revolution.
            </p>
          </CardContent>
        </Card>
      </div>

      {/* How DeWeb Works */}
      <Card className="border-2 border-indigo-200 dark:border-indigo-700">
        <CardHeader>
          <CardTitle className="text-2xl">How DeWeb Deployment Works</CardTitle>
          <CardDescription className="text-lg">
            Understanding the decentralized web hosting process on Massa
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-6">
          <div className="grid md:grid-cols-2 gap-6">
            <div className="flex items-start gap-4">
              <Badge className="bg-indigo-100 text-indigo-800 text-lg px-3 py-2 font-bold">1</Badge>
              <div>
                <h4 className="font-semibold text-lg mb-2">Build & Upload</h4>
                <p className="text-gray-600 dark:text-gray-400 leading-relaxed">
                  React application built with hash routing for SPA compatibility, 
                  then uploaded to Massa blockchain using deweb-cli tool.
                </p>
              </div>
            </div>
            
            <div className="flex items-start gap-4">
              <Badge className="bg-indigo-100 text-indigo-800 text-lg px-3 py-2 font-bold">2</Badge>
              <div>
                <h4 className="font-semibold text-lg mb-2">Resource Generation</h4>
                <p className="text-gray-600 dark:text-gray-400 leading-relaxed">
                  Blockchain generates immutable Resource ID that permanently 
                  identifies and locates the deployed application content.
                </p>
              </div>
            </div>
            
            <div className="flex items-start gap-4">
              <Badge className="bg-indigo-100 text-indigo-800 text-lg px-3 py-2 font-bold">3</Badge>
              <div>
                <h4 className="font-semibold text-lg mb-2">MNS Binding</h4>
                <p className="text-gray-600 dark:text-gray-400 leading-relaxed">
                  Human-readable .massa domain name bound to Resource ID 
                  through Massa Name Service for easy access and sharing.
                </p>
              </div>
            </div>
            
            <div className="flex items-start gap-4">
              <Badge className="bg-indigo-100 text-indigo-800 text-lg px-3 py-2 font-bold">4</Badge>
              <div>
                <h4 className="font-semibold text-lg mb-2">Global Access</h4>
                <p className="text-gray-600 dark:text-gray-400 leading-relaxed">
                  Application accessible worldwide via .massa domain from 
                  any Massa-compatible browser or gateway service.
                </p>
              </div>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Technical Advantages */}
      <Card className="mt-8 bg-gradient-to-r from-yellow-50 to-orange-50 dark:from-yellow-900/10 dark:to-orange-900/10 border-2 border-yellow-200 dark:border-yellow-700">
        <CardHeader>
          <CardTitle className="text-2xl text-center">
            🏆 Why DeWeb Beats Traditional Hosting
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="grid md:grid-cols-2 gap-8">
            <div>
              <h4 className="font-semibold text-lg mb-4 text-red-700 dark:text-red-400">❌ Traditional Web Hosting</h4>
              <ul className="space-y-3 text-gray-600 dark:text-gray-400">
                <li className="flex items-center gap-3">
                  <Clock className="w-4 h-4 text-red-500" />
                  Single points of failure and downtime
                </li>
                <li className="flex items-center gap-3">
                  <Shield className="w-4 h-4 text-red-500" />
                  Subject to censorship and takedowns
                </li>
                <li className="flex items-center gap-3">
                  <Globe className="w-4 h-4 text-red-500" />
                  Relies on centralized infrastructure
                </li>
                <li className="flex items-center gap-3">
                  <Zap className="w-4 h-4 text-red-500" />
                  Dependent on hosting provider policies
                </li>
              </ul>
            </div>
            <div>
              <h4 className="font-semibold text-lg mb-4 text-green-700 dark:text-green-400">✅ DeWeb on Massa</h4>
              <ul className="space-y-3 text-gray-600 dark:text-gray-400">
                <li className="flex items-center gap-3">
                  <CheckCircle className="w-4 h-4 text-green-500" />
                  Distributed across thousands of nodes
                </li>
                <li className="flex items-center gap-3">
                  <CheckCircle className="w-4 h-4 text-green-500" />
                  Immune to censorship and control
                </li>
                <li className="flex items-center gap-3">
                  <CheckCircle className="w-4 h-4 text-green-500" />
                  Fully decentralized architecture
                </li>
                <li className="flex items-center gap-3">
                  <CheckCircle className="w-4 h-4 text-green-500" />
                  Community-governed and permissionless
                </li>
              </ul>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}