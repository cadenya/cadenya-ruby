# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::ToolSets#list_usage
    class ToolSetListUsageParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!attribute tool_set_id
      #
      #   @return [String]
      required :tool_set_id, String

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

      # @!attribute sort_order
      #   Sort order for results (asc or desc by assignment creation time)
      #
      #   @return [String, nil]
      optional :sort_order, String

      # @!attribute tool_id
      #   When set, lists only variations with a direct assignment of this individual
      #   tool. When unset, lists variations assigned the whole tool set. The tool must
      #   belong to the tool set.
      #
      #   @return [String, nil]
      optional :tool_id, String

      # @!method initialize(tool_set_id:, workspace_id: nil, cursor: nil, limit: nil, sort_order: nil, tool_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetListUsageParams} for more details.
      #
      #   @param tool_set_id [String]
      #
      #   @param workspace_id [String]
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param sort_order [String] Sort order for results (asc or desc by assignment creation time)
      #
      #   @param tool_id [String] When set, lists only variations with a direct assignment of this
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
