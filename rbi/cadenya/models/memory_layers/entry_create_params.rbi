# typed: strong

module Cadenya
  module Models
    module MemoryLayers
      class EntryCreateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::MemoryLayers::EntryCreateParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :memory_layer_id

        # CreateResourceMetadata contains the user-provided fields for creating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        sig { returns(Cadenya::CreateResourceMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::CreateResourceMetadata::OrHash).void }
        attr_writer :metadata

        # MemoryEntryCreateSpec is the input shape for CreateMemoryEntry. It accepts
        # either inline content or a reference to a completed Upload; exactly one of the
        # two must be set.
        sig { returns(Cadenya::MemoryLayers::MemoryEntryCreateSpec) }
        attr_reader :spec

        sig do
          params(
            spec: Cadenya::MemoryLayers::MemoryEntryCreateSpec::OrHash
          ).void
        end
        attr_writer :spec

        sig do
          params(
            workspace_id: String,
            memory_layer_id: String,
            metadata: Cadenya::CreateResourceMetadata::OrHash,
            spec: Cadenya::MemoryLayers::MemoryEntryCreateSpec::OrHash,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          memory_layer_id:,
          # CreateResourceMetadata contains the user-provided fields for creating a
          # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
          # profile_id, created_at) are excluded since they are set by the server.
          metadata:,
          # MemoryEntryCreateSpec is the input shape for CreateMemoryEntry. It accepts
          # either inline content or a reference to a completed Upload; exactly one of the
          # two must be set.
          spec:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              memory_layer_id: String,
              metadata: Cadenya::CreateResourceMetadata,
              spec: Cadenya::MemoryLayers::MemoryEntryCreateSpec,
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
