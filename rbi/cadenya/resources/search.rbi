# typed: strong

module Cadenya
  module Resources
    class Search
      # Searches for tools or tool sets in the workspace
      sig do
        params(
          workspace_id: String,
          query: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Models::SearchSearchToolsOrToolSetsResponse)
      end
      def search_tools_or_tool_sets(
        # Path param: NOTE: `query` is runtime-required (buf.validate min_len), but
        # gnostic does not propagate message-level schema `required` to GET query
        # parameters — overlay.yaml marks the parameter required instead.
        workspace_id: nil,
        # Query param
        query: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Cadenya::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
