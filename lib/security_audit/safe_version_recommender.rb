module SecurityAudit
  class SafeVersionRecommender
    def self.recommend(current_version, vulnerabilities)
      affected_ranges = []

      vulnerabilities.each do |vuln|
        configs = vuln.dig("cve", "configurations") || []

        configs.each do |config|
          nodes = config["nodes"] || []

          nodes.each do |node|
            cpes = node["cpeMatch"] || []

            cpes.each do |cpe|
              affected_ranges << "< #{cpe['versionEndExcluding']}" if cpe['versionEndExcluding']
            end
          end
        end
      end

      # temporal
      Gem::Version.new(current_version).bump.to_s
    end
  end
end
