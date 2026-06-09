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

        response_only do
          # @!attribute state
          #   The current lifecycle state of the tool. Output only. Use the :omit and :restore
          #   actions to transition; tool set syncs may also update it.
          #
          #   @return [Symbol, Cadenya::Models::ToolSets::Tool::State]
          required :state, enum: -> { Cadenya::ToolSets::Tool::State }
        end

        # @!method initialize(metadata:, spec:, state:, info: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::Tool} for more details.
        #
        #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @param spec [Cadenya::Models::ToolSets::ToolSpec]
        #
        #   @param state [Symbol, Cadenya::Models::ToolSets::Tool::State] The current lifecycle state of the tool. Output only. Use the :omit and
        #
        #   @param info [Cadenya::Models::ToolSets::ToolInfo]

        # The current lifecycle state of the tool. Output only. Use the :omit and :restore
        # actions to transition; tool set syncs may also update it.
        #
        # @see Cadenya::Models::ToolSets::Tool#state
        module State
          extend Cadenya::Internal::Type::Enum

          STATE_UNSPECIFIED = :STATE_UNSPECIFIED
          STATE_AVAILABLE = :STATE_AVAILABLE
          STATE_OMITTED = :STATE_OMITTED
          STATE_ARCHIVED = :STATE_ARCHIVED

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
