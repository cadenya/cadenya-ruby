# frozen_string_literal: true

module Cadenya
  module Models
    class CapabilityReasoning < Cadenya::Internal::Type::BaseModel
      # @!attribute mode
      #   How reasoning is enabled for this model. Catalog data used to decide whether
      #   thinking is requested for objective iterations on this model.
      #
      #   @return [Symbol, Cadenya::Models::CapabilityReasoning::Mode]
      required :mode, enum: -> { Cadenya::CapabilityReasoning::Mode }

      # @!method initialize(mode:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::CapabilityReasoning} for more details.
      #
      #   Reasoning / extended thinking (ModelConfig.reasoning_effort). A model that does
      #   not reason simply omits this capability.
      #
      #   @param mode [Symbol, Cadenya::Models::CapabilityReasoning::Mode] How reasoning is enabled for this model. Catalog data used to decide

      # How reasoning is enabled for this model. Catalog data used to decide whether
      # thinking is requested for objective iterations on this model.
      #
      # @see Cadenya::Models::CapabilityReasoning#mode
      module Mode
        extend Cadenya::Internal::Type::Enum

        MODE_UNSPECIFIED = :MODE_UNSPECIFIED
        MODE_ADAPTIVE = :MODE_ADAPTIVE
        MODE_BUDGET = :MODE_BUDGET

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
