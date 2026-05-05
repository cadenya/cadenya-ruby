# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      # @see Cadenya::Resources::ToolSets::Tools#create
      class ToolCreateParams < Cadenya::Internal::Type::BaseModel
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

        # @!attribute metadata
        #   CreateResourceMetadata contains the user-provided fields for creating a
        #   workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        #   profile_id, created_at) are excluded since they are set by the server.
        #
        #   @return [Cadenya::Models::CreateResourceMetadata]
        required :metadata, -> { Cadenya::CreateResourceMetadata }

        # @!attribute spec
        #
        #   @return [Cadenya::Models::ToolSets::ToolSpec]
        required :spec, -> { Cadenya::ToolSets::ToolSpec }

        # @!method initialize(workspace_id:, tool_set_id:, metadata:, spec:, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::ToolCreateParams} for more details.
        #
        #   @param workspace_id [String]
        #
        #   @param tool_set_id [String]
        #
        #   @param metadata [Cadenya::Models::CreateResourceMetadata] CreateResourceMetadata contains the user-provided fields for creating
        #
        #   @param spec [Cadenya::Models::ToolSets::ToolSpec]
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
