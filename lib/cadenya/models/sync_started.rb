# frozen_string_literal: true

module Cadenya
  module Models
    class SyncStarted < Cadenya::Internal::Type::BaseModel
      # @!attribute message
      #   Human-readable message describing the start of the sync.
      #
      #   @return [String]
      required :message, String

      # @!method initialize(message:)
      #   Emitted when a tool set sync operation begins.
      #
      #   @param message [String] Human-readable message describing the start of the sync.
    end
  end
end
