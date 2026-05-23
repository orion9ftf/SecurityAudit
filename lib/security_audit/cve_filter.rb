# module SecurityAudit
#     class CveFilter
#         def self.filter(dependency, cves)
#             cves.select do |cve|
#                 affected_versions = cve[:affected_versions] || []

#                 VersionMatcher.vulnerable?(
#                     dependency[:version],
#                     affected_versions
#                 )
#             end
#         end
#     end
# end



module SecurityAudit
  class CveFilter
    def self.filter(dependency, cves)
      return [] unless cves["vulnerabilities"]

      cves["vulnerabilities"]
    end
  end
end

