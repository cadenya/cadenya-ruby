# typed: strong

module Cadenya
  module Models
    class StringMatcherEndsWith < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::StringMatcherEndsWith, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :ends_with

      sig { returns(Cadenya::StringMatcherEndsWith::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :case_sensitive

      sig { params(case_sensitive: T::Boolean).void }
      attr_writer :case_sensitive

      sig do
        params(
          ends_with: String,
          type: Cadenya::StringMatcherEndsWith::Type::OrSymbol,
          case_sensitive: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(ends_with:, type:, case_sensitive: nil)
      end

      sig do
        override.returns(
          {
            ends_with: String,
            type: Cadenya::StringMatcherEndsWith::Type::OrSymbol,
            case_sensitive: T::Boolean
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::StringMatcherEndsWith::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENDS_WITH =
          T.let(:endsWith, Cadenya::StringMatcherEndsWith::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::StringMatcherEndsWith::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
