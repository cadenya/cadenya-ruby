# typed: strong

module Cadenya
  module Models
    class SyncFailed < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::SyncFailed, Cadenya::Internal::AnyHash) }

      # Indicates this is an error event.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :error

      sig { params(error: T::Boolean).void }
      attr_writer :error

      # Optional error type/code for programmatic handling.
      sig { returns(T.nilable(String)) }
      attr_reader :error_type

      sig { params(error_type: String).void }
      attr_writer :error_type

      # Error message describing what went wrong.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # Emitted when a tool set sync operation fails.
      sig do
        params(error: T::Boolean, error_type: String, message: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Indicates this is an error event.
        error: nil,
        # Optional error type/code for programmatic handling.
        error_type: nil,
        # Error message describing what went wrong.
        message: nil
      )
      end

      sig do
        override.returns(
          { error: T::Boolean, error_type: String, message: String }
        )
      end
      def to_hash
      end
    end
  end
end
