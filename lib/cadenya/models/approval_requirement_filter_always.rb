# frozen_string_literal: true

module Cadenya
  module Models
    class ApprovalRequirementFilterAlways < Cadenya::Internal::Type::BaseModel
      # @!attribute always
      #
      #   @return [Boolean]
      required :always, Cadenya::Internal::Type::Boolean

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ApprovalRequirementFilterAlways::Type]
      required :type, enum: -> { Cadenya::ApprovalRequirementFilterAlways::Type }

      # @!method initialize(always:, type:)
      #   @param always [Boolean]
      #   @param type [Symbol, Cadenya::Models::ApprovalRequirementFilterAlways::Type]

      # @see Cadenya::Models::ApprovalRequirementFilterAlways#type
      module Type
        extend Cadenya::Internal::Type::Enum

        ALWAYS = :always

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
