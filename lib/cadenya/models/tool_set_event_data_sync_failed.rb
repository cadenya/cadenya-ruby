# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetEventDataSyncFailed < Cadenya::Internal::Type::BaseModel
      # @!attribute sync_failed
      #   Emitted when a tool set sync operation fails.
      #
      #   @return [Cadenya::Models::SyncFailed]
      required :sync_failed, -> { Cadenya::SyncFailed }, api_name: :syncFailed

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ToolSetEventDataSyncFailed::Type]
      required :type, enum: -> { Cadenya::ToolSetEventDataSyncFailed::Type }

      # @!method initialize(sync_failed:, type:)
      #   @param sync_failed [Cadenya::Models::SyncFailed] Emitted when a tool set sync operation fails.
      #
      #   @param type [Symbol, Cadenya::Models::ToolSetEventDataSyncFailed::Type]

      # @see Cadenya::Models::ToolSetEventDataSyncFailed#type
      module Type
        extend Cadenya::Internal::Type::Enum

        SYNC_FAILED = :syncFailed

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
