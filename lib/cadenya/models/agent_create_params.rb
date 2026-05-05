# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Agents#create
    class AgentCreateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute metadata
      #   CreateResourceMetadata contains the user-provided fields for creating a
      #   workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
      #   profile_id, created_at) are excluded since they are set by the server.
      #
      #   @return [Cadenya::Models::CreateResourceMetadata]
      required :metadata, -> { Cadenya::CreateResourceMetadata }

      # @!attribute spec
      #   Agent specification (user-provided configuration)
      #
      #   @return [Cadenya::Models::AgentSpec]
      required :spec, -> { Cadenya::AgentSpec }

      # @!attribute default_variation
      #   Create agent variation request
      #
      #   @return [Cadenya::Models::AgentCreateParams::DefaultVariation, nil]
      optional :default_variation,
               -> { Cadenya::AgentCreateParams::DefaultVariation },
               api_name: :defaultVariation

      # @!method initialize(workspace_id:, metadata:, spec:, default_variation: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AgentCreateParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param metadata [Cadenya::Models::CreateResourceMetadata] CreateResourceMetadata contains the user-provided fields for creating
      #
      #   @param spec [Cadenya::Models::AgentSpec] Agent specification (user-provided configuration)
      #
      #   @param default_variation [Cadenya::Models::AgentCreateParams::DefaultVariation] Create agent variation request
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      class DefaultVariation < Cadenya::Internal::Type::BaseModel
        # @!attribute metadata
        #   CreateResourceMetadata contains the user-provided fields for creating a
        #   workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        #   profile_id, created_at) are excluded since they are set by the server.
        #
        #   @return [Cadenya::Models::CreateResourceMetadata]
        required :metadata, -> { Cadenya::CreateResourceMetadata }

        # @!attribute spec
        #   AgentVariationSpec defines the operational configuration for a variation
        #
        #   @return [Cadenya::Models::Agents::AgentVariationSpec]
        required :spec, -> { Cadenya::Agents::AgentVariationSpec }

        # @!method initialize(metadata:, spec:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::AgentCreateParams::DefaultVariation} for more details.
        #
        #   Create agent variation request
        #
        #   @param metadata [Cadenya::Models::CreateResourceMetadata] CreateResourceMetadata contains the user-provided fields for creating
        #
        #   @param spec [Cadenya::Models::Agents::AgentVariationSpec] AgentVariationSpec defines the operational configuration for a variation
      end
    end
  end
end
