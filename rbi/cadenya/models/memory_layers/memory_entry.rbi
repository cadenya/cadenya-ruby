# typed: strong

module Cadenya
  module Models
    module MemoryLayers
      class MemoryEntry < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::MemoryLayers::MemoryEntry,
              Cadenya::Internal::AnyHash
            )
          end

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

        sig { returns(T.nilable(Cadenya::MemoryLayers::MemoryEntryInfo)) }
        attr_reader :info

        sig do
          params(info: Cadenya::MemoryLayers::MemoryEntryInfo::OrHash).void
        end
        attr_writer :info

        # MemoryEntry is a single keyed value within a MemoryLayer. Entries are addressed
        # by their key, which follows the S3 object key safe-character convention (see
        # MemoryEntrySpec.key for the full rule). Keys are unique within a single layer;
        # the same key may appear in multiple layers, in which case the LIFO stack-walk
        # determines which one wins for a given objective.
        #
        # MemoryEntry is the summary shape, returned by ListMemoryEntries. It does not
        # carry the entry body — callers that need the body must fetch the entry
        # individually via GetMemoryEntry, which returns a MemoryEntryDetail.
        sig do
          params(
            metadata: Cadenya::ResourceMetadata::OrHash,
            spec: Cadenya::MemoryLayers::MemoryEntrySpec::OrHash,
            info: Cadenya::MemoryLayers::MemoryEntryInfo::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          metadata:,
          # MemoryEntrySpec is the metadata portion of an entry — the fields that identify
          # and describe it, without the body. It appears on both the summary (MemoryEntry)
          # and detail (MemoryEntryDetail) views.
          spec:,
          info: nil
        )
        end

        sig do
          override.returns(
            {
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
