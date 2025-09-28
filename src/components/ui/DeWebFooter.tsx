import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { BUILD_INFO, getDeWebResource, getShortHash, getShortId } from '@/lib/build'
import { Copy, ExternalLink, Globe } from 'lucide-react'
import { useEffect, useState } from 'react'
import { toast } from 'sonner'

export function DeWebFooter() {
  const [resourceInfo, setResourceInfo] = useState({ resource: 'loading...', mns: 'autoprize.massa', updated: '' })

  useEffect(() => {
    getDeWebResource().then(setResourceInfo)
  }, [])

  const copyToClipboard = (text: string, label: string) => {
    navigator.clipboard.writeText(text).then(() => {
      toast.success(`${label} copied to clipboard`)
    }).catch(() => {
      toast.error(`Failed to copy ${label}`)
    })
  }

  const shortHash = getShortHash(BUILD_INFO.COMMIT_HASH)
  const shortResource = getShortId(resourceInfo.resource)
  const isDeWebDeployed = resourceInfo.resource !== 'local-dev' && resourceInfo.resource !== 'loading...'

  return (
    <footer className="border-t bg-gray-50/80 dark:bg-gray-900/80 backdrop-blur-sm py-6 mt-auto">
      <div className="container mx-auto px-4">
        <div className="flex flex-col md:flex-row items-center justify-between gap-4">
          {/* Left: App Info */}
          <div className="flex items-center gap-3">
            <div className="flex items-center gap-2">
              <Globe className="w-4 h-4 text-blue-500" />
              <span className="font-semibold text-gray-900 dark:text-white">
                AutoPrize Vault
              </span>
            </div>
            <Badge 
              variant="outline" 
              className={isDeWebDeployed 
                ? "bg-green-100 text-green-800 border-green-300" 
                : "bg-yellow-100 text-yellow-800 border-yellow-300"
              }
            >
              {isDeWebDeployed ? 'DeWeb Hosted' : 'Local Dev'}
            </Badge>
          </div>

          {/* Center: DeWeb Info */}
          <div className="flex items-center gap-2 text-sm text-gray-600 dark:text-gray-400">
            {isDeWebDeployed && (
              <>
                <Button
                  variant="ghost"
                  size="sm"
                  className="h-auto p-1 text-blue-600 hover:text-blue-800 dark:text-blue-400"
                  onClick={() => copyToClipboard(resourceInfo.mns, 'MNS Name')}
                >
                  {resourceInfo.mns}
                  <Copy className="w-3 h-3 ml-1" />
                </Button>
                <span>•</span>
              </>
            )}
            <Button
              variant="ghost"
              size="sm"
              className="h-auto p-1 text-gray-600 hover:text-gray-800 dark:text-gray-400"
              onClick={() => copyToClipboard(resourceInfo.resource, 'Resource ID')}
            >
              Resource: {shortResource}
              <Copy className="w-3 h-3 ml-1" />
            </Button>
            <span>•</span>
            <Button
              variant="ghost"
              size="sm"
              className="h-auto p-1 text-gray-600 hover:text-gray-800 dark:text-gray-400"
              onClick={() => copyToClipboard(BUILD_INFO.COMMIT_HASH, 'Commit Hash')}
            >
              {shortHash}
              <Copy className="w-3 h-3 ml-1" />
            </Button>
          </div>

          {/* Right: Links */}
          <div className="flex items-center gap-2">
            <Button
              variant="ghost"
              size="sm"
              className="text-gray-600 hover:text-gray-800 dark:text-gray-400"
              onClick={() => window.open('https://buildnet-explorer.massa.net', '_blank')}
            >
              <ExternalLink className="w-4 h-4 mr-1" />
              Explorer
            </Button>
            {isDeWebDeployed && (
              <Button
                variant="ghost"
                size="sm"
                className="text-gray-600 hover:text-gray-800 dark:text-gray-400"
                onClick={() => window.open('/deweb', '_blank')}
              >
                DeWeb Info
              </Button>
            )}
          </div>
        </div>

        {/* Bottom: Contract & Network Info */}
        <div className="mt-4 pt-4 border-t border-gray-200 dark:border-gray-700">
          <div className="flex flex-col md:flex-row items-center justify-center gap-2 text-xs text-gray-500 dark:text-gray-400">
            <span>BuildNet Deployment</span>
            <span className="hidden md:inline">•</span>
            <Button
              variant="ghost"
              size="sm"
              className="h-auto p-0 text-xs text-gray-500 hover:text-gray-700 dark:text-gray-400"
              onClick={() => copyToClipboard(BUILD_INFO.CONTRACT_ADDRESS, 'Contract Address')}
            >
              Contract: {BUILD_INFO.CONTRACT_ADDRESS.slice(0, 20)}...
              <Copy className="w-3 h-3 ml-1" />
            </Button>
            <span className="hidden md:inline">•</span>
            <span>Community Governed Prize Vault</span>
          </div>
        </div>
      </div>
    </footer>
  )
}