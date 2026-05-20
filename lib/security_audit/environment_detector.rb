module SecurityAudit
    class EnvironmentDetector
        def self.info
            {
                ruby_version: RUBY_VERSION,
                rails_version: Rails.version
            }
        end
    end
end
