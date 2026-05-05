# typed: strong

module Cadenya
  module Models
    module Agents
      class ScheduleCreateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::ScheduleCreateParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :agent_id

        # CreateResourceMetadata contains the user-provided fields for creating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        sig { returns(Cadenya::CreateResourceMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::CreateResourceMetadata::OrHash).void }
        attr_writer :metadata

        # AgentScheduleSpec is the user-provided configuration for a schedule.
        sig { returns(Cadenya::Agents::AgentScheduleSpec) }
        attr_reader :spec

        sig { params(spec: Cadenya::Agents::AgentScheduleSpec::OrHash).void }
        attr_writer :spec

        sig do
          params(
            workspace_id: String,
            agent_id: String,
            metadata: Cadenya::CreateResourceMetadata::OrHash,
            spec: Cadenya::Agents::AgentScheduleSpec::OrHash,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          agent_id:,
          # CreateResourceMetadata contains the user-provided fields for creating a
          # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
          # profile_id, created_at) are excluded since they are set by the server.
          metadata:,
          # AgentScheduleSpec is the user-provided configuration for a schedule.
          spec:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              agent_id: String,
              metadata: Cadenya::CreateResourceMetadata,
              spec: Cadenya::Agents::AgentScheduleSpec,
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
