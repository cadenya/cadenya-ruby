# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::ToolSets#list_events
    class ToolSetListEventsParams < Cadenya::Internal::Type::BaseModel
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

      # @!attribute cursor
      #   Pagination cursor from previous response
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute include_info
      #   When set to true you may use more of your alloted API rate-limit
      #
      #   @return [Boolean, nil]
      optional :include_info, Cadenya::Internal::Type::Boolean

      # @!attribute limit
      #   Maximum number of results to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute sort_order
      #   Sort order for results (asc or desc by creation time)
      #
      #   @return [String, nil]
      optional :sort_order, String

      # @!method initialize(workspace_id:, tool_set_id:, cursor: nil, include_info: nil, limit: nil, sort_order: nil, request_options: {})
      #   @param workspace_id [String]
      #
      #   @param tool_set_id [String]
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param include_info [Boolean] When set to true you may use more of your alloted API rate-limit
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
