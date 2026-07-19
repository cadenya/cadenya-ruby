# frozen_string_literal: true

module Cadenya
  module Models
    class StringMatcherStartsWith < Cadenya::Internal::Type::BaseModel
      # @!attribute starts_with
      #
      #   @return [String]
      required :starts_with, String, api_name: :startsWith

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::StringMatcherStartsWith::Type]
      required :type, enum: -> { Cadenya::StringMatcherStartsWith::Type }

      # @!attribute case_sensitive
      #
      #   @return [Boolean, nil]
      optional :case_sensitive, Cadenya::Internal::Type::Boolean, api_name: :caseSensitive

      # @!method initialize(starts_with:, type:, case_sensitive: nil)
      #   @param starts_with [String]
      #   @param type [Symbol, Cadenya::Models::StringMatcherStartsWith::Type]
      #   @param case_sensitive [Boolean]

      # @see Cadenya::Models::StringMatcherStartsWith#type
      module Type
        extend Cadenya::Internal::Type::Enum

        STARTS_WITH = :startsWith

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
