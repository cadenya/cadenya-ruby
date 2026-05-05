# typed: strong

module Cadenya
  module Models
    module Agents
      class VariationUpdateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::VariationUpdateParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :agent_id

        sig { returns(String) }
        attr_accessor :id

        # UpdateResourceMetadata contains the user-provided fields for updating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        sig { returns(T.nilable(Cadenya::UpdateResourceMetadata)) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::UpdateResourceMetadata::OrHash).void }
        attr_writer :metadata

        # AgentVariationSpec defines the operational configuration for a variation
        sig { returns(T.nilable(Cadenya::Agents::AgentVariationSpec)) }
        attr_reader :spec

        sig { params(spec: Cadenya::Agents::AgentVariationSpec::OrHash).void }
        attr_writer :spec

        # Fields to update
        sig { returns(T.nilable(String)) }
        attr_reader :update_mask

        sig { params(update_mask: String).void }
        attr_writer :update_mask

        sig do
          params(
            workspace_id: String,
            agent_id: String,
            id: String,
            metadata: Cadenya::UpdateResourceMetadata::OrHash,
            spec: Cadenya::Agents::AgentVariationSpec::OrHash,
            update_mask: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          agent_id:,
          id:,
          # UpdateResourceMetadata contains the user-provided fields for updating a
          # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
          # profile_id, created_at) are excluded since they are set by the server.
          metadata: nil,
          # AgentVariationSpec defines the operational configuration for a variation
          spec: nil,
          # Fields to update
          update_mask: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              agent_id: String,
              id: String,
              metadata: Cadenya::UpdateResourceMetadata,
              spec: Cadenya::Agents::AgentVariationSpec,
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
