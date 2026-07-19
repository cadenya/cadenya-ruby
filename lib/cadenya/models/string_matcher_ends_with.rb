# frozen_string_literal: true

module Cadenya
  module Models
    class StringMatcherEndsWith < Cadenya::Internal::Type::BaseModel
      # @!attribute ends_with
      #
      #   @return [String]
      required :ends_with, String, api_name: :endsWith

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::StringMatcherEndsWith::Type]
      required :type, enum: -> { Cadenya::StringMatcherEndsWith::Type }

      # @!attribute case_sensitive
      #
      #   @return [Boolean, nil]
      optional :case_sensitive, Cadenya::Internal::Type::Boolean, api_name: :caseSensitive

      # @!method initialize(ends_with:, type:, case_sensitive: nil)
      #   @param ends_with [String]
      #   @param type [Symbol, Cadenya::Models::StringMatcherEndsWith::Type]
      #   @param case_sensitive [Boolean]

      # @see Cadenya::Models::StringMatcherEndsWith#type
      module Type
        extend Cadenya::Internal::Type::Enum

        ENDS_WITH = :endsWith

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
