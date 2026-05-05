# typed: strong

module Cadenya
  module Models
    class SyncCompleted < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::SyncCompleted, Cadenya::Internal::AnyHash)
        end

      # Optional message with additional details.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # Number of tools synced.
      sig { returns(T.nilable(Integer)) }
      attr_reader :tools_synced

      sig { params(tools_synced: Integer).void }
      attr_writer :tools_synced

      # Emitted when a tool set sync operation completes successfully.
      sig do
        params(message: String, tools_synced: Integer).returns(T.attached_class)
      end
      def self.new(
        # Optional message with additional details.
        message: nil,
        # Number of tools synced.
        tools_synced: nil
      )
      end

      sig { override.returns({ message: String, tools_synced: Integer }) }
      def to_hash
      end
    end
  end
end
