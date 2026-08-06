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

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

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
        sig do
          returns(
            T.any(
              Cadenya::MemoryLayers::MemoryEntryCreateSpecContent,
              Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID
            )
          )
        end
        attr_accessor :spec

        sig do
          params(
            memory_layer_id: String,
            metadata: Cadenya::CreateResourceMetadata::OrHash,
            spec:
              T.any(
                Cadenya::MemoryLayers::MemoryEntryCreateSpecContent::OrHash,
                Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID::OrHash
              ),
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          memory_layer_id:,
          # CreateResourceMetadata contains the user-provided fields for creating a
          # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
          # profile_id, created_at) are excluded since they are set by the server.
          metadata:,
          # MemoryEntryCreateSpec is the input shape for CreateMemoryEntry. It accepts
          # either inline content or a reference to a completed Upload; exactly one of the
          # two must be set.
          spec:,
          workspace_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              memory_layer_id: String,
              metadata: Cadenya::CreateResourceMetadata,
              spec:
                T.any(
                  Cadenya::MemoryLayers::MemoryEntryCreateSpecContent,
                  Cadenya::MemoryLayers::MemoryEntryCreateSpecUploadID
                ),
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
