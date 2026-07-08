# frozen_string_literal: true

module Cadenya
  module Resources
    # Manage workspaces within an account. Workspaces provide organizational grouping
    # and isolation for resources such as agents, tools, and API keys.
    #
    # This is the workspace-scoped, end-user surface. Administrative operations
    # (create / archive workspaces, manage members) live in WorkspaceAdminService
    # under /v1/account/workspaces and require the admin role.
    class Workspaces
      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WorkspaceListParams} for more details.
      #
      # Lists all workspaces for the current account
      #
      # @overload list(cursor: nil, include_info: nil, labels: nil, limit: nil, sort_order: nil, request_options: {})
      #
      # @param cursor [String] Pagination cursor from previous response
      #
      # @param include_info [Boolean] When set to true you may use more of your alloted API rate-limit
      #
      # @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
      #
      # @param limit [Integer] Maximum number of results to return
      #
      # @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Workspace>]
      #
      # @see Cadenya::Models::WorkspaceListParams
      def list(params = {})
        parsed, options = Cadenya::WorkspaceListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/workspaces",
          query: query.transform_keys(include_info: "includeInfo", sort_order: "sortOrder"),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::Workspace,
          options: options
        )
      end

      # Retrieves the workspace associated with the current API token. Useful for
      # workspace-scoped tokens to identify which workspace they belong to.
      #
      # @overload get(request_options: {})
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Workspace]
      #
      # @see Cadenya::Models::WorkspaceGetParams
      def get(params = {})
        @client.request(
          method: :get,
          path: "v1/workspaces/current",
          model: Cadenya::Workspace,
          options: params[:request_options]
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
