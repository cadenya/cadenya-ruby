# typed: strong

module Cadenya
  module Models
    class SyncFailed < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::SyncFailed, Cadenya::Internal::AnyHash) }

      # Indicates this is an error event.
      sig { returns(T::Boolean) }
      attr_accessor :error

      # Optional error type/code for programmatic handling.
      sig { returns(String) }
      attr_accessor :error_type

      # Error message describing what went wrong.
      sig { returns(String) }
      attr_accessor :message

      # Emitted when a tool set sync operation fails.
      sig do
        params(error: T::Boolean, error_type: String, message: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Indicates this is an error event.
        error:,
        # Optional error type/code for programmatic handling.
        error_type:,
        # Error message describing what went wrong.
        message:
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
