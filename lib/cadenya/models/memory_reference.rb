# frozen_string_literal: true

module Cadenya
  module Models
    class MemoryReference < Cadenya::Internal::Type::BaseModel
      # @!attribute memory_entry_id
      #   When set, inserts only this entry from memory_layer_id into the cascade —
      #   behaves as a single-entry layer (only this key resolves at this position). The
      #   entry must belong to memory_layer_id; mismatches are rejected with
      #   InvalidArgument.
      #
      #   @return [String, nil]
      optional :memory_entry_id, String, api_name: :memoryEntryId

      # @!attribute memory_layer_id
      #
      #   @return [String, nil]
      optional :memory_layer_id, String, api_name: :memoryLayerId

      # @!method initialize(memory_entry_id: nil, memory_layer_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::MemoryReference} for more details.
      #
      #   MemoryReference identifies a memory layer or a specific entry within one, for
      #   composition into a memory cascade. Used on objectives (where entry pinning is
      #   permitted).
      #
      #   memory*layer_id accepts both the canonical form (memlyr*…) and the external-id
      #   form (external_id:my-custom-id). The same applies to memory_entry_id when set.
      #
      #   @param memory_entry_id [String] When set, inserts only this entry from memory_layer_id into the cascade —
      #
      #   @param memory_layer_id [String]
    end
  end
end
