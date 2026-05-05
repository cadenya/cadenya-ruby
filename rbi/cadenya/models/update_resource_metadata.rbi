# typed: strong

module Cadenya
  module Models
    class UpdateResourceMetadata < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::UpdateResourceMetadata, Cadenya::Internal::AnyHash)
        end

      # Human-readable name for the resource (e.g., "Customer Support Agent", "Email
      # Tool")
      sig { returns(String) }
      attr_accessor :name

      # Optional bundle ownership key. See ResourceMetadata.bundle_key.
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

      # UpdateResourceMetadata contains the user-provided fields for updating a
      # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
      # profile_id, created_at) are excluded since they are set by the server.
      sig do
        params(
          name: String,
          bundle_key: String,
          external_id: String,
          labels: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Human-readable name for the resource (e.g., "Customer Support Agent", "Email
        # Tool")
        name:,
        # Optional bundle ownership key. See ResourceMetadata.bundle_key.
        bundle_key: nil,
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
            bundle_key: String,
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
