require "net/http"

module SecurityAudit
  class GemValidator
    def self.valid?(package_name)
      url = URI("https://rubygems.org/api/v1/gems/#{package_name}.json")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.open_timeout = 5
      http.read_timeout = 10

      response = http.get(url.request_uri)

      response.code == "200"
    end
  end
end
