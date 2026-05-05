# frozen_string_literal: true

module Cadenya
  module Models
    class McpToolFilter < Cadenya::Internal::Type::BaseModel
      # @!attribute operator
      #
      #   @return [Symbol, Cadenya::Models::McpToolFilter::Operator]
      required :operator, enum: -> { Cadenya::McpToolFilter::Operator }

      # @!attribute filters
      #
      #   @return [Array<Cadenya::Models::McpToolFilter::Filter>, nil]
      optional :filters, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::McpToolFilter::Filter] }

      # @!method initialize(operator:, filters: nil)
      #   Top-level filter with simple boolean logic (no nesting)
      #
      #   @param operator [Symbol, Cadenya::Models::McpToolFilter::Operator]
      #   @param filters [Array<Cadenya::Models::McpToolFilter::Filter>]

      # @see Cadenya::Models::McpToolFilter#operator
      module Operator
        extend Cadenya::Internal::Type::Enum

        OPERATOR_UNSPECIFIED = :OPERATOR_UNSPECIFIED
        OPERATOR_AND = :OPERATOR_AND
        OPERATOR_OR = :OPERATOR_OR

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Filter < Cadenya::Internal::Type::BaseModel
        # @!attribute attribute
        #
        #   @return [Symbol, Cadenya::Models::McpToolFilter::Filter::Attribute]
        required :attribute, enum: -> { Cadenya::McpToolFilter::Filter::Attribute }

        # @!attribute matcher
        #   String matching operations
        #
        #   @return [Cadenya::Models::McpToolFilter::Filter::Matcher, nil]
        optional :matcher, -> { Cadenya::McpToolFilter::Filter::Matcher }

        # @!method initialize(attribute:, matcher: nil)
        #   Single attribute filter
        #
        #   @param attribute [Symbol, Cadenya::Models::McpToolFilter::Filter::Attribute]
        #
        #   @param matcher [Cadenya::Models::McpToolFilter::Filter::Matcher] String matching operations

        # @see Cadenya::Models::McpToolFilter::Filter#attribute
        module Attribute
          extend Cadenya::Internal::Type::Enum

          ATTRIBUTE_UNSPECIFIED = :ATTRIBUTE_UNSPECIFIED
          ATTRIBUTE_NAME = :ATTRIBUTE_NAME
          ATTRIBUTE_TITLE = :ATTRIBUTE_TITLE
          ATTRIBUTE_DESCRIPTION = :ATTRIBUTE_DESCRIPTION

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Cadenya::Models::McpToolFilter::Filter#matcher
        class Matcher < Cadenya::Internal::Type::BaseModel
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

          # @!method initialize(case_sensitive: nil, contains: nil, ends_with: nil, exact: nil, regex: nil, starts_with: nil)
          #   String matching operations
          #
          #   @param case_sensitive [Boolean]
          #   @param contains [String]
          #   @param ends_with [String]
          #   @param exact [String]
          #   @param regex [String]
          #   @param starts_with [String]
        end
      end
    end
  end
end
