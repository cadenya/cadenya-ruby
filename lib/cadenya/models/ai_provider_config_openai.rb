# frozen_string_literal: true

module Cadenya
  module Models
    class AIProviderConfigOpenAI < Cadenya::Internal::Type::BaseModel
      # @!attribute openai
      #   OpenAIConfig holds OpenAI-specific settings.
      #
      #   @return [Cadenya::Models::AIProviderConfigOpenAI::OpenAI]
      required :openai, -> { Cadenya::AIProviderConfigOpenAI::OpenAI }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::AIProviderConfigOpenAI::Type]
      required :type, enum: -> { Cadenya::AIProviderConfigOpenAI::Type }

      # @!method initialize(openai:, type:)
      #   @param openai [Cadenya::Models::AIProviderConfigOpenAI::OpenAI] OpenAIConfig holds OpenAI-specific settings.
      #
      #   @param type [Symbol, Cadenya::Models::AIProviderConfigOpenAI::Type]

      # @see Cadenya::Models::AIProviderConfigOpenAI#openai
      class OpenAI < Cadenya::Internal::Type::BaseModel
        # @!attribute organization_id
        #   Sent as the OpenAI-Organization header when set.
        #
        #   @return [String, nil]
        optional :organization_id, String, api_name: :organizationId

        # @!attribute project_id
        #   Sent as the OpenAI-Project header when set.
        #
        #   @return [String, nil]
        optional :project_id, String, api_name: :projectId

        # @!method initialize(organization_id: nil, project_id: nil)
        #   OpenAIConfig holds OpenAI-specific settings.
        #
        #   @param organization_id [String] Sent as the OpenAI-Organization header when set.
        #
        #   @param project_id [String] Sent as the OpenAI-Project header when set.
      end

      # @see Cadenya::Models::AIProviderConfigOpenAI#type
      module Type
        extend Cadenya::Internal::Type::Enum

        OPENAI = :openai

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
