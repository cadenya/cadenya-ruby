# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      # @see Cadenya::Resources::ToolSets::Secrets#create
      class ToolSetSecret < Cadenya::Internal::Type::BaseModel
        # @!attribute metadata
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata]
        required :metadata, -> { Cadenya::ResourceMetadata }

        # @!attribute spec
        #
        #   @return [Cadenya::Models::ToolSets::ToolSetSecretSpec]
        required :spec, -> { Cadenya::ToolSets::ToolSetSecretSpec }

        response_only do
          # @!attribute info
          #   Tool set secret information
          #
          #   @return [Cadenya::Models::ToolSets::ToolSetSecretInfo, nil]
          optional :info, -> { Cadenya::ToolSets::ToolSetSecretInfo }
        end

        # @!method initialize(metadata:, spec:, info: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::ToolSetSecret} for more details.
        #
        #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @param spec [Cadenya::Models::ToolSets::ToolSetSecretSpec]
        #
        #   @param info [Cadenya::Models::ToolSets::ToolSetSecretInfo] Tool set secret information
      end
    end

    ToolSetSecret = ToolSets::ToolSetSecret
  end
end
