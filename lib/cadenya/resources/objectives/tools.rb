# frozen_string_literal: true

module Cadenya
  module Resources
    class Objectives
      class Tools
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Objectives::ToolListParams} for more details.
        #
        # Lists all tools that were assigned to an objective
        #
        # @overload list(objective_id, workspace_id:, cursor: nil, limit: nil, request_options: {})
        #
        # @param objective_id [String] Path param: The ID of the objective. Supports "external_id:" prefix for external
        #
        # @param workspace_id [String] Path param
        #
        # @param cursor [String] Query param: Pagination cursor from previous response
        #
        # @param limit [Integer] Query param: Maximum number of results to return
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Objectives::ObjectiveTool>]
        #
        # @see Cadenya::Models::Objectives::ToolListParams
        def list(objective_id, params)
          parsed, options = Cadenya::Objectives::ToolListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/objectives/%2$s/tools", workspace_id, objective_id],
            query: query,
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::Objectives::ObjectiveTool,
            options: options
          )
        end

        # @api private
        #
        # @param client [Cadenya::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
