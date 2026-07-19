# typed: strong

module Cadenya
  module Models
    class AttributeFilter < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AttributeFilter, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::AttributeFilter::Attribute::OrSymbol) }
      attr_accessor :attribute

      # String matching operations
      sig do
        returns(
          T.nilable(
            T.any(
              Cadenya::StringMatcherExact,
              Cadenya::StringMatcherStartsWith,
              Cadenya::StringMatcherEndsWith,
              Cadenya::StringMatcherContains,
              Cadenya::StringMatcherRegex
            )
          )
        )
      end
      attr_reader :matcher

      sig do
        params(
          matcher:
            T.any(
              Cadenya::StringMatcherExact::OrHash,
              Cadenya::StringMatcherStartsWith::OrHash,
              Cadenya::StringMatcherEndsWith::OrHash,
              Cadenya::StringMatcherContains::OrHash,
              Cadenya::StringMatcherRegex::OrHash
            )
        ).void
      end
      attr_writer :matcher

      # Single attribute filter
      sig do
        params(
          attribute: Cadenya::AttributeFilter::Attribute::OrSymbol,
          matcher:
            T.any(
              Cadenya::StringMatcherExact::OrHash,
              Cadenya::StringMatcherStartsWith::OrHash,
              Cadenya::StringMatcherEndsWith::OrHash,
              Cadenya::StringMatcherContains::OrHash,
              Cadenya::StringMatcherRegex::OrHash
            )
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
            attribute: Cadenya::AttributeFilter::Attribute::OrSymbol,
            matcher:
              T.any(
                Cadenya::StringMatcherExact,
                Cadenya::StringMatcherStartsWith,
                Cadenya::StringMatcherEndsWith,
                Cadenya::StringMatcherContains,
                Cadenya::StringMatcherRegex
              )
          }
        )
      end
      def to_hash
      end

      module Attribute
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::AttributeFilter::Attribute) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ATTRIBUTE_UNSPECIFIED =
          T.let(
            :ATTRIBUTE_UNSPECIFIED,
            Cadenya::AttributeFilter::Attribute::TaggedSymbol
          )
        ATTRIBUTE_NAME =
          T.let(
            :ATTRIBUTE_NAME,
            Cadenya::AttributeFilter::Attribute::TaggedSymbol
          )
        ATTRIBUTE_TITLE =
          T.let(
            :ATTRIBUTE_TITLE,
            Cadenya::AttributeFilter::Attribute::TaggedSymbol
          )
        ATTRIBUTE_DESCRIPTION =
          T.let(
            :ATTRIBUTE_DESCRIPTION,
            Cadenya::AttributeFilter::Attribute::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::AttributeFilter::Attribute::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
