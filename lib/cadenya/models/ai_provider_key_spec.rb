# frozen_string_literal: true

module Cadenya
  module Models
    class AIProviderKeySpec < Cadenya::Internal::Type::BaseModel
      # @!attribute api_key
      #   The provider credential. Accepted on create/update; never populated in responses
      #   (the server returns an empty value to avoid leaking it).
      #
      #   @return [String, nil]
      optional :api_key, String, api_name: :apiKey

      # @!attribute openrouter
      #   OpenRouterConfig holds OpenRouter-specific settings. Empty for now; it exists as
      #   the oneof seam so provider-specific options (region, base URL, etc.) can be
      #   added later without restructuring the spec.
      #
      #   @return [Object, nil]
      optional :openrouter, Cadenya::Internal::Type::Unknown

      # @!attribute provider
      #   The AI provider this key authenticates against.
      #
      #   @return [Symbol, Cadenya::Models::AIProviderKeySpec::Provider, nil]
      optional :provider, enum: -> { Cadenya::AIProviderKeySpec::Provider }

      # @!method initialize(api_key: nil, openrouter: nil, provider: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AIProviderKeySpec} for more details.
      #
      #   @param api_key [String] The provider credential. Accepted on create/update; never populated in
      #
      #   @param openrouter [Object] OpenRouterConfig holds OpenRouter-specific settings. Empty for now; it exists
      #
      #   @param provider [Symbol, Cadenya::Models::AIProviderKeySpec::Provider] The AI provider this key authenticates against.

      # The AI provider this key authenticates against.
      #
      # @see Cadenya::Models::AIProviderKeySpec#provider
      module Provider
        extend Cadenya::Internal::Type::Enum

        AI_PROVIDER_UNSPECIFIED = :AI_PROVIDER_UNSPECIFIED
        AI_PROVIDER_OPENROUTER = :AI_PROVIDER_OPENROUTER

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
