# frozen_string_literal: true

module Cadenya
  module Models
    class StringMatcher < Cadenya::Internal::Type::BaseModel
      # @!attribute case_sensitive
      #
      #   @return [Boolean, nil]
      optional :case_sensitive, Cadenya::Internal::Type::Boolean, api_name: :caseSensitive

      # @!attribute contains
      #
      #   @return [String, nil]
      optional :contains, String

      # @!attribute ends_with
      #
      #   @return [String, nil]
      optional :ends_with, String, api_name: :endsWith

      # @!attribute exact
      #
      #   @return [String, nil]
      optional :exact, String

      # @!attribute regex
      #
      #   @return [String, nil]
      optional :regex, String

      # @!attribute starts_with
      #
      #   @return [String, nil]
      optional :starts_with, String, api_name: :startsWith

      # @!attribute type
      #   The JSON name of the variant set in `match_type` (e.g. "startsWith"). Required
      #   from clients on writes, filled by the server on reads; drives the discriminated
      #   union in the generated OpenAPI.
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(case_sensitive: nil, contains: nil, ends_with: nil, exact: nil, regex: nil, starts_with: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::StringMatcher} for more details.
      #
      #   String matching operations
      #
      #   @param case_sensitive [Boolean]
      #
      #   @param contains [String]
      #
      #   @param ends_with [String]
      #
      #   @param exact [String]
      #
      #   @param regex [String]
      #
      #   @param starts_with [String]
      #
      #   @param type [String] The JSON name of the variant set in `match_type` (e.g. "startsWith").
    end
  end
end
