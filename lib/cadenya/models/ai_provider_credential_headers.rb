# frozen_string_literal: true

module Cadenya
  module Models
    class AIProviderCredentialHeaders < Cadenya::Internal::Type::BaseModel
      # @!attribute headers
      #   CredentialHeaders carries arbitrary HTTP headers sent with every request to the
      #   provider (e.g. {"Authorization": "Bearer ...", "X-Api-Key": "..."}).
      #
      #   @return [Cadenya::Models::AIProviderCredentialHeaders::Headers]
      required :headers, -> { Cadenya::AIProviderCredentialHeaders::Headers }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::AIProviderCredentialHeaders::Type]
      required :type, enum: -> { Cadenya::AIProviderCredentialHeaders::Type }

      # @!method initialize(headers:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AIProviderCredentialHeaders} for more details.
      #
      #   @param headers [Cadenya::Models::AIProviderCredentialHeaders::Headers] CredentialHeaders carries arbitrary HTTP headers sent with every request to
      #
      #   @param type [Symbol, Cadenya::Models::AIProviderCredentialHeaders::Type]

      # @see Cadenya::Models::AIProviderCredentialHeaders#headers
      class Headers < Cadenya::Internal::Type::BaseModel
        # @!attribute headers
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :headers, Cadenya::Internal::Type::HashOf[String]

        # @!method initialize(headers: nil)
        #   CredentialHeaders carries arbitrary HTTP headers sent with every request to the
        #   provider (e.g. {"Authorization": "Bearer ...", "X-Api-Key": "..."}).
        #
        #   @param headers [Hash{Symbol=>String}]
      end

      # @see Cadenya::Models::AIProviderCredentialHeaders#type
      module Type
        extend Cadenya::Internal::Type::Enum

        HEADERS = :headers

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
