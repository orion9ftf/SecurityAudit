# ahora cves trae resultados crudos y todavía puede incluir vulnerabilidades 
# que no afectan la versión instalada.
#Creamos un filtro:

module SecurityAudit
    class CveFilter
        def self.filter(dependency, cves)
            cves.select do |cve|
                affected_versions = cve[:affected_versions] || []

                VersionMatcher.vulnerable?(
                    dependency[:version],
                    affected_versions
                )
            end
        end
    end
end
