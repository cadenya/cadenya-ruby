# frozen_string_literal: true

module Cadenya
  module Models
    class AIProviderConfigOpenAICompatible < Cadenya::Internal::Type::BaseModel
      # @!attribute openai_compatible
      #   OpenAICompatibleConfig configures a generic endpoint that speaks the OpenAI Chat
      #   Completions API. The base URL is required and its model catalog is discovered
      #   live via GET {base_url}/models.
      #
      #   @return [Cadenya::Models::AIProviderConfigOpenAICompatible::OpenAICompatible]
      required :openai_compatible,
               -> { Cadenya::AIProviderConfigOpenAICompatible::OpenAICompatible },
               api_name: :openaiCompatible

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::AIProviderConfigOpenAICompatible::Type]
      required :type, enum: -> { Cadenya::AIProviderConfigOpenAICompatible::Type }

      # @!method initialize(openai_compatible:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AIProviderConfigOpenAICompatible} for more details.
      #
      #   @param openai_compatible [Cadenya::Models::AIProviderConfigOpenAICompatible::OpenAICompatible] OpenAICompatibleConfig configures a generic endpoint that speaks the OpenAI
      #
      #   @param type [Symbol, Cadenya::Models::AIProviderConfigOpenAICompatible::Type]

      # @see Cadenya::Models::AIProviderConfigOpenAICompatible#openai_compatible
      class OpenAICompatible < Cadenya::Internal::Type::BaseModel
        # @!attribute base_url
        #
        #   @return [String]
        required :base_url, String, api_name: :baseUrl

        # @!method initialize(base_url:)
        #   OpenAICompatibleConfig configures a generic endpoint that speaks the OpenAI Chat
        #   Completions API. The base URL is required and its model catalog is discovered
        #   live via GET {base_url}/models.
        #
        #   @param base_url [String]
      end

      # @see Cadenya::Models::AIProviderConfigOpenAICompatible#type
      module Type
        extend Cadenya::Internal::Type::Enum

        OPENAI_COMPATIBLE = :openaiCompatible

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
