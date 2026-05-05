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
        workspace_id,
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
