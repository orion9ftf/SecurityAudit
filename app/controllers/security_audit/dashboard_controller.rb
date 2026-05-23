module SecurityAudit
    class DashboardController < ActionController::Base
        def index
            #@results = VulnerabilityScanner.scan
            render plain: "Security Audit funcionando"
        end
    end
end
