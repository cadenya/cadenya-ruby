# frozen_string_literal: true

module Cadenya
  module Models
    class ToolEntry < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute spec
      #
      #   @return [Cadenya::Models::ToolSets::ToolSpec]
      required :spec, -> { Cadenya::ToolSets::ToolSpec }

      # @!attribute labels
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Cadenya::Internal::Type::HashOf[String]

      # @!attribute state
      #   Desired lifecycle state for the tool. Defaults to STATE_AVAILABLE when
      #   unspecified. STATE_ARCHIVED is server-managed and is rejected here.
      #
      #   @return [Symbol, Cadenya::Models::ToolEntry::State, nil]
      optional :state, enum: -> { Cadenya::ToolEntry::State }

      # @!method initialize(name:, spec:, labels: nil, state: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolEntry} for more details.
      #
      #   @param name [String]
      #
      #   @param spec [Cadenya::Models::ToolSets::ToolSpec]
      #
      #   @param labels [Hash{Symbol=>String}]
      #
      #   @param state [Symbol, Cadenya::Models::ToolEntry::State] Desired lifecycle state for the tool. Defaults to STATE_AVAILABLE when

      # Desired lifecycle state for the tool. Defaults to STATE_AVAILABLE when
      # unspecified. STATE_ARCHIVED is server-managed and is rejected here.
      #
      # @see Cadenya::Models::ToolEntry#state
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
