# typed: strong

module Cadenya
  module Models
    class StringMatcherExact < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::StringMatcherExact, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :exact

      sig { returns(Cadenya::StringMatcherExact::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :case_sensitive

      sig { params(case_sensitive: T::Boolean).void }
      attr_writer :case_sensitive

      sig do
        params(
          exact: String,
          type: Cadenya::StringMatcherExact::Type::OrSymbol,
          case_sensitive: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(exact:, type:, case_sensitive: nil)
      end

      sig do
        override.returns(
          {
            exact: String,
            type: Cadenya::StringMatcherExact::Type::OrSymbol,
            case_sensitive: T::Boolean
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::StringMatcherExact::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EXACT = T.let(:exact, Cadenya::StringMatcherExact::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::StringMatcherExact::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
