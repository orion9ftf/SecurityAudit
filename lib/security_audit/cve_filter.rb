module SecurityAudit
  class CveFilter
    def self.filter(dependency, cves)
      return [] unless cves["vulnerabilities"]

      cves["vulnerabilities"].select do |vuln|
        configs = vuln.dig("cve", "configurations") || []
        configs.any? do |config|
          nodes = config["nodes"] || []
          nodes.any? do |node|
            matches = node["cpeMatch"] || []
            matches.any? do |match|
              criteria = match["criteria"]

              next false unless criteria&.include?(
                ":#{dependency[:package]}:"
              )
              requirements = []
              requirements << ">= #{match['versionStartIncluding']}" if match["versionStartIncluding"]
              requirements << "< #{match['versionEndExcluding']}" if match["versionEndExcluding"]

              VersionMatcher.vulnerable?(
                dependency[:version],
                requirements
              )
            end
          end
        end
      end
    end
  end
end
