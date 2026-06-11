# frozen_string_literal: true

module Cadenya
  module Models
    module MemoryLayers
      # @see Cadenya::Resources::MemoryLayers::Entries#list
      class MemoryEntry < Cadenya::Internal::Type::BaseModel
        # @!attribute metadata
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata]
        required :metadata, -> { Cadenya::ResourceMetadata }

        # @!attribute spec
        #   MemoryEntrySpec is the metadata portion of an entry — the fields that identify
        #   and describe it, without the body. It appears on both the summary (MemoryEntry)
        #   and detail (MemoryEntryDetail) views.
        #
        #   @return [Cadenya::Models::MemoryLayers::MemoryEntrySpec]
        required :spec, -> { Cadenya::MemoryLayers::MemoryEntrySpec }

        # @!attribute info
        #
        #   @return [Cadenya::Models::MemoryLayers::MemoryEntryInfo, nil]
        optional :info, -> { Cadenya::MemoryLayers::MemoryEntryInfo }

        # @!method initialize(metadata:, spec:, info: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::MemoryLayers::MemoryEntry} for more details.
        #
        #   MemoryEntry is a single keyed value within a MemoryLayer. Entries are addressed
        #   by their key, which follows the S3 object key safe-character convention (see
        #   MemoryEntrySpec.key for the full rule). Keys are unique within a single layer;
        #   the same key may appear in multiple layers, in which case the cascade walk
        #   determines which one wins for a given objective (most specific layer first).
        #
        #   MemoryEntry is the summary shape, returned by ListMemoryEntries. It does not
        #   carry the entry body — callers that need the body must fetch the entry
        #   individually via GetMemoryEntry, which returns a MemoryEntryDetail.
        #
        #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @param spec [Cadenya::Models::MemoryLayers::MemoryEntrySpec] MemoryEntrySpec is the metadata portion of an entry — the fields that
        #
        #   @param info [Cadenya::Models::MemoryLayers::MemoryEntryInfo]
      end
    end
  end
end
