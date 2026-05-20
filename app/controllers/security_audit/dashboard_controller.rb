module SecurityAudit
    class DashboardController < ApplicationController
        def index
            @results = VulnerabilityScanner.scan
        end
    end
end
