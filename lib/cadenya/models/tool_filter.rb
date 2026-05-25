# frozen_string_literal: true

module Cadenya
  module Models
    class ToolFilter < Cadenya::Internal::Type::BaseModel
      # @!attribute operator
      #
      #   @return [Symbol, Cadenya::Models::ToolFilter::Operator]
      required :operator, enum: -> { Cadenya::ToolFilter::Operator }

      # @!attribute filters
      #
      #   @return [Array<Cadenya::Models::AttributeFilter>, nil]
      optional :filters, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::AttributeFilter] }

      # @!method initialize(operator:, filters: nil)
      #   Top-level filter with simple boolean logic (no nesting)
      #
      #   @param operator [Symbol, Cadenya::Models::ToolFilter::Operator]
      #   @param filters [Array<Cadenya::Models::AttributeFilter>]

      # @see Cadenya::Models::ToolFilter#operator
      module Operator
        extend Cadenya::Internal::Type::Enum

        OPERATOR_UNSPECIFIED = :OPERATOR_UNSPECIFIED
        OPERATOR_AND = :OPERATOR_AND
        OPERATOR_OR = :OPERATOR_OR

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
