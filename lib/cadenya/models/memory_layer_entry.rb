# frozen_string_literal: true

module Cadenya
  module Models
    class MemoryLayerEntry < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute spec
      #
      #   @return [Cadenya::Models::MemoryLayerSpec]
      required :spec, -> { Cadenya::MemoryLayerSpec }

      # @!attribute entries
      #   Memory entries in this layer, keyed by external_id.
      #
      #   @return [Hash{Symbol=>Cadenya::Models::MemoryEntryItem}, nil]
      optional :entries, -> { Cadenya::Internal::Type::HashOf[Cadenya::MemoryEntryItem] }

      # @!attribute labels
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Cadenya::Internal::Type::HashOf[String]

      # @!method initialize(name:, spec:, entries: nil, labels: nil)
      #   @param name [String]
      #
      #   @param spec [Cadenya::Models::MemoryLayerSpec]
      #
      #   @param entries [Hash{Symbol=>Cadenya::Models::MemoryEntryItem}] Memory entries in this layer, keyed by external_id.
      #
      #   @param labels [Hash{Symbol=>String}]
    end
  end
end
