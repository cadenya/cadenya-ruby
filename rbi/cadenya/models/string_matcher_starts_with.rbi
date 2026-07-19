# typed: strong

module Cadenya
  module Models
    class StringMatcherStartsWith < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::StringMatcherStartsWith, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :starts_with

      sig { returns(Cadenya::StringMatcherStartsWith::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :case_sensitive

      sig { params(case_sensitive: T::Boolean).void }
      attr_writer :case_sensitive

      sig do
        params(
          starts_with: String,
          type: Cadenya::StringMatcherStartsWith::Type::OrSymbol,
          case_sensitive: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(starts_with:, type:, case_sensitive: nil)
      end

      sig do
        override.returns(
          {
            starts_with: String,
            type: Cadenya::StringMatcherStartsWith::Type::OrSymbol,
            case_sensitive: T::Boolean
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::StringMatcherStartsWith::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STARTS_WITH =
          T.let(
            :startsWith,
            Cadenya::StringMatcherStartsWith::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::StringMatcherStartsWith::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
