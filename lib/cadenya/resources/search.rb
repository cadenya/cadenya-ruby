# frozen_string_literal: true

module Cadenya
  module Resources
    class Search
      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::SearchSearchToolsOrToolSetsParams} for more details.
      #
      # Searches for tools or tool sets in the workspace
      #
      # @overload search_tools_or_tool_sets(workspace_id: nil, query: nil, request_options: {})
      #
      # @param workspace_id [String] Path param: NOTE: `query` is runtime-required (buf.validate min_len), but gnosti
      #
      # @param query [String] Query param
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::SearchSearchToolsOrToolSetsResponse]
      #
      # @see Cadenya::Models::SearchSearchToolsOrToolSetsParams
      def search_tools_or_tool_sets(params = {})
        parsed, options = Cadenya::SearchSearchToolsOrToolSetsParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
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
