# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetEventDataSyncCompleted < Cadenya::Internal::Type::BaseModel
      # @!attribute sync_completed
      #   Emitted when a tool set sync operation completes successfully.
      #
      #   @return [Cadenya::Models::SyncCompleted]
      required :sync_completed, -> { Cadenya::SyncCompleted }, api_name: :syncCompleted

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ToolSetEventDataSyncCompleted::Type]
      required :type, enum: -> { Cadenya::ToolSetEventDataSyncCompleted::Type }

      # @!method initialize(sync_completed:, type:)
      #   @param sync_completed [Cadenya::Models::SyncCompleted] Emitted when a tool set sync operation completes successfully.
      #
      #   @param type [Symbol, Cadenya::Models::ToolSetEventDataSyncCompleted::Type]

      # @see Cadenya::Models::ToolSetEventDataSyncCompleted#type
      module Type
        extend Cadenya::Internal::Type::Enum

        SYNC_COMPLETED = :syncCompleted

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
