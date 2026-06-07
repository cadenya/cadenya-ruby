# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::AIProviderKeys#create
    class AIProviderKey < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :metadata, -> { Cadenya::ResourceMetadata }

      # @!attribute spec
      #
      #   @return [Cadenya::Models::AIProviderKeySpec]
      required :spec, -> { Cadenya::AIProviderKeySpec }

      # @!method initialize(metadata:, spec:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AIProviderKey} for more details.
      #
      #   AIProviderKey is a customer-provided (BYOK) credential for an AI provider,
      #   scoped to a workspace. The secret value is never returned in responses.
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param spec [Cadenya::Models::AIProviderKeySpec]
    end
  end
end
