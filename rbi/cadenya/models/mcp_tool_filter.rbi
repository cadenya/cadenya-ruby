# typed: strong

module Cadenya
  module Models
    class McpToolFilter < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::McpToolFilter, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::McpToolFilter::Operator::OrSymbol) }
      attr_accessor :operator

      sig { returns(T.nilable(T::Array[Cadenya::McpToolFilter::Filter])) }
      attr_reader :filters

      sig do
        params(filters: T::Array[Cadenya::McpToolFilter::Filter::OrHash]).void
      end
      attr_writer :filters

      # Top-level filter with simple boolean logic (no nesting)
      sig do
        params(
          operator: Cadenya::McpToolFilter::Operator::OrSymbol,
          filters: T::Array[Cadenya::McpToolFilter::Filter::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(operator:, filters: nil)
      end

      sig do
        override.returns(
          {
            operator: Cadenya::McpToolFilter::Operator::OrSymbol,
            filters: T::Array[Cadenya::McpToolFilter::Filter]
          }
        )
      end
      def to_hash
      end

      module Operator
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::McpToolFilter::Operator) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPERATOR_UNSPECIFIED =
          T.let(
            :OPERATOR_UNSPECIFIED,
            Cadenya::McpToolFilter::Operator::TaggedSymbol
          )
        OPERATOR_AND =
          T.let(:OPERATOR_AND, Cadenya::McpToolFilter::Operator::TaggedSymbol)
        OPERATOR_OR =
          T.let(:OPERATOR_OR, Cadenya::McpToolFilter::Operator::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::McpToolFilter::Operator::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Filter < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::McpToolFilter::Filter, Cadenya::Internal::AnyHash)
          end

        sig { returns(Cadenya::McpToolFilter::Filter::Attribute::OrSymbol) }
        attr_accessor :attribute

        # String matching operations
        sig { returns(T.nilable(Cadenya::McpToolFilter::Filter::Matcher)) }
        attr_reader :matcher

        sig do
          params(matcher: Cadenya::McpToolFilter::Filter::Matcher::OrHash).void
        end
        attr_writer :matcher

        # Single attribute filter
        sig do
          params(
            attribute: Cadenya::McpToolFilter::Filter::Attribute::OrSymbol,
            matcher: Cadenya::McpToolFilter::Filter::Matcher::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          attribute:,
          # String matching operations
          matcher: nil
        )
        end

        sig do
          override.returns(
            {
              attribute: Cadenya::McpToolFilter::Filter::Attribute::OrSymbol,
              matcher: Cadenya::McpToolFilter::Filter::Matcher
            }
          )
        end
        def to_hash
        end

        module Attribute
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::McpToolFilter::Filter::Attribute)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ATTRIBUTE_UNSPECIFIED =
            T.let(
              :ATTRIBUTE_UNSPECIFIED,
              Cadenya::McpToolFilter::Filter::Attribute::TaggedSymbol
            )
          ATTRIBUTE_NAME =
            T.let(
              :ATTRIBUTE_NAME,
              Cadenya::McpToolFilter::Filter::Attribute::TaggedSymbol
            )
          ATTRIBUTE_TITLE =
            T.let(
              :ATTRIBUTE_TITLE,
              Cadenya::McpToolFilter::Filter::Attribute::TaggedSymbol
            )
          ATTRIBUTE_DESCRIPTION =
            T.let(
              :ATTRIBUTE_DESCRIPTION,
              Cadenya::McpToolFilter::Filter::Attribute::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Cadenya::McpToolFilter::Filter::Attribute::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        class Matcher < Cadenya::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Cadenya::McpToolFilter::Filter::Matcher,
                Cadenya::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :case_sensitive

          sig { params(case_sensitive: T::Boolean).void }
          attr_writer :case_sensitive

          sig { returns(T.nilable(String)) }
          attr_reader :contains

          sig { params(contains: String).void }
          attr_writer :contains

          sig { returns(T.nilable(String)) }
          attr_reader :ends_with

          sig { params(ends_with: String).void }
          attr_writer :ends_with

          sig { returns(T.nilable(String)) }
          attr_reader :exact

          sig { params(exact: String).void }
          attr_writer :exact

          sig { returns(T.nilable(String)) }
          attr_reader :regex

          sig { params(regex: String).void }
          attr_writer :regex

          sig { returns(T.nilable(String)) }
          attr_reader :starts_with

          sig { params(starts_with: String).void }
          attr_writer :starts_with

          # String matching operations
          sig do
            params(
              case_sensitive: T::Boolean,
              contains: String,
              ends_with: String,
              exact: String,
              regex: String,
              starts_with: String
            ).returns(T.attached_class)
          end
          def self.new(
            case_sensitive: nil,
            contains: nil,
            ends_with: nil,
            exact: nil,
            regex: nil,
            starts_with: nil
          )
          end

          sig do
            override.returns(
              {
                case_sensitive: T::Boolean,
                contains: String,
                ends_with: String,
                exact: String,
                regex: String,
                starts_with: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
