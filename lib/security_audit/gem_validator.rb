require "net/http"
require "json"

module SecurityAudit
  class GemValidator
    def self.valid?(package_name)
      url = URI("https://rubygems.org/api/v1/gems/#{package_name}.json")

      response = Net::HTTP.get_response(url)

      response.code == "200"
    end
  end
end
