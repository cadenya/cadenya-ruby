# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "cadenya"
  spec.version = "1.0.0"
  spec.summary = "The official Ruby SDK for the Cadenya API"
  spec.description = "Generated client for the Cadenya API: resources, pagination, SSE streaming, and webhook verification. See README.md and api.md."
  spec.authors = ["Cadenya"]
  spec.license = "Apache-2.0"
  spec.homepage = "https://cadenya.com"
  spec.files = Dir["lib/**/*.rb"] + ["README.md", "api.md"]
  spec.required_ruby_version = ">= 3.1"
  spec.metadata = {
    "homepage_uri" => "https://cadenya.com",
    "rubygems_mfa_required" => "true"
  }
  spec.add_dependency "faraday", "~> 2.0"
  # base64 left the default gem set in Ruby 3.4; webhooks.rb requires it,
  # and the root file loads webhooks eagerly.
  spec.add_dependency "base64", ">= 0.1"
end
