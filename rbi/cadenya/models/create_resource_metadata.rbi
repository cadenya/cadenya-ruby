# typed: strong

module Cadenya
  module Models
    class CreateResourceMetadata < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::CreateResourceMetadata, Cadenya::Internal::AnyHash)
        end

      # Human-readable name for the resource (e.g., "Customer Support Agent", "Email
      # Tool")
      sig { returns(String) }
      attr_accessor :name

      # External ID for the resource (e.g., a workflow ID from an external system)
      sig { returns(T.nilable(String)) }
      attr_reader :external_id

      sig { params(external_id: String).void }
      attr_writer :external_id

      # Key-value pairs for categorization and filtering. Values are 0-63 alphanumeric
      # characters with "-", "\_", or "." allowed between; keys follow the same shape
      # and additionally accept an optional DNS-subdomain prefix (e.g. "cadenya.com/")
      # of at most 253 characters. Examples: {"environment": "production", "team":
      # "platform", "version": "v2"}
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # CreateResourceMetadata contains the user-provided fields for creating a
      # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
      # profile_id, created_at) are excluded since they are set by the server.
      sig do
        params(
          name: String,
          external_id: String,
          labels: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Human-readable name for the resource (e.g., "Customer Support Agent", "Email
        # Tool")
        name:,
        # External ID for the resource (e.g., a workflow ID from an external system)
        external_id: nil,
        # Key-value pairs for categorization and filtering. Values are 0-63 alphanumeric
        # characters with "-", "\_", or "." allowed between; keys follow the same shape
        # and additionally accept an optional DNS-subdomain prefix (e.g. "cadenya.com/")
        # of at most 253 characters. Examples: {"environment": "production", "team":
        # "platform", "version": "v2"}
        labels: nil
      )
      end

      sig do
        override.returns(
          { name: String, external_id: String, labels: T::Hash[Symbol, String] }
        )
      end
      def to_hash
      end
    end
  end
end
