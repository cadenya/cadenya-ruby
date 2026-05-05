# frozen_string_literal: true

require_relative "lib/cadenya/version"

Gem::Specification.new do |s|
  s.name = "cadenya"
  s.version = Cadenya::VERSION
  s.summary = "Ruby library to access the Cadenya API"
  s.authors = ["Cadenya"]
  s.email = "support@cadenya.com"
  s.homepage = "https://gemdocs.org/gems/cadenya"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/stainless-sdks/cadenya-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "cgi"
  s.add_dependency "connection_pool"
  s.add_dependency "standardwebhooks"
end
