module SecurityAudit
    class DependencyNormalizer
        def self.normalize
            GemfileScanner.scan.map do |dependency|
                {
                    package: dependency[:name].downcase.strip,
                    version: dependency[:version]
                }
            end
        end
    end
end
