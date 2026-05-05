# typed: strong

module Cadenya
  module Models
    module MemoryLayers
      class EntryUpdateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::MemoryLayers::EntryUpdateParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :memory_layer_id

        sig { returns(String) }
        attr_accessor :id

        # UpdateResourceMetadata contains the user-provided fields for updating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        sig { returns(T.nilable(Cadenya::UpdateResourceMetadata)) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::UpdateResourceMetadata::OrHash).void }
        attr_writer :metadata

        # MemoryEntryUpdateSpec is the input shape for UpdateMemoryEntry. Fields present
        # in the request's update_mask are applied; unset fields are left alone. The
        # source oneof is optional for updates — omit it to leave the body untouched, or
        # set exactly one branch to replace it.
        sig { returns(T.nilable(Cadenya::MemoryLayers::MemoryEntryUpdateSpec)) }
        attr_reader :spec

        sig do
          params(
            spec: Cadenya::MemoryLayers::MemoryEntryUpdateSpec::OrHash
          ).void
        end
        attr_writer :spec

        sig { returns(T.nilable(String)) }
        attr_reader :update_mask

        sig { params(update_mask: String).void }
        attr_writer :update_mask

        sig do
          params(
            workspace_id: String,
            memory_layer_id: String,
            id: String,
            metadata: Cadenya::UpdateResourceMetadata::OrHash,
            spec: Cadenya::MemoryLayers::MemoryEntryUpdateSpec::OrHash,
            update_mask: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          memory_layer_id:,
          id:,
          # UpdateResourceMetadata contains the user-provided fields for updating a
          # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
          # profile_id, created_at) are excluded since they are set by the server.
          metadata: nil,
          # MemoryEntryUpdateSpec is the input shape for UpdateMemoryEntry. Fields present
          # in the request's update_mask are applied; unset fields are left alone. The
          # source oneof is optional for updates — omit it to leave the body untouched, or
          # set exactly one branch to replace it.
          spec: nil,
          update_mask: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              memory_layer_id: String,
              id: String,
              metadata: Cadenya::UpdateResourceMetadata,
              spec: Cadenya::MemoryLayers::MemoryEntryUpdateSpec,
              update_mask: String,
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
