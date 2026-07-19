# frozen_string_literal: true

module Cadenya
  module Models
    class StringMatcherContains < Cadenya::Internal::Type::BaseModel
      # @!attribute contains
      #
      #   @return [String]
      required :contains, String

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::StringMatcherContains::Type]
      required :type, enum: -> { Cadenya::StringMatcherContains::Type }

      # @!attribute case_sensitive
      #
      #   @return [Boolean, nil]
      optional :case_sensitive, Cadenya::Internal::Type::Boolean, api_name: :caseSensitive

      # @!method initialize(contains:, type:, case_sensitive: nil)
      #   @param contains [String]
      #   @param type [Symbol, Cadenya::Models::StringMatcherContains::Type]
      #   @param case_sensitive [Boolean]

      # @see Cadenya::Models::StringMatcherContains#type
      module Type
        extend Cadenya::Internal::Type::Enum

        CONTAINS = :contains

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
