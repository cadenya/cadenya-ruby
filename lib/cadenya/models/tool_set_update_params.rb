# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::ToolSets#update
    class ToolSetUpdateParams < Cadenya::Internal::Type::BaseModel
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
      #
      #   @return [Cadenya::Models::ToolSetSpec, nil]
      optional :spec, -> { Cadenya::ToolSetSpec }

      # @!attribute update_mask
      #
      #   @return [String, nil]
      optional :update_mask, String, api_name: :updateMask

      # @!method initialize(id:, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetUpdateParams} for more details.
      #
      #   @param id [String]
      #
      #   @param workspace_id [String]
      #
      #   @param metadata [Cadenya::Models::UpdateResourceMetadata] UpdateResourceMetadata contains the user-provided fields for updating
      #
      #   @param spec [Cadenya::Models::ToolSetSpec]
      #
      #   @param update_mask [String]
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
