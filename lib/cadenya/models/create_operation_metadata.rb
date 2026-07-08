# frozen_string_literal: true

module Cadenya
  module Models
    class CreateOperationMetadata < Cadenya::Internal::Type::BaseModel
      # @!attribute external_id
      #   External ID for the operation (e.g., a workflow ID from an external system)
      #
      #   @return [String, nil]
      optional :external_id, String, api_name: :externalId

      # @!attribute labels
      #   Key-value pairs for categorization and filtering. Values are 0-63 alphanumeric
      #   characters with "-", "\_", or "." allowed between; keys follow the same shape
      #   and additionally accept an optional DNS-subdomain prefix (e.g. "cadenya.com/")
      #   of at most 253 characters. Examples: {"priority": "high", "source": "api",
      #   "workflow": "onboarding"}
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Cadenya::Internal::Type::HashOf[String]

      # @!method initialize(external_id: nil, labels: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::CreateOperationMetadata} for more details.
      #
      #   CreateOperationMetadata contains the user-provided fields for creating an
      #   operation. Read-only fields (id, account_id, workspace_id, created_at,
      #   profile_id) are excluded since they are set by the server.
      #
      #   @param external_id [String] External ID for the operation (e.g., a workflow ID from an external system)
      #
      #   @param labels [Hash{Symbol=>String}] Key-value pairs for categorization and filtering. Values are 0-63
    end
  end
end
