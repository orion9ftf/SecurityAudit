require "security_audit/version"
require "security_audit/engine"
require "security_audit/environment_detector"
require "security_audit/cve_filter"
require "security_audit/gemfile_scanner"
require "security_audit/dependency_normalizer"
require "security_audit/cve_client"
require "security_audit/version_matcher"
require "security_audit/vulnerability_scanner"

module SecurityAudit
  class Error < StandardError; end
  # ...
end
