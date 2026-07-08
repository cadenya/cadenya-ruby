# frozen_string_literal: true

module Cadenya
  module Resources
    class WorkspaceAdmin
      # Administer workspaces across the account: create and archive workspaces and
      # manage their membership. These operations are account-scoped and require the
      # admin role (a token whose profile holds the WorkOS admin role); they live under
      # /v1/account/workspaces rather than the workspace-scoped /v1/workspaces tree so
      # an admin can manage any workspace in the account, including ones they are not
      # themselves a member of.
      class Profiles
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::WorkspaceAdmin::ProfileListParams} for more details.
        #
        # Searches the account's profiles for a member picker, with free-form name/email
        # search and an optional type filter. Account-scoped; admin only.
        #
        # @overload list(cursor: nil, labels: nil, limit: nil, query: nil, request_options: {})
        #
        # @param cursor [String] Pagination cursor from previous response
        #
        # @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
        #
        # @param limit [Integer] Maximum number of results to return
        #
        # @param query [String] Free-form search over profile name and email. Case-insensitive substring
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Profile>]
        #
        # @see Cadenya::Models::WorkspaceAdmin::ProfileListParams
        def list(params = {})
          parsed, options = Cadenya::WorkspaceAdmin::ProfileListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "v1/account/profiles",
            query: query,
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::Profile,
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
