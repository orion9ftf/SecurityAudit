module SecurityAudit
    class GemfileScanner
        def self.scan
            lockfile = Bundler.load.specs

            lockfile.map do |gem_spec|
                {
                    name: gem_spec.name,
                    version: gem_spec.version.to_s
                }
            end
        end
    end
end

