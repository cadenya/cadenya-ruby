# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      # @see Cadenya::Resources::ToolSets::Tools#update
      class ToolUpdateParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute tool_set_id
        #
        #   @return [String]
        required :tool_set_id, String

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
        #   @return [Cadenya::Models::ToolSets::ToolSpec, nil]
        optional :spec, -> { Cadenya::ToolSets::ToolSpec }

        # @!attribute update_mask
        #
        #   @return [String, nil]
        optional :update_mask, String, api_name: :updateMask

        # @!method initialize(workspace_id:, tool_set_id:, id:, metadata: nil, spec: nil, update_mask: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::ToolUpdateParams} for more details.
        #
        #   @param workspace_id [String]
        #
        #   @param tool_set_id [String]
        #
        #   @param id [String]
        #
        #   @param metadata [Cadenya::Models::UpdateResourceMetadata] UpdateResourceMetadata contains the user-provided fields for updating
        #
        #   @param spec [Cadenya::Models::ToolSets::ToolSpec]
        #
        #   @param update_mask [String]
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
