# typed: strong

module Cadenya
  module Models
    class AccountResourceMetadata < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AccountResourceMetadata, Cadenya::Internal::AnyHash)
        end

      # Human-readable name for the resource (e.g., "Customer Support Agent", "Email
      # Tool") Required for resources that users interact with directly
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

      # Unique identifier for the resource (prefixed ULID, e.g., "apikey_01HXK...")
      sig { returns(String) }
      attr_accessor :id

      # Account this resource belongs to for multi-tenant isolation (prefixed ULID)
      sig { returns(String) }
      attr_accessor :account_id

      sig { returns(String) }
      attr_accessor :profile_id

      # AccountResourceMetadata is used to represent a resource that is associated to an
      # account but not to a workspace.
      sig do
        params(
          id: String,
          account_id: String,
          name: String,
          profile_id: String,
          external_id: String,
          labels: T::Hash[Symbol, String]
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the resource (prefixed ULID, e.g., "apikey_01HXK...")
        id:,
        # Account this resource belongs to for multi-tenant isolation (prefixed ULID)
        account_id:,
        # Human-readable name for the resource (e.g., "Customer Support Agent", "Email
        # Tool") Required for resources that users interact with directly
        name:,
        profile_id:,
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
            id: String,
            account_id: String,
            name: String,
            profile_id: String,
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
