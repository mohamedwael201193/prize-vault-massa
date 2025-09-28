import { Badge } from "@/components/ui/badge";
import { Separator } from "@/components/ui/separator";
import { BUILD_INFO, getDeWebResource, getShortHash, getShortId } from "@/lib/build";
import { ExternalLink, Globe } from "lucide-react";
import { useEffect, useState } from "react";

export const FooterBadge = () => {
  const [resource, setResource] = useState<string>('loading...');
  const [mns, setMns] = useState<string>('autoprize.massa');

  useEffect(() => {
    getDeWebResource().then(data => {
      setResource(data.resource);
      setMns(data.mns);
    });
  }, []);

  return (
    <div className="flex flex-col sm:flex-row items-center gap-2 text-xs text-muted-foreground">
      <div className="flex items-center gap-2">
        <Badge variant="outline" className="bg-primary/5 text-primary border-primary/20">
          <Globe className="h-3 w-3 mr-1" />
          DeWeb
        </Badge>
        <Separator orientation="vertical" className="h-4" />
        <span className="font-mono">{mns}</span>
      </div>
      
      <div className="flex items-center gap-2">
        <Separator orientation="vertical" className="h-4 hidden sm:block" />
        <span>Resource: {getShortId(resource)}</span>
        <Separator orientation="vertical" className="h-4" />
        <span>Commit: {getShortHash(BUILD_INFO.COMMIT_HASH)}</span>
      </div>

      <div className="flex items-center gap-2">
        <Separator orientation="vertical" className="h-4 hidden sm:block" />
        <Badge variant="outline" className="text-xs">
          v{BUILD_INFO.VERSION}
        </Badge>
        <a 
          href={`https://buildnet-explorer.massa.net/address/${BUILD_INFO.CONTRACT_ADDRESS}`}
          target="_blank" 
          rel="noopener noreferrer"
          className="flex items-center gap-1 hover:text-primary transition-colors"
        >
          Contract
          <ExternalLink className="h-3 w-3" />
        </a>
      </div>
    </div>
  );
};