# typed: strong

module Cadenya
  module Models
    class ResourceMetadata < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ResourceMetadata, Cadenya::Internal::AnyHash)
        end

      # Human-readable name for the resource (e.g., "Customer Support Agent", "Email
      # Tool") Required for resources that users interact with directly
      sig { returns(String) }
      attr_accessor :name

      # Optional bundle ownership key. When set, indicates the resource is managed by a
      # configuration bundle identified by this key. Used by
      # BulkWorkspaceResources.Apply to track which resources belong to which bundle for
      # reconciliation / soft-delete on re-apply.
      sig { returns(T.nilable(String)) }
      attr_reader :bundle_key

      sig { params(bundle_key: String).void }
      attr_writer :bundle_key

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

      # Unique identifier for the resource (prefixed ULID, e.g., "agent_01HXK...")
      sig { returns(String) }
      attr_accessor :id

      # Account this resource belongs to for multi-tenant isolation (prefixed ULID)
      sig { returns(String) }
      attr_accessor :account_id

      # Timestamp when this resource was created
      sig { returns(Time) }
      attr_accessor :created_at

      # ID of the actor (user or service account) that created this resource
      sig { returns(String) }
      attr_accessor :profile_id

      # Workspace this resource belongs to for organizational grouping (prefixed ULID)
      sig { returns(String) }
      attr_accessor :workspace_id

      # Timestamp when this resource was last updated
      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig do
        params(
          id: String,
          account_id: String,
          created_at: Time,
          name: String,
          profile_id: String,
          workspace_id: String,
          bundle_key: String,
          external_id: String,
          labels: T::Hash[Symbol, String],
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the resource (prefixed ULID, e.g., "agent_01HXK...")
        id:,
        # Account this resource belongs to for multi-tenant isolation (prefixed ULID)
        account_id:,
        # Timestamp when this resource was created
        created_at:,
        # Human-readable name for the resource (e.g., "Customer Support Agent", "Email
        # Tool") Required for resources that users interact with directly
        name:,
        # ID of the actor (user or service account) that created this resource
        profile_id:,
        # Workspace this resource belongs to for organizational grouping (prefixed ULID)
        workspace_id:,
        # Optional bundle ownership key. When set, indicates the resource is managed by a
        # configuration bundle identified by this key. Used by
        # BulkWorkspaceResources.Apply to track which resources belong to which bundle for
        # reconciliation / soft-delete on re-apply.
        bundle_key: nil,
        # External ID for the resource (e.g., a workflow ID from an external system)
        external_id: nil,
        # Arbitrary key-value pairs for categorization and filtering Examples:
        # {"environment": "production", "team": "platform", "version": "v2"}
        labels: nil,
        # Timestamp when this resource was last updated
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            created_at: Time,
            name: String,
            profile_id: String,
            workspace_id: String,
            bundle_key: String,
            external_id: String,
            labels: T::Hash[Symbol, String],
            updated_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end
