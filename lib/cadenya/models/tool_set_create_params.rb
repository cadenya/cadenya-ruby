# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::ToolSets#create
    class ToolSetCreateParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!attribute metadata
      #   CreateResourceMetadata contains the user-provided fields for creating a
      #   workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
      #   profile_id, created_at) are excluded since they are set by the server.
      #
      #   @return [Cadenya::Models::CreateResourceMetadata]
      required :metadata, -> { Cadenya::CreateResourceMetadata }

      # @!attribute spec
      #
      #   @return [Cadenya::Models::ToolSetSpec]
      required :spec, -> { Cadenya::ToolSetSpec }

      # @!method initialize(metadata:, spec:, workspace_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetCreateParams} for more details.
      #
      #   @param metadata [Cadenya::Models::CreateResourceMetadata] CreateResourceMetadata contains the user-provided fields for creating
      #
      #   @param spec [Cadenya::Models::ToolSetSpec]
      #
      #   @param workspace_id [String]
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
