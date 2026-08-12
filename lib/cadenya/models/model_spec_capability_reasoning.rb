# frozen_string_literal: true

module Cadenya
  module Models
    class ModelSpecCapabilityReasoning < Cadenya::Internal::Type::BaseModel
      # @!attribute reasoning
      #   Reasoning / extended thinking (ModelConfig.reasoning_effort). A model that does
      #   not reason simply omits this capability.
      #
      #   @return [Cadenya::Models::CapabilityReasoning]
      required :reasoning, -> { Cadenya::CapabilityReasoning }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ModelSpecCapabilityReasoning::Type]
      required :type, enum: -> { Cadenya::ModelSpecCapabilityReasoning::Type }

      # @!method initialize(reasoning:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ModelSpecCapabilityReasoning} for more details.
      #
      #   @param reasoning [Cadenya::Models::CapabilityReasoning] Reasoning / extended thinking (ModelConfig.reasoning_effort). A model
      #
      #   @param type [Symbol, Cadenya::Models::ModelSpecCapabilityReasoning::Type]

      # @see Cadenya::Models::ModelSpecCapabilityReasoning#type
      module Type
        extend Cadenya::Internal::Type::Enum

        REASONING = :reasoning

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
