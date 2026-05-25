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
      sig { returns(T.nilable(Cadenya::StringMatcher)) }
      attr_reader :matcher

      sig { params(matcher: Cadenya::StringMatcher::OrHash).void }
      attr_writer :matcher

      # Single attribute filter
      sig do
        params(
          attribute: Cadenya::AttributeFilter::Attribute::OrSymbol,
          matcher: Cadenya::StringMatcher::OrHash
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
            matcher: Cadenya::StringMatcher
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
