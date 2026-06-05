# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::WorkspaceAdmin#list
    class WorkspaceAdminListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Pagination cursor from previous response
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute include_archived
      #   When true, archived workspaces are included in the results. Defaults to false
      #   (active workspaces only).
      #
      #   @return [Boolean, nil]
      optional :include_archived, Cadenya::Internal::Type::Boolean

      # @!attribute limit
      #   Maximum number of results to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!method initialize(cursor: nil, include_archived: nil, limit: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::WorkspaceAdminListParams} for more details.
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param include_archived [Boolean] When true, archived workspaces are included in the results. Defaults to
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
