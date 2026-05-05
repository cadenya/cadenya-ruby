# typed: strong

module Cadenya
  module Models
    class OperationMetadata < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::OperationMetadata, Cadenya::Internal::AnyHash)
        end

      # External ID for the operation (e.g., a workflow ID from an external system)
      sig { returns(T.nilable(String)) }
      attr_reader :external_id

      sig { params(external_id: String).void }
      attr_writer :external_id

      # Arbitrary key-value pairs for categorization and filtering Examples:
      # {"priority": "high", "source": "api", "workflow": "onboarding"}
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # Unique identifier for the operation (prefixed ULID, e.g., "obj_01HXK...")
      sig { returns(String) }
      attr_accessor :id

      # Account this operation belongs to for multi-tenant isolation (prefixed ULID)
      sig { returns(String) }
      attr_accessor :account_id

      # Timestamp when this operation was created ULID includes timestamp information,
      # but this explicit field enables easier querying
      sig { returns(Time) }
      attr_accessor :created_at

      # ID of the actor (user or service account) that created this operation
      sig { returns(String) }
      attr_accessor :profile_id

      # Workspace this operation belongs to for organizational grouping (prefixed ULID)
      sig { returns(String) }
      attr_accessor :workspace_id

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig do
        params(
          id: String,
          account_id: String,
          created_at: Time,
          profile_id: String,
          workspace_id: String,
          external_id: String,
          labels: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the operation (prefixed ULID, e.g., "obj_01HXK...")
        id:,
        # Account this operation belongs to for multi-tenant isolation (prefixed ULID)
        account_id:,
        # Timestamp when this operation was created ULID includes timestamp information,
        # but this explicit field enables easier querying
        created_at:,
        # ID of the actor (user or service account) that created this operation
        profile_id:,
        # Workspace this operation belongs to for organizational grouping (prefixed ULID)
        workspace_id:,
        # External ID for the operation (e.g., a workflow ID from an external system)
        external_id: nil,
        # Arbitrary key-value pairs for categorization and filtering Examples:
        # {"priority": "high", "source": "api", "workflow": "onboarding"}
        labels: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            created_at: Time,
            profile_id: String,
            workspace_id: String,
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
