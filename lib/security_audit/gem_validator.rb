require "net/http"

module SecurityAudit
  class GemValidator
    def self.valid?(package_name)
      url = URI("https://rubygems.org/api/v1/gems/#{package_name}.json")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.open_timeout = 15
      http.read_timeout = 30

      response = http.get(url.request_uri)

      response.code == "200"
      rescue Net::OpenTimeout, Net::ReadTimeout
      {}
    end
  end
end
