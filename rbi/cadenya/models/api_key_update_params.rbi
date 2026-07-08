# typed: strong

module Cadenya
  module Models
    class APIKeyUpdateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::APIKeyUpdateParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # UpdateAccountResourceMetadata contains the user-provided fields for updating an
      # account-scoped resource. Read-only fields (id, account_id, profile_id) are
      # excluded since they are set by the server.
      sig { returns(T.nilable(Cadenya::APIKeyUpdateParams::Metadata)) }
      attr_reader :metadata

      sig do
        params(metadata: Cadenya::APIKeyUpdateParams::Metadata::OrHash).void
      end
      attr_writer :metadata

      # Configuration for an API key.
      sig { returns(T.nilable(Cadenya::APIKeySpec)) }
      attr_reader :spec

      sig { params(spec: Cadenya::APIKeySpec::OrHash).void }
      attr_writer :spec

      # Fields to update.
      sig { returns(T.nilable(String)) }
      attr_reader :update_mask

      sig { params(update_mask: String).void }
      attr_writer :update_mask

      sig do
        params(
          id: String,
          metadata: Cadenya::APIKeyUpdateParams::Metadata::OrHash,
          spec: Cadenya::APIKeySpec::OrHash,
          update_mask: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # UpdateAccountResourceMetadata contains the user-provided fields for updating an
        # account-scoped resource. Read-only fields (id, account_id, profile_id) are
        # excluded since they are set by the server.
        metadata: nil,
        # Configuration for an API key.
        spec: nil,
        # Fields to update.
        update_mask: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            metadata: Cadenya::APIKeyUpdateParams::Metadata,
            spec: Cadenya::APIKeySpec,
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
              Cadenya::APIKeyUpdateParams::Metadata,
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

        # Key-value pairs for categorization and filtering. Values are 0-63 alphanumeric
        # characters with "-", "\_", or "." allowed between; keys follow the same shape
        # and additionally accept an optional DNS-subdomain prefix (e.g. "cadenya.com/")
        # of at most 253 characters. Examples: {"environment": "production", "team":
        # "platform", "version": "v2"}
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
