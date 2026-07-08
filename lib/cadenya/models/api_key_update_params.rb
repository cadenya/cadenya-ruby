# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::APIKeys#update
    class APIKeyUpdateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute metadata
      #   UpdateAccountResourceMetadata contains the user-provided fields for updating an
      #   account-scoped resource. Read-only fields (id, account_id, profile_id) are
      #   excluded since they are set by the server.
      #
      #   @return [Cadenya::Models::APIKeyUpdateParams::Metadata, nil]
      optional :metadata, -> { Cadenya::APIKeyUpdateParams::Metadata }

      # @!attribute spec
      #   Configuration for an API key.
      #
      #   @return [Cadenya::Models::APIKeySpec, nil]
      optional :spec, -> { Cadenya::APIKeySpec }

      # @!attribute update_mask
      #   Fields to update.
      #
      #   @return [String, nil]
      optional :update_mask, String, api_name: :updateMask

      # @!method initialize(id:, metadata: nil, spec: nil, update_mask: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::APIKeyUpdateParams} for more details.
      #
      #   @param id [String]
      #
      #   @param metadata [Cadenya::Models::APIKeyUpdateParams::Metadata] UpdateAccountResourceMetadata contains the user-provided fields for updating
      #
      #   @param spec [Cadenya::Models::APIKeySpec] Configuration for an API key.
      #
      #   @param update_mask [String] Fields to update.
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      class Metadata < Cadenya::Internal::Type::BaseModel
        # @!attribute name
        #   Human-readable name for the resource (e.g., "Production API Key", "Staging
        #   Workspace")
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
        #   {Cadenya::Models::APIKeyUpdateParams::Metadata} for more details.
        #
        #   UpdateAccountResourceMetadata contains the user-provided fields for updating an
        #   account-scoped resource. Read-only fields (id, account_id, profile_id) are
        #   excluded since they are set by the server.
        #
        #   @param name [String] Human-readable name for the resource (e.g., "Production API Key", "Staging Works
        #
        #   @param external_id [String] External ID for the resource (e.g., a workflow ID from an external system)
        #
        #   @param labels [Hash{Symbol=>String}] Key-value pairs for categorization and filtering. Values are 0-63
      end
    end
  end
end
