# typed: strong

module Cadenya
  module Models
    class MemoryReference < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::MemoryReference, Cadenya::Internal::AnyHash)
        end

      # When set, inserts only this entry from memory_layer_id into the cascade —
      # behaves as a single-entry layer (only this key resolves at this position). The
      # entry must belong to memory_layer_id; mismatches are rejected with
      # InvalidArgument.
      sig { returns(T.nilable(String)) }
      attr_reader :memory_entry_id

      sig { params(memory_entry_id: String).void }
      attr_writer :memory_entry_id

      sig { returns(T.nilable(String)) }
      attr_reader :memory_layer_id

      sig { params(memory_layer_id: String).void }
      attr_writer :memory_layer_id

      # MemoryReference identifies a memory layer or a specific entry within one, for
      # composition into a memory cascade. Used on objectives (where entry pinning is
      # permitted).
      #
      # memory*layer_id accepts both the canonical form (memlyr*…) and the external-id
      # form (external_id:my-custom-id). The same applies to memory_entry_id when set.
      sig do
        params(memory_entry_id: String, memory_layer_id: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # When set, inserts only this entry from memory_layer_id into the cascade —
        # behaves as a single-entry layer (only this key resolves at this position). The
        # entry must belong to memory_layer_id; mismatches are rejected with
        # InvalidArgument.
        memory_entry_id: nil,
        memory_layer_id: nil
      )
      end

      sig do
        override.returns({ memory_entry_id: String, memory_layer_id: String })
      end
      def to_hash
      end
    end
  end
end
