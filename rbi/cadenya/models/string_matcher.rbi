# typed: strong

module Cadenya
  module Models
    class StringMatcher < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::StringMatcher, Cadenya::Internal::AnyHash)
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
