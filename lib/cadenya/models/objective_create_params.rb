# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#create
    class ObjectiveCreateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute agent_id
      #
      #   @return [String]
      required :agent_id, String, api_name: :agentId

      # @!attribute data
      #
      #   @return [Cadenya::Models::ObjectiveData]
      required :data, -> { Cadenya::ObjectiveData }

      # @!attribute metadata
      #   CreateOperationMetadata contains the user-provided fields for creating an
      #   operation. Read-only fields (id, account_id, workspace_id, created_at,
      #   profile_id) are excluded since they are set by the server.
      #
      #   @return [Cadenya::Models::CreateOperationMetadata, nil]
      optional :metadata, -> { Cadenya::CreateOperationMetadata }

      # @!attribute variation_id
      #   Optional explicit variation selection. Overrides the agent's
      #   variation_selection_mode.
      #
      #   @return [String, nil]
      optional :variation_id, String, api_name: :variationId

      # @!method initialize(workspace_id:, agent_id:, data:, metadata: nil, variation_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveCreateParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param agent_id [String]
      #
      #   @param data [Cadenya::Models::ObjectiveData]
      #
      #   @param metadata [Cadenya::Models::CreateOperationMetadata] CreateOperationMetadata contains the user-provided fields for creating
      #
      #   @param variation_id [String] Optional explicit variation selection. Overrides the agent's variation_selection
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
