# typed: strong

module Cadenya
  module Models
    class AgentCreateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::AgentCreateParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      # CreateResourceMetadata contains the user-provided fields for creating a
      # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
      # profile_id, created_at) are excluded since they are set by the server.
      sig { returns(Cadenya::CreateResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::CreateResourceMetadata::OrHash).void }
      attr_writer :metadata

      # Agent specification (user-provided configuration)
      sig { returns(Cadenya::AgentSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::AgentSpec::OrHash).void }
      attr_writer :spec

      # Create agent variation request
      sig { returns(T.nilable(Cadenya::AgentCreateParams::DefaultVariation)) }
      attr_reader :default_variation

      sig do
        params(
          default_variation:
            Cadenya::AgentCreateParams::DefaultVariation::OrHash
        ).void
      end
      attr_writer :default_variation

      sig do
        params(
          metadata: Cadenya::CreateResourceMetadata::OrHash,
          spec: Cadenya::AgentSpec::OrHash,
          workspace_id: String,
          default_variation:
            Cadenya::AgentCreateParams::DefaultVariation::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # CreateResourceMetadata contains the user-provided fields for creating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        metadata:,
        # Agent specification (user-provided configuration)
        spec:,
        workspace_id: nil,
        # Create agent variation request
        default_variation: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            metadata: Cadenya::CreateResourceMetadata,
            spec: Cadenya::AgentSpec,
            default_variation: Cadenya::AgentCreateParams::DefaultVariation,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      class DefaultVariation < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::AgentCreateParams::DefaultVariation,
              Cadenya::Internal::AnyHash
            )
          end

        # CreateResourceMetadata contains the user-provided fields for creating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        sig { returns(Cadenya::CreateResourceMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::CreateResourceMetadata::OrHash).void }
        attr_writer :metadata

        # AgentVariationSpec defines the operational configuration for a variation
        sig { returns(Cadenya::Agents::AgentVariationSpec) }
        attr_reader :spec

        sig { params(spec: Cadenya::Agents::AgentVariationSpec::OrHash).void }
        attr_writer :spec

        # Create agent variation request
        sig do
          params(
            metadata: Cadenya::CreateResourceMetadata::OrHash,
            spec: Cadenya::Agents::AgentVariationSpec::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # CreateResourceMetadata contains the user-provided fields for creating a
          # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
          # profile_id, created_at) are excluded since they are set by the server.
          metadata:,
          # AgentVariationSpec defines the operational configuration for a variation
          spec:
        )
        end

        sig do
          override.returns(
            {
              metadata: Cadenya::CreateResourceMetadata,
              spec: Cadenya::Agents::AgentVariationSpec,
              agent_id: String,
              workspace_id: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
