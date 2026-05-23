module SecurityAudit
    class DashboardController < ActionController::Base
        def index
            #@results = VulnerabilityScanner.scan
            #render plain: "Security Audit funcionando"
            @results = VulnerabilityScanner.scan.uniq do |result|
            [result[:package], result[:version]]
            end
        end
    end
end
