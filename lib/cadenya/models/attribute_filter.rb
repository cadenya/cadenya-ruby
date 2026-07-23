# frozen_string_literal: true

module Cadenya
  module Models
    class AttributeFilter < Cadenya::Internal::Type::BaseModel
      # @!attribute attribute
      #
      #   @return [Symbol, Cadenya::Models::AttributeFilter::Attribute]
      required :attribute, enum: -> { Cadenya::AttributeFilter::Attribute }

      # @!attribute matcher
      #   String matching operations
      #
      #   @return [Cadenya::Models::StringMatcherExact, Cadenya::Models::StringMatcherStartsWith, Cadenya::Models::StringMatcherEndsWith, Cadenya::Models::StringMatcherContains, Cadenya::Models::StringMatcherRegex, nil]
      optional :matcher, union: -> { Cadenya::StringMatcher }

      # @!method initialize(attribute:, matcher: nil)
      #   Single attribute filter
      #
      #   @param attribute [Symbol, Cadenya::Models::AttributeFilter::Attribute]
      #
      #   @param matcher [Cadenya::Models::StringMatcherExact, Cadenya::Models::StringMatcherStartsWith, Cadenya::Models::StringMatcherEndsWith, Cadenya::Models::StringMatcherContains, Cadenya::Models::StringMatcherRegex] String matching operations

      # @see Cadenya::Models::AttributeFilter#attribute
      module Attribute
        extend Cadenya::Internal::Type::Enum

        ATTRIBUTE_UNSPECIFIED = :ATTRIBUTE_UNSPECIFIED
        ATTRIBUTE_NAME = :ATTRIBUTE_NAME
        ATTRIBUTE_TITLE = :ATTRIBUTE_TITLE
        ATTRIBUTE_DESCRIPTION = :ATTRIBUTE_DESCRIPTION

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
