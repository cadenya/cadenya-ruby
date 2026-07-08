# typed: strong

module Cadenya
  module Resources
    # Manage workspaces within an account. Workspaces provide organizational grouping
    # and isolation for resources such as agents, tools, and API keys.
    #
    # This is the workspace-scoped, end-user surface. Administrative operations
    # (create / archive workspaces, manage members) live in WorkspaceAdminService
    # under /v1/account/workspaces and require the admin role.
    class Workspaces
      # Lists all workspaces for the current account
      sig do
        params(
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          sort_order: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::Workspace])
      end
      def list(
        # Pagination cursor from previous response
        cursor: nil,
        # When set to true you may use more of your alloted API rate-limit
        include_info: nil,
        # Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Maximum number of results to return
        limit: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        request_options: {}
      )
      end

      # Retrieves the workspace associated with the current API token. Useful for
      # workspace-scoped tokens to identify which workspace they belong to.
      sig do
        params(request_options: Cadenya::RequestOptions::OrHash).returns(
          Cadenya::Workspace
        )
      end
      def get(request_options: {})
      end

      # @api private
      sig { params(client: Cadenya::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
