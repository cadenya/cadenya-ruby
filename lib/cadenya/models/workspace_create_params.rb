# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Workspaces#create
    class WorkspaceCreateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute metadata
      #   CreateAccountResourceMetadata contains the user-provided fields for creating an
      #   account-scoped resource. Read-only fields (id, account_id, profile_id) are
      #   excluded since they are set by the server.
      #
      #   @return [Cadenya::Models::WorkspaceCreateParams::Metadata]
      required :metadata, -> { Cadenya::WorkspaceCreateParams::Metadata }

      # @!attribute spec
      #
      #   @return [Cadenya::Models::WorkspaceSpec]
      required :spec, -> { Cadenya::WorkspaceSpec }

      # @!method initialize(metadata:, spec:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::WorkspaceCreateParams} for more details.
      #
      #   @param metadata [Cadenya::Models::WorkspaceCreateParams::Metadata] CreateAccountResourceMetadata contains the user-provided fields for creating
      #
      #   @param spec [Cadenya::Models::WorkspaceSpec]
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
        #   {Cadenya::Models::WorkspaceCreateParams::Metadata} for more details.
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
