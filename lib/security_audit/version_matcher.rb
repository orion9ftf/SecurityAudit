module SecurityAudit
    class VersionMatcher
        def self.vulnerable?(current_version, affected_versions)
            affected_versions.any? do |range|
                Gem::Requirement.new(range).satisfied_by?(
                    Gem::Version.new(current_version)
                )
            end
        end
    end
end
