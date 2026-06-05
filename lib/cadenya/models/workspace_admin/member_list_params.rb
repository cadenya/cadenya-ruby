# frozen_string_literal: true

module Cadenya
  module Models
    module WorkspaceAdmin
      # @see Cadenya::Resources::WorkspaceAdmin::Members#list
      class MemberListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute cursor
        #   Pagination cursor from previous response
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #   Maximum number of results to return
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!method initialize(workspace_id:, cursor: nil, limit: nil, request_options: {})
        #   @param workspace_id [String]
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param limit [Integer] Maximum number of results to return
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
