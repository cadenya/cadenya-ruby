# frozen_string_literal: true

module Cadenya
  module Models
    class UpdateResourceMetadata < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #   Human-readable name for the resource (e.g., "Customer Support Agent", "Email
      #   Tool")
      #
      #   @return [String]
      required :name, String

      # @!attribute bundle_key
      #   Optional bundle ownership key. See ResourceMetadata.bundle_key.
      #
      #   @return [String, nil]
      optional :bundle_key, String, api_name: :bundleKey

      # @!attribute external_id
      #   External ID for the resource (e.g., a workflow ID from an external system)
      #
      #   @return [String, nil]
      optional :external_id, String, api_name: :externalId

      # @!attribute labels
      #   Arbitrary key-value pairs for categorization and filtering Examples:
      #   {"environment": "production", "team": "platform", "version": "v2"}
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Cadenya::Internal::Type::HashOf[String]

      # @!method initialize(name:, bundle_key: nil, external_id: nil, labels: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::UpdateResourceMetadata} for more details.
      #
      #   UpdateResourceMetadata contains the user-provided fields for updating a
      #   workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
      #   profile_id, created_at) are excluded since they are set by the server.
      #
      #   @param name [String] Human-readable name for the resource (e.g., "Customer Support Agent", "Email Too
      #
      #   @param bundle_key [String] Optional bundle ownership key. See ResourceMetadata.bundle_key.
      #
      #   @param external_id [String] External ID for the resource (e.g., a workflow ID from an external system)
      #
      #   @param labels [Hash{Symbol=>String}] Arbitrary key-value pairs for categorization and filtering
    end
  end
end
