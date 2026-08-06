# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetEventDataSyncStarted < Cadenya::Internal::Type::BaseModel
      # @!attribute sync_started
      #   Emitted when a tool set sync operation begins.
      #
      #   @return [Cadenya::Models::SyncStarted]
      required :sync_started, -> { Cadenya::SyncStarted }, api_name: :syncStarted

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ToolSetEventDataSyncStarted::Type]
      required :type, enum: -> { Cadenya::ToolSetEventDataSyncStarted::Type }

      # @!method initialize(sync_started:, type:)
      #   @param sync_started [Cadenya::Models::SyncStarted] Emitted when a tool set sync operation begins.
      #
      #   @param type [Symbol, Cadenya::Models::ToolSetEventDataSyncStarted::Type]

      # @see Cadenya::Models::ToolSetEventDataSyncStarted#type
      module Type
        extend Cadenya::Internal::Type::Enum

        SYNC_STARTED = :syncStarted

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
