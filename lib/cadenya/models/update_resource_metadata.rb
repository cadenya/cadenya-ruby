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

      # @!attribute external_id
      #   External ID for the resource (e.g., a workflow ID from an external system)
      #
      #   @return [String, nil]
      optional :external_id, String, api_name: :externalId

      # @!attribute labels
      #   Key-value pairs for categorization and filtering. Values are 0-63 alphanumeric
      #   characters with "-", "\_", or "." allowed between; keys follow the same shape
      #   and additionally accept an optional DNS-subdomain prefix (e.g. "cadenya.com/")
      #   of at most 253 characters. Examples: {"environment": "production", "team":
      #   "platform", "version": "v2"}
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Cadenya::Internal::Type::HashOf[String]

      # @!method initialize(name:, external_id: nil, labels: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::UpdateResourceMetadata} for more details.
      #
      #   UpdateResourceMetadata contains the user-provided fields for updating a
      #   workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
      #   profile_id, created_at) are excluded since they are set by the server.
      #
      #   @param name [String] Human-readable name for the resource (e.g., "Customer Support Agent", "Email Too
      #
      #   @param external_id [String] External ID for the resource (e.g., a workflow ID from an external system)
      #
      #   @param labels [Hash{Symbol=>String}] Key-value pairs for categorization and filtering. Values are 0-63
    end
  end
end
