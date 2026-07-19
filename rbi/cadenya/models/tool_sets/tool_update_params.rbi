# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ToolUpdateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ToolSets::ToolUpdateParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig { returns(String) }
        attr_accessor :tool_set_id

        sig { returns(String) }
        attr_accessor :id

        # UpdateResourceMetadata contains the user-provided fields for updating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        sig { returns(T.nilable(Cadenya::UpdateResourceMetadata)) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::UpdateResourceMetadata::OrHash).void }
        attr_writer :metadata

        sig { returns(T.nilable(Cadenya::ToolSets::ToolSpec)) }
        attr_reader :spec

        sig { params(spec: Cadenya::ToolSets::ToolSpec::OrHash).void }
        attr_writer :spec

        sig { returns(T.nilable(String)) }
        attr_reader :update_mask

        sig { params(update_mask: String).void }
        attr_writer :update_mask

        sig do
          params(
            tool_set_id: String,
            id: String,
            workspace_id: String,
            metadata: Cadenya::UpdateResourceMetadata::OrHash,
            spec: Cadenya::ToolSets::ToolSpec::OrHash,
            update_mask: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          tool_set_id:,
          id:,
          workspace_id: nil,
          # UpdateResourceMetadata contains the user-provided fields for updating a
          # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
          # profile_id, created_at) are excluded since they are set by the server.
          metadata: nil,
          spec: nil,
          update_mask: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              tool_set_id: String,
              id: String,
              metadata: Cadenya::UpdateResourceMetadata,
              spec: Cadenya::ToolSets::ToolSpec,
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
