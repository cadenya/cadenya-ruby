# typed: strong

module Cadenya
  module Models
    class ToolSetEventData < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetEventData, Cadenya::Internal::AnyHash)
        end

      # Emitted when a tool set sync operation completes successfully.
      sig { returns(T.nilable(Cadenya::SyncCompleted)) }
      attr_reader :sync_completed

      sig { params(sync_completed: Cadenya::SyncCompleted::OrHash).void }
      attr_writer :sync_completed

      # Emitted when a tool set sync operation fails.
      sig { returns(T.nilable(Cadenya::SyncFailed)) }
      attr_reader :sync_failed

      sig { params(sync_failed: Cadenya::SyncFailed::OrHash).void }
      attr_writer :sync_failed

      # Emitted when a tool set sync operation begins.
      sig { returns(T.nilable(Cadenya::SyncStarted)) }
      attr_reader :sync_started

      sig { params(sync_started: Cadenya::SyncStarted::OrHash).void }
      attr_writer :sync_started

      # The JSON name of the variant set in `data` (e.g. "syncStarted"). Filled by the
      # server; drives the discriminated union in the generated OpenAPI.
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      # Event payload for a tool set operation.
      sig do
        params(
          sync_completed: Cadenya::SyncCompleted::OrHash,
          sync_failed: Cadenya::SyncFailed::OrHash,
          sync_started: Cadenya::SyncStarted::OrHash,
          type: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Emitted when a tool set sync operation completes successfully.
        sync_completed: nil,
        # Emitted when a tool set sync operation fails.
        sync_failed: nil,
        # Emitted when a tool set sync operation begins.
        sync_started: nil,
        # The JSON name of the variant set in `data` (e.g. "syncStarted"). Filled by the
        # server; drives the discriminated union in the generated OpenAPI.
        type: nil
      )
      end

      sig do
        override.returns(
          {
            sync_completed: Cadenya::SyncCompleted,
            sync_failed: Cadenya::SyncFailed,
            sync_started: Cadenya::SyncStarted,
            type: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
