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

              VersionMatcher.vulnerable?(
                dependency[:version],
                [
                  {
                    start: match["versionStartIncluding"],
                    end: match["versionEndExcluding"]
                  }
                ]
              )
            end
          end
        end
      end
    end
  end
end
