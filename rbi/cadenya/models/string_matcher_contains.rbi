# typed: strong

module Cadenya
  module Models
    class StringMatcherContains < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::StringMatcherContains, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :contains

      sig { returns(Cadenya::StringMatcherContains::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :case_sensitive

      sig { params(case_sensitive: T::Boolean).void }
      attr_writer :case_sensitive

      sig do
        params(
          contains: String,
          type: Cadenya::StringMatcherContains::Type::OrSymbol,
          case_sensitive: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(contains:, type:, case_sensitive: nil)
      end

      sig do
        override.returns(
          {
            contains: String,
            type: Cadenya::StringMatcherContains::Type::OrSymbol,
            case_sensitive: T::Boolean
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::StringMatcherContains::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CONTAINS =
          T.let(:contains, Cadenya::StringMatcherContains::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::StringMatcherContains::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
