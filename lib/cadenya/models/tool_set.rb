# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::ToolSets#create
    class ToolSet < Cadenya::Internal::Type::BaseModel
      # @!attribute metadata
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata]
      required :metadata, -> { Cadenya::ResourceMetadata }

      # @!attribute spec
      #
      #   @return [Cadenya::Models::ToolSetSpec]
      required :spec, -> { Cadenya::ToolSetSpec }

      response_only do
        # @!attribute info
        #   Tool set information
        #
        #   @return [Cadenya::Models::ToolSetInfo, nil]
        optional :info, -> { Cadenya::ToolSetInfo }
      end

      # @!method initialize(metadata:, spec:, info: nil)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::ToolSet}
      #   for more details.
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param spec [Cadenya::Models::ToolSetSpec]
      #
      #   @param info [Cadenya::Models::ToolSetInfo] Tool set information
    end
  end
end
