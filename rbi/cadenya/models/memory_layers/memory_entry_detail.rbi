# typed: strong

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntryDetail < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::MemoryLayers::MemoryEntryDetail,
              Cadenya::Internal::AnyHash
            )
          end

        # The resolved body of the entry. For entries created or updated via an upload_id,
        # this is the ingested content, not the original upload handle. May be empty; an
        # entry with only a key and description is valid (e.g., a stub skill being
        # drafted, or an entry where the frontmatter alone is the payload).
        sig { returns(String) }
        attr_accessor :content

        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        sig { returns(Cadenya::ResourceMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
        attr_writer :metadata

        # MemoryEntrySpec is the metadata portion of an entry — the fields that identify
        # and describe it, without the body. It appears on both the summary (MemoryEntry)
        # and detail (MemoryEntryDetail) views.
        sig { returns(Cadenya::MemoryLayers::MemoryEntrySpec) }
        attr_reader :spec

        sig do
          params(spec: Cadenya::MemoryLayers::MemoryEntrySpec::OrHash).void
        end
        attr_writer :spec

        sig { returns(Cadenya::MemoryLayers::MemoryEntryInfo) }
        attr_accessor :info

        # MemoryEntryDetail is the full representation of an entry, including the resolved
        # content body. Returned by GetMemoryEntry, CreateMemoryEntry, and
        # UpdateMemoryEntry.
        sig do
          params(
            content: String,
            metadata: Cadenya::ResourceMetadata::OrHash,
            spec: Cadenya::MemoryLayers::MemoryEntrySpec::OrHash,
            info: Cadenya::MemoryLayers::MemoryEntryInfo::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The resolved body of the entry. For entries created or updated via an upload_id,
          # this is the ingested content, not the original upload handle. May be empty; an
          # entry with only a key and description is valid (e.g., a stub skill being
          # drafted, or an entry where the frontmatter alone is the payload).
          content:,
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          metadata:,
          # MemoryEntrySpec is the metadata portion of an entry — the fields that identify
          # and describe it, without the body. It appears on both the summary (MemoryEntry)
          # and detail (MemoryEntryDetail) views.
          spec:,
          info:
        )
        end

        sig do
          override.returns(
            {
              content: String,
              metadata: Cadenya::ResourceMetadata,
              spec: Cadenya::MemoryLayers::MemoryEntrySpec,
              info: Cadenya::MemoryLayers::MemoryEntryInfo
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
