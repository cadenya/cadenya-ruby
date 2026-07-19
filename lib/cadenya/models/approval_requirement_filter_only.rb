# frozen_string_literal: true

module Cadenya
  module Models
    class ApprovalRequirementFilterOnly < Cadenya::Internal::Type::BaseModel
      # @!attribute only
      #   Top-level filter with simple boolean logic (no nesting)
      #
      #   @return [Cadenya::Models::ToolFilter]
      required :only, -> { Cadenya::ToolFilter }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ApprovalRequirementFilterOnly::Type]
      required :type, enum: -> { Cadenya::ApprovalRequirementFilterOnly::Type }

      # @!method initialize(only:, type:)
      #   @param only [Cadenya::Models::ToolFilter] Top-level filter with simple boolean logic (no nesting)
      #
      #   @param type [Symbol, Cadenya::Models::ApprovalRequirementFilterOnly::Type]

      # @see Cadenya::Models::ApprovalRequirementFilterOnly#type
      module Type
        extend Cadenya::Internal::Type::Enum

        ONLY = :only

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
