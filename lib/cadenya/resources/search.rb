# frozen_string_literal: true

module Cadenya
  module Resources
    class Search
      # Searches for tools or tool sets in the workspace
      #
      # @overload search_tools_or_tool_sets(workspace_id, query: nil, request_options: {})
      #
      # @param workspace_id [String]
      # @param query [String]
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::SearchSearchToolsOrToolSetsResponse]
      #
      # @see Cadenya::Models::SearchSearchToolsOrToolSetsParams
      def search_tools_or_tool_sets(workspace_id, params = {})
        parsed, options = Cadenya::SearchSearchToolsOrToolSetsParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/search/tools_or_tool_sets", workspace_id],
          query: query,
          model: Cadenya::Models::SearchSearchToolsOrToolSetsResponse,
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
