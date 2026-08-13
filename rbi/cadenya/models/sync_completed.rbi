# typed: strong

module Cadenya
  module Models
    class SyncCompleted < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::SyncCompleted, Cadenya::Internal::AnyHash)
        end

      # Optional message with additional details.
      sig { returns(String) }
      attr_accessor :message

      # Number of tools synced.
      sig { returns(Integer) }
      attr_accessor :tools_synced

      # Emitted when a tool set sync operation completes successfully.
      sig do
        params(message: String, tools_synced: Integer).returns(T.attached_class)
      end
      def self.new(
        # Optional message with additional details.
        message:,
        # Number of tools synced.
        tools_synced:
      )
      end

      sig { override.returns({ message: String, tools_synced: Integer }) }
      def to_hash
      end
    end
  end
end
