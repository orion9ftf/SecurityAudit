module SecurityAudit
  class CveFilter
    def self.filter(dependency, cves)
      return [] unless cves["vulnerabilities"]

      cves["vulnerabilities"].select do |vuln|

        configs = vuln.dig("cve", "configurations") || []

        configs.any? do |config|
          nodes = config["nodes"] || []

          nodes.any? do |node|
            cpes = node["cpeMatch"] || []

            cpes.any? do |cpe|
              criteria = cpe["criteria"]

              next false unless criteria

              criteria.downcase.include?(
                dependency[:package].downcase
              )
            end
          end
        end
      end
    end
  end
end
