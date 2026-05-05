# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetEventData < Cadenya::Internal::Type::BaseModel
      # @!attribute sync_completed
      #   Emitted when a tool set sync operation completes successfully.
      #
      #   @return [Cadenya::Models::SyncCompleted, nil]
      optional :sync_completed, -> { Cadenya::SyncCompleted }, api_name: :syncCompleted

      # @!attribute sync_failed
      #   Emitted when a tool set sync operation fails.
      #
      #   @return [Cadenya::Models::SyncFailed, nil]
      optional :sync_failed, -> { Cadenya::SyncFailed }, api_name: :syncFailed

      # @!attribute sync_started
      #   Emitted when a tool set sync operation begins.
      #
      #   @return [Cadenya::Models::SyncStarted, nil]
      optional :sync_started, -> { Cadenya::SyncStarted }, api_name: :syncStarted

      # @!attribute type
      #   Type of the event (e.g., "sync_started", "sync_completed", "sync_failed").
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(sync_completed: nil, sync_failed: nil, sync_started: nil, type: nil)
      #   Event payload for a tool set operation.
      #
      #   @param sync_completed [Cadenya::Models::SyncCompleted] Emitted when a tool set sync operation completes successfully.
      #
      #   @param sync_failed [Cadenya::Models::SyncFailed] Emitted when a tool set sync operation fails.
      #
      #   @param sync_started [Cadenya::Models::SyncStarted] Emitted when a tool set sync operation begins.
      #
      #   @param type [String] Type of the event (e.g., "sync_started", "sync_completed", "sync_failed").
    end
  end
end
