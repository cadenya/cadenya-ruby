# frozen_string_literal: true

module Cadenya
  module Models
    class StringMatcherRegex < Cadenya::Internal::Type::BaseModel
      # @!attribute regex
      #
      #   @return [String]
      required :regex, String

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::StringMatcherRegex::Type]
      required :type, enum: -> { Cadenya::StringMatcherRegex::Type }

      # @!attribute case_sensitive
      #
      #   @return [Boolean, nil]
      optional :case_sensitive, Cadenya::Internal::Type::Boolean, api_name: :caseSensitive

      # @!method initialize(regex:, type:, case_sensitive: nil)
      #   @param regex [String]
      #   @param type [Symbol, Cadenya::Models::StringMatcherRegex::Type]
      #   @param case_sensitive [Boolean]

      # @see Cadenya::Models::StringMatcherRegex#type
      module Type
        extend Cadenya::Internal::Type::Enum

        REGEX = :regex

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
