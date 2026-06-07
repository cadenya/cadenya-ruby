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

      # @!attribute provider
      #   The AI provider this key authenticates against. Currently "openrouter".
      #
      #   @return [String, nil]
      optional :provider, String

      # @!attribute region
      #   The provider region. "us" or "eu". Defaults to "us".
      #
      #   @return [String, nil]
      optional :region, String

      # @!method initialize(api_key: nil, provider: nil, region: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AIProviderKeySpec} for more details.
      #
      #   @param api_key [String] The provider credential. Accepted on create/update; never populated in
      #
      #   @param provider [String] The AI provider this key authenticates against. Currently "openrouter".
      #
      #   @param region [String] The provider region. "us" or "eu". Defaults to "us".
    end
  end
end
