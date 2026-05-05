# frozen_string_literal: true

module Cadenya
  module Models
    class OperationMetadata < Cadenya::Internal::Type::BaseModel
      # @!attribute external_id
      #   External ID for the operation (e.g., a workflow ID from an external system)
      #
      #   @return [String, nil]
      optional :external_id, String, api_name: :externalId

      # @!attribute labels
      #   Arbitrary key-value pairs for categorization and filtering Examples:
      #   {"priority": "high", "source": "api", "workflow": "onboarding"}
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Cadenya::Internal::Type::HashOf[String]

      response_only do
        # @!attribute id
        #   Unique identifier for the operation (prefixed ULID, e.g., "obj_01HXK...")
        #
        #   @return [String]
        required :id, String

        # @!attribute account_id
        #   Account this operation belongs to for multi-tenant isolation (prefixed ULID)
        #
        #   @return [String]
        required :account_id, String, api_name: :accountId

        # @!attribute created_at
        #   Timestamp when this operation was created ULID includes timestamp information,
        #   but this explicit field enables easier querying
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute profile_id
        #   ID of the actor (user or service account) that created this operation
        #
        #   @return [String]
        required :profile_id, String, api_name: :profileId

        # @!attribute workspace_id
        #   Workspace this operation belongs to for organizational grouping (prefixed ULID)
        #
        #   @return [String]
        required :workspace_id, String, api_name: :workspaceId
      end

      # @!method initialize(id:, account_id:, created_at:, profile_id:, workspace_id:, external_id: nil, labels: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::OperationMetadata} for more details.
      #
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @param id [String] Unique identifier for the operation (prefixed ULID, e.g., "obj_01HXK...")
      #
      #   @param account_id [String] Account this operation belongs to for multi-tenant isolation (prefixed ULID)
      #
      #   @param created_at [Time] Timestamp when this operation was created
      #
      #   @param profile_id [String] ID of the actor (user or service account) that created this operation
      #
      #   @param workspace_id [String] Workspace this operation belongs to for organizational grouping (prefixed ULID)
      #
      #   @param external_id [String] External ID for the operation (e.g., a workflow ID from an external system)
      #
      #   @param labels [Hash{Symbol=>String}] Arbitrary key-value pairs for categorization and filtering
    end
  end
end
