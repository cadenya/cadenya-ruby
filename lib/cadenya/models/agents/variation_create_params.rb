# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::Variations#create
      class VariationCreateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

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

        # @!method initialize(agent_id:, metadata:, spec:, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::VariationCreateParams} for more details.
        #
        #   @param agent_id [String]
        #
        #   @param metadata [Cadenya::Models::CreateResourceMetadata] CreateResourceMetadata contains the user-provided fields for creating
        #
        #   @param spec [Cadenya::Models::Agents::AgentVariationSpec] AgentVariationSpec defines the operational configuration for a variation
        #
        #   @param workspace_id [String]
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
