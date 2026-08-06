# frozen_string_literal: true

module Cadenya
  module Models
    class AIProviderConfigOpenrouter < Cadenya::Internal::Type::BaseModel
      # @!attribute openrouter
      #   OpenRouterConfig holds OpenRouter-specific settings.
      #
      #   @return [Cadenya::Models::AIProviderConfigOpenrouter::Openrouter]
      required :openrouter, -> { Cadenya::AIProviderConfigOpenrouter::Openrouter }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::AIProviderConfigOpenrouter::Type]
      required :type, enum: -> { Cadenya::AIProviderConfigOpenrouter::Type }

      # @!method initialize(openrouter:, type:)
      #   @param openrouter [Cadenya::Models::AIProviderConfigOpenrouter::Openrouter] OpenRouterConfig holds OpenRouter-specific settings.
      #
      #   @param type [Symbol, Cadenya::Models::AIProviderConfigOpenrouter::Type]

      # @see Cadenya::Models::AIProviderConfigOpenrouter#openrouter
      class Openrouter < Cadenya::Internal::Type::BaseModel
        # @!attribute region
        #   Data-residency region (e.g. "us", "eu"). Empty uses the provider default.
        #
        #   @return [String, nil]
        optional :region, String

        # @!method initialize(region: nil)
        #   OpenRouterConfig holds OpenRouter-specific settings.
        #
        #   @param region [String] Data-residency region (e.g. "us", "eu"). Empty uses the provider default.
      end

      # @see Cadenya::Models::AIProviderConfigOpenrouter#type
      module Type
        extend Cadenya::Internal::Type::Enum

        OPENROUTER = :openrouter

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
