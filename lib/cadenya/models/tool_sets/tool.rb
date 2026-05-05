# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      # @see Cadenya::Resources::ToolSets::Tools#create
      class Tool < Cadenya::Internal::Type::BaseModel
        # @!attribute metadata
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata]
        required :metadata, -> { Cadenya::ResourceMetadata }

        # @!attribute spec
        #
        #   @return [Cadenya::Models::ToolSets::ToolSpec]
        required :spec, -> { Cadenya::ToolSets::ToolSpec }

        # @!attribute info
        #
        #   @return [Cadenya::Models::ToolSets::ToolInfo, nil]
        optional :info, -> { Cadenya::ToolSets::ToolInfo }

        # @!method initialize(metadata:, spec:, info: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::Tool} for more details.
        #
        #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @param spec [Cadenya::Models::ToolSets::ToolSpec]
        #
        #   @param info [Cadenya::Models::ToolSets::ToolInfo]
      end
    end
  end
end
