# frozen_string_literal: true

module Cadenya
  module Models
    class SyncCompleted < Cadenya::Internal::Type::BaseModel
      # @!attribute message
      #   Optional message with additional details.
      #
      #   @return [String]
      required :message, String

      # @!attribute tools_synced
      #   Number of tools synced.
      #
      #   @return [Integer]
      required :tools_synced, Integer, api_name: :toolsSynced

      # @!method initialize(message:, tools_synced:)
      #   Emitted when a tool set sync operation completes successfully.
      #
      #   @param message [String] Optional message with additional details.
      #
      #   @param tools_synced [Integer] Number of tools synced.
    end
  end
end
