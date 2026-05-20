require "net/http"
require "json"

module SecurityAudit
    class CveClient
        BASE_URL = "https://services.nvd.nist.gov/rest/json/cves/2.0"

        def self.search(package_name)
            url = URI("#{BASE_URL}?keywordSearch=#{package_name}")

            response = Net::HTTP.get(url)
            JSON.parse(response)
        end
    end
end
