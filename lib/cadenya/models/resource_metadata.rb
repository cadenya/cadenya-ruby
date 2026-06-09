# frozen_string_literal: true

module Cadenya
  module Models
    class ResourceMetadata < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #   Human-readable name for the resource (e.g., "Customer Support Agent", "Email
      #   Tool") Required for resources that users interact with directly
      #
      #   @return [String]
      required :name, String

      # @!attribute bundle_key
      #   Optional bundle ownership key. When set, indicates the resource is managed by a
      #   configuration bundle identified by this key. Used by
      #   BulkWorkspaceResources.Apply to track which resources belong to which bundle for
      #   reconciliation / soft-delete on re-apply.
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

      response_only do
        # @!attribute id
        #   Unique identifier for the resource (prefixed ULID, e.g., "agent_01HXK...")
        #
        #   @return [String]
        required :id, String

        # @!attribute account_id
        #   Account this resource belongs to for multi-tenant isolation (prefixed ULID)
        #
        #   @return [String]
        required :account_id, String, api_name: :accountId

        # @!attribute created_at
        #   Timestamp when this resource was created
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute profile_id
        #   ID of the actor (user or service account) that created this resource
        #
        #   @return [String]
        required :profile_id, String, api_name: :profileId

        # @!attribute workspace_id
        #   Workspace this resource belongs to for organizational grouping (prefixed ULID)
        #
        #   @return [String]
        required :workspace_id, String, api_name: :workspaceId

        # @!attribute updated_at
        #   Timestamp when this resource was last updated
        #
        #   @return [Time, nil]
        optional :updated_at, Time, api_name: :updatedAt
      end

      # @!method initialize(id:, account_id:, created_at:, name:, profile_id:, workspace_id:, bundle_key: nil, external_id: nil, labels: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ResourceMetadata} for more details.
      #
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param id [String] Unique identifier for the resource (prefixed ULID, e.g., "agent_01HXK...")
      #
      #   @param account_id [String] Account this resource belongs to for multi-tenant isolation (prefixed ULID)
      #
      #   @param created_at [Time] Timestamp when this resource was created
      #
      #   @param name [String] Human-readable name for the resource (e.g., "Customer Support Agent", "Email Too
      #
      #   @param profile_id [String] ID of the actor (user or service account) that created this resource
      #
      #   @param workspace_id [String] Workspace this resource belongs to for organizational grouping (prefixed ULID)
      #
      #   @param bundle_key [String] Optional bundle ownership key. When set, indicates the resource is
      #
      #   @param external_id [String] External ID for the resource (e.g., a workflow ID from an external system)
      #
      #   @param labels [Hash{Symbol=>String}] Arbitrary key-value pairs for categorization and filtering
      #
      #   @param updated_at [Time] Timestamp when this resource was last updated
    end
  end
end
