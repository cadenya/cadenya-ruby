# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Agents#update
    class AgentUpdateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute metadata
      #   UpdateResourceMetadata contains the user-provided fields for updating a
      #   workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
      #   profile_id, created_at) are excluded since they are set by the server.
      #
      #   @return [Cadenya::Models::UpdateResourceMetadata, nil]
      optional :metadata, -> { Cadenya::UpdateResourceMetadata }

      # @!attribute spec
      #   Agent specification (user-provided configuration)
      #
      #   @return [Cadenya::Models::AgentSpec, nil]
      optional :spec, -> { Cadenya::AgentSpec }

      # @!attribute update_mask
      #   Fields to update
      #
      #   @return [String, nil]
      optional :update_mask, String, api_name: :updateMask

      # @!method initialize(id:, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AgentUpdateParams} for more details.
      #
      #   @param id [String]
      #
      #   @param workspace_id [String]
      #
      #   @param metadata [Cadenya::Models::UpdateResourceMetadata] UpdateResourceMetadata contains the user-provided fields for updating
      #
      #   @param spec [Cadenya::Models::AgentSpec] Agent specification (user-provided configuration)
      #
      #   @param update_mask [String] Fields to update
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
