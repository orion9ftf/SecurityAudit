module SecurityAudit
  class CveFilter
    def self.filter(dependency, cves)
      return [] unless cves["vulnerabilities"]

      cves["vulnerabilities"]
    end
  end
end
