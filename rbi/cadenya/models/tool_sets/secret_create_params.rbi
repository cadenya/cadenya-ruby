# typed: strong

module Cadenya
  module Models
    module ToolSets
      class SecretCreateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ToolSets::SecretCreateParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig { returns(String) }
        attr_accessor :tool_set_id

        # CreateResourceMetadata contains the user-provided fields for creating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        sig { returns(Cadenya::CreateResourceMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::CreateResourceMetadata::OrHash).void }
        attr_writer :metadata

        sig { returns(Cadenya::ToolSets::ToolSetSecretSpec) }
        attr_reader :spec

        sig { params(spec: Cadenya::ToolSets::ToolSetSecretSpec::OrHash).void }
        attr_writer :spec

        sig do
          params(
            tool_set_id: String,
            metadata: Cadenya::CreateResourceMetadata::OrHash,
            spec: Cadenya::ToolSets::ToolSetSecretSpec::OrHash,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          tool_set_id:,
          # CreateResourceMetadata contains the user-provided fields for creating a
          # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
          # profile_id, created_at) are excluded since they are set by the server.
          metadata:,
          spec:,
          workspace_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              tool_set_id: String,
              metadata: Cadenya::CreateResourceMetadata,
              spec: Cadenya::ToolSets::ToolSetSecretSpec,
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
