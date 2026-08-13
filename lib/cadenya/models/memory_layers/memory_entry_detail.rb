# frozen_string_literal: true

module Cadenya
  module Models
    module MemoryLayers
      # @see Cadenya::Resources::MemoryLayers::Entries#create
      class MemoryEntryDetail < Cadenya::Internal::Type::BaseModel
        # @!attribute content
        #   The resolved body of the entry. For entries created or updated via an upload_id,
        #   this is the ingested content, not the original upload handle. May be empty; an
        #   entry with only a key and description is valid (e.g., a stub skill being
        #   drafted, or an entry where the frontmatter alone is the payload).
        #
        #   @return [String]
        required :content, String

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
        #   @return [Cadenya::Models::MemoryLayers::MemoryEntryInfo]
        required :info, -> { Cadenya::MemoryLayers::MemoryEntryInfo }

        # @!method initialize(content:, metadata:, spec:, info:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::MemoryLayers::MemoryEntryDetail} for more details.
        #
        #   MemoryEntryDetail is the full representation of an entry, including the resolved
        #   content body. Returned by GetMemoryEntry, CreateMemoryEntry, and
        #   UpdateMemoryEntry.
        #
        #   @param content [String] The resolved body of the entry. For entries created or updated via an
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
