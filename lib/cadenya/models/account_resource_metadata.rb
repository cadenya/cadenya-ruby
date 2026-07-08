# frozen_string_literal: true

module Cadenya
  module Models
    class AccountResourceMetadata < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #   Human-readable name for the resource (e.g., "Customer Support Agent", "Email
      #   Tool") Required for resources that users interact with directly
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

      response_only do
        # @!attribute id
        #   Unique identifier for the resource (prefixed ULID, e.g., "apikey_01HXK...")
        #
        #   @return [String]
        required :id, String

        # @!attribute account_id
        #   Account this resource belongs to for multi-tenant isolation (prefixed ULID)
        #
        #   @return [String]
        required :account_id, String, api_name: :accountId

        # @!attribute profile_id
        #
        #   @return [String]
        required :profile_id, String, api_name: :profileId

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time, api_name: :createdAt
      end

      # @!method initialize(id:, account_id:, name:, profile_id:, created_at: nil, external_id: nil, labels: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AccountResourceMetadata} for more details.
      #
      #   AccountResourceMetadata is used to represent a resource that is associated to an
      #   account but not to a workspace.
      #
      #   @param id [String] Unique identifier for the resource (prefixed ULID, e.g., "apikey_01HXK...")
      #
      #   @param account_id [String] Account this resource belongs to for multi-tenant isolation (prefixed ULID)
      #
      #   @param name [String] Human-readable name for the resource (e.g., "Customer Support Agent", "Email Too
      #
      #   @param profile_id [String]
      #
      #   @param created_at [Time]
      #
      #   @param external_id [String] External ID for the resource (e.g., a workflow ID from an external system)
      #
      #   @param labels [Hash{Symbol=>String}] Key-value pairs for categorization and filtering. Values are 0-63
    end
  end
end
