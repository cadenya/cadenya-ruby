# frozen_string_literal: true

module Cadenya
  module Models
    class MemoryRead < Cadenya::Internal::Type::BaseModel
      # @!attribute memory_entry_id
      #   The specific entry that was read.
      #
      #   @return [String]
      required :memory_entry_id, String, api_name: :memoryEntryId

      # @!attribute memory_layer_id
      #   The layer the entry resolved to. The top-most layer that contained the key —
      #   other layers beneath it that also contained the key are shadowed and not
      #   referenced here.
      #
      #   @return [String]
      required :memory_layer_id, String, api_name: :memoryLayerId

      # @!attribute message
      #   Human-readable description of the read, set by the runtime. For example: "Loaded
      #   skill", "Resolved context key". Not machine-parsed; intended for UI display
      #   alongside the other events in an objective's timeline.
      #
      #   @return [String]
      required :message, String

      # @!method initialize(memory_entry_id:, memory_layer_id:, message:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::MemoryRead} for more details.
      #
      #   MemoryRead is emitted each time the agent resolves a key against the memory
      #   cascade and loads an entry. Lookups that miss (key not found in any layer) do
      #   not emit this event.
      #
      #   @param memory_entry_id [String] The specific entry that was read.
      #
      #   @param memory_layer_id [String] The layer the entry resolved to. The top-most layer that contained
      #
      #   @param message [String] Human-readable description of the read, set by the runtime. For
    end
  end
end
