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
        # @!attribute state
        #   The current lifecycle state of the tool set. Output only. Tool sets are created
        #   STATE_ACTIVE; use the :archive and :unarchive actions to transition between
        #   states.
        #
        #   @return [Symbol, Cadenya::Models::ToolSet::State]
        required :state, enum: -> { Cadenya::ToolSet::State }

        # @!attribute info
        #   Tool set information
        #
        #   @return [Cadenya::Models::ToolSetInfo, nil]
        optional :info, -> { Cadenya::ToolSetInfo }
      end

      # @!method initialize(metadata:, spec:, state:, info: nil)
      #   Some parameter documentations has been truncated, see {Cadenya::Models::ToolSet}
      #   for more details.
      #
      #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param spec [Cadenya::Models::ToolSetSpec]
      #
      #   @param state [Symbol, Cadenya::Models::ToolSet::State] The current lifecycle state of the tool set. Output only. Tool sets are
      #
      #   @param info [Cadenya::Models::ToolSetInfo] Tool set information

      # The current lifecycle state of the tool set. Output only. Tool sets are created
      # STATE_ACTIVE; use the :archive and :unarchive actions to transition between
      # states.
      #
      # @see Cadenya::Models::ToolSet#state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_ACTIVE = :STATE_ACTIVE
        STATE_ARCHIVED = :STATE_ARCHIVED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
