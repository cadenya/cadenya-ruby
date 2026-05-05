# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::APIKeys#create
    class APIKeyCreateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute metadata
      #   CreateAccountResourceMetadata contains the user-provided fields for creating an
      #   account-scoped resource. Read-only fields (id, account_id, profile_id) are
      #   excluded since they are set by the server.
      #
      #   @return [Cadenya::Models::APIKeyCreateParams::Metadata]
      required :metadata, -> { Cadenya::APIKeyCreateParams::Metadata }

      # @!attribute spec
      #   Configuration for an API key.
      #
      #   @return [Cadenya::Models::APIKeySpec]
      required :spec, -> { Cadenya::APIKeySpec }

      # @!attribute initial_workspace_ids
      #   Workspaces this API key will have access to on creation. Optional — a key can be
      #   created with no workspace access and granted later via AddAPIKeyWorkspace.
      #
      #   @return [Array<String>, nil]
      optional :initial_workspace_ids,
               Cadenya::Internal::Type::ArrayOf[String],
               api_name: :initialWorkspaceIds

      # @!method initialize(metadata:, spec:, initial_workspace_ids: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::APIKeyCreateParams} for more details.
      #
      #   @param metadata [Cadenya::Models::APIKeyCreateParams::Metadata] CreateAccountResourceMetadata contains the user-provided fields for creating
      #
      #   @param spec [Cadenya::Models::APIKeySpec] Configuration for an API key.
      #
      #   @param initial_workspace_ids [Array<String>] Workspaces this API key will have access to on creation. Optional —
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
        #   Arbitrary key-value pairs for categorization and filtering Examples:
        #   {"environment": "production", "team": "platform", "version": "v2"}
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :labels, Cadenya::Internal::Type::HashOf[String]

        # @!method initialize(name:, external_id: nil, labels: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::APIKeyCreateParams::Metadata} for more details.
        #
        #   CreateAccountResourceMetadata contains the user-provided fields for creating an
        #   account-scoped resource. Read-only fields (id, account_id, profile_id) are
        #   excluded since they are set by the server.
        #
        #   @param name [String] Human-readable name for the resource (e.g., "Production API Key", "Staging Works
        #
        #   @param external_id [String] External ID for the resource (e.g., a workflow ID from an external system)
        #
        #   @param labels [Hash{Symbol=>String}] Arbitrary key-value pairs for categorization and filtering
      end
    end
  end
end
