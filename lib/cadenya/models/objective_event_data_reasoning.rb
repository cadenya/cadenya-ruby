# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataReasoning < Cadenya::Internal::Type::BaseModel
      # @!attribute reasoning
      #   Reasoning carries the human-readable reasoning text a model produced while
      #   working on an iteration — extended thinking (Anthropic, Gemini) or reasoning
      #   summaries (OpenAI). It is emitted alongside the assistant message from the same
      #   model response and is purely informational: the text shown here is never sent
      #   back to the model.
      #
      #   @return [Cadenya::Models::Reasoning]
      required :reasoning, -> { Cadenya::Reasoning }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataReasoning::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataReasoning::Type }

      # @!method initialize(reasoning:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveEventDataReasoning} for more details.
      #
      #   @param reasoning [Cadenya::Models::Reasoning] Reasoning carries the human-readable reasoning text a model produced while
      #
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataReasoning::Type]

      # @see Cadenya::Models::ObjectiveEventDataReasoning#type
      module Type
        extend Cadenya::Internal::Type::Enum

        REASONING = :reasoning

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
