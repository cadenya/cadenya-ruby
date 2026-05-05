# typed: strong

module Cadenya
  module Models
    class MemoryRead < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::MemoryRead, Cadenya::Internal::AnyHash) }

      # The specific entry that was read.
      sig { returns(T.nilable(String)) }
      attr_reader :memory_entry_id

      sig { params(memory_entry_id: String).void }
      attr_writer :memory_entry_id

      # The layer the entry resolved to. The top-most layer that contained the key —
      # other layers beneath it that also contained the key are shadowed and not
      # referenced here.
      sig { returns(T.nilable(String)) }
      attr_reader :memory_layer_id

      sig { params(memory_layer_id: String).void }
      attr_writer :memory_layer_id

      # Human-readable description of the read, set by the runtime. For example: "Loaded
      # skill", "Resolved context key". Not machine-parsed; intended for UI display
      # alongside the other events in an objective's timeline.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # MemoryRead is emitted each time the agent resolves a key against the memory
      # stack and loads an entry. Lookups that miss (key not found in any layer) do not
      # emit this event.
      sig do
        params(
          memory_entry_id: String,
          memory_layer_id: String,
          message: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The specific entry that was read.
        memory_entry_id: nil,
        # The layer the entry resolved to. The top-most layer that contained the key —
        # other layers beneath it that also contained the key are shadowed and not
        # referenced here.
        memory_layer_id: nil,
        # Human-readable description of the read, set by the runtime. For example: "Loaded
        # skill", "Resolved context key". Not machine-parsed; intended for UI display
        # alongside the other events in an objective's timeline.
        message: nil
      )
      end

      sig do
        override.returns(
          { memory_entry_id: String, memory_layer_id: String, message: String }
        )
      end
      def to_hash
      end
    end
  end
end
