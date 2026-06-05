# typed: strong

module Cadenya
  module Models
    class WorkspaceAdminUpdateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::WorkspaceAdminUpdateParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :workspace_id

      # UpdateAccountResourceMetadata contains the user-provided fields for updating an
      # account-scoped resource. Read-only fields (id, account_id, profile_id) are
      # excluded since they are set by the server.
      sig { returns(T.nilable(Cadenya::WorkspaceAdminUpdateParams::Metadata)) }
      attr_reader :metadata

      sig do
        params(
          metadata: Cadenya::WorkspaceAdminUpdateParams::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      sig { returns(T.nilable(Cadenya::WorkspaceSpec)) }
      attr_reader :spec

      sig { params(spec: Cadenya::WorkspaceSpec::OrHash).void }
      attr_writer :spec

      # Fields to update.
      sig { returns(T.nilable(String)) }
      attr_reader :update_mask

      sig { params(update_mask: String).void }
      attr_writer :update_mask

      sig do
        params(
          workspace_id: String,
          metadata: Cadenya::WorkspaceAdminUpdateParams::Metadata::OrHash,
          spec: Cadenya::WorkspaceSpec::OrHash,
          update_mask: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id:,
        # UpdateAccountResourceMetadata contains the user-provided fields for updating an
        # account-scoped resource. Read-only fields (id, account_id, profile_id) are
        # excluded since they are set by the server.
        metadata: nil,
        spec: nil,
        # Fields to update.
        update_mask: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            metadata: Cadenya::WorkspaceAdminUpdateParams::Metadata,
            spec: Cadenya::WorkspaceSpec,
            update_mask: String,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Metadata < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::WorkspaceAdminUpdateParams::Metadata,
              Cadenya::Internal::AnyHash
            )
          end

        # Human-readable name for the resource (e.g., "Production API Key", "Staging
        # Workspace")
        sig { returns(String) }
        attr_accessor :name

        # External ID for the resource (e.g., a workflow ID from an external system)
        sig { returns(T.nilable(String)) }
        attr_reader :external_id

        sig { params(external_id: String).void }
        attr_writer :external_id

        # Arbitrary key-value pairs for categorization and filtering Examples:
        # {"environment": "production", "team": "platform", "version": "v2"}
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :labels

        sig { params(labels: T::Hash[Symbol, String]).void }
        attr_writer :labels

        # UpdateAccountResourceMetadata contains the user-provided fields for updating an
        # account-scoped resource. Read-only fields (id, account_id, profile_id) are
        # excluded since they are set by the server.
        sig do
          params(
            name: String,
            external_id: String,
            labels: T::Hash[Symbol, String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable name for the resource (e.g., "Production API Key", "Staging
          # Workspace")
          name:,
          # External ID for the resource (e.g., a workflow ID from an external system)
          external_id: nil,
          # Arbitrary key-value pairs for categorization and filtering Examples:
          # {"environment": "production", "team": "platform", "version": "v2"}
          labels: nil
        )
        end

        sig do
          override.returns(
            {
              name: String,
              external_id: String,
              labels: T::Hash[Symbol, String]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
