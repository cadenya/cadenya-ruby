# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataFinalized < Cadenya::Internal::Type::BaseModel
      # @!attribute finalized
      #   ObjectiveFinalized is the terminal event written when an objective is finalized.
      #   After this event, the objective is super-terminal: no further iterations,
      #   compaction, or continuation are permitted.
      #
      #   @return [Cadenya::Models::ObjectiveEventDataFinalized::Finalized]
      required :finalized, -> { Cadenya::ObjectiveEventDataFinalized::Finalized }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataFinalized::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataFinalized::Type }

      # @!method initialize(finalized:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveEventDataFinalized} for more details.
      #
      #   @param finalized [Cadenya::Models::ObjectiveEventDataFinalized::Finalized] ObjectiveFinalized is the terminal event written when an objective is
      #
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataFinalized::Type]

      # @see Cadenya::Models::ObjectiveEventDataFinalized#finalized
      class Finalized < Cadenya::Internal::Type::BaseModel
        # @!attribute output
        #   If the objective was created with an output schema, and the agent successfully
        #   completed the objective, this field will contain the structured output of the
        #   objective.
        #
        #   @return [Object, nil]
        optional :output, Cadenya::Internal::Type::Unknown

        # @!method initialize(output: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ObjectiveEventDataFinalized::Finalized} for more details.
        #
        #   ObjectiveFinalized is the terminal event written when an objective is finalized.
        #   After this event, the objective is super-terminal: no further iterations,
        #   compaction, or continuation are permitted.
        #
        #   @param output [Object] If the objective was created with an output schema, and the agent
      end

      # @see Cadenya::Models::ObjectiveEventDataFinalized#type
      module Type
        extend Cadenya::Internal::Type::Enum

        FINALIZED = :finalized

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
