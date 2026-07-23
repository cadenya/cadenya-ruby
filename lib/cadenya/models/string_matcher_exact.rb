# frozen_string_literal: true

module Cadenya
  module Models
    class StringMatcherExact < Cadenya::Internal::Type::BaseModel
      # @!attribute exact
      #
      #   @return [String]
      required :exact, String

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::StringMatcherExact::Type]
      required :type, enum: -> { Cadenya::StringMatcherExact::Type }

      # @!attribute case_sensitive
      #
      #   @return [Boolean, nil]
      optional :case_sensitive, Cadenya::Internal::Type::Boolean, api_name: :caseSensitive

      # @!method initialize(exact:, type:, case_sensitive: nil)
      #   @param exact [String]
      #   @param type [Symbol, Cadenya::Models::StringMatcherExact::Type]
      #   @param case_sensitive [Boolean]

      # @see Cadenya::Models::StringMatcherExact#type
      module Type
        extend Cadenya::Internal::Type::Enum

        EXACT = :exact

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
