# typed: strong

module Cadenya
  module Models
    class StringMatcherRegex < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::StringMatcherRegex, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :regex

      sig { returns(Cadenya::StringMatcherRegex::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :case_sensitive

      sig { params(case_sensitive: T::Boolean).void }
      attr_writer :case_sensitive

      sig do
        params(
          regex: String,
          type: Cadenya::StringMatcherRegex::Type::OrSymbol,
          case_sensitive: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(regex:, type:, case_sensitive: nil)
      end

      sig do
        override.returns(
          {
            regex: String,
            type: Cadenya::StringMatcherRegex::Type::OrSymbol,
            case_sensitive: T::Boolean
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::StringMatcherRegex::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REGEX = T.let(:regex, Cadenya::StringMatcherRegex::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Cadenya::StringMatcherRegex::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
