# Ahora conectamos el escáner con un servicio que prepare las consultas de vulnerabilidades. Aún no consultaremos NVD; primero normalizamos los datos.
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
