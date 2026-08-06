# frozen_string_literal: true

module Cadenya
  module Models
    class AIProviderCredentialAPIKey < Cadenya::Internal::Type::BaseModel
      # @!attribute api_key
      #   CredentialAPIKey carries a single bearer/header API key.
      #
      #   @return [Cadenya::Models::AIProviderCredentialAPIKey::APIKey]
      required :api_key, -> { Cadenya::AIProviderCredentialAPIKey::APIKey }, api_name: :apiKey

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::AIProviderCredentialAPIKey::Type]
      required :type, enum: -> { Cadenya::AIProviderCredentialAPIKey::Type }

      # @!method initialize(api_key:, type:)
      #   @param api_key [Cadenya::Models::AIProviderCredentialAPIKey::APIKey] CredentialAPIKey carries a single bearer/header API key.
      #
      #   @param type [Symbol, Cadenya::Models::AIProviderCredentialAPIKey::Type]

      # @see Cadenya::Models::AIProviderCredentialAPIKey#api_key
      class APIKey < Cadenya::Internal::Type::BaseModel
        # @!attribute api_key
        #
        #   @return [String, nil]
        optional :api_key, String, api_name: :apiKey

        # @!method initialize(api_key: nil)
        #   CredentialAPIKey carries a single bearer/header API key.
        #
        #   @param api_key [String]
      end

      # @see Cadenya::Models::AIProviderCredentialAPIKey#type
      module Type
        extend Cadenya::Internal::Type::Enum

        API_KEY = :apiKey

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
