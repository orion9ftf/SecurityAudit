require "net/http"
require "json"

module SecurityAudit
  class CveClient
    BASE_URL = "https://services.nvd.nist.gov/rest/json/cves/2.0"

    def self.search(package_name)
      url = URI("#{BASE_URL}?keywordSearch=#{package_name}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.open_timeout = 5
      http.read_timeout = 10

      response = http.get(url.request_uri)

      return {} unless response.code == "200"

      JSON.parse(response.body)
    end
  end
end
