# frozen_string_literal: true

module Cadenya
  module Resources
    class Workspaces
      # Manage workspaces within an account. Workspaces provide organizational grouping
      # and isolation for resources such as agents, tools, and API keys. Workspace
      # creation, archival, and membership management require an account administrator
      # (a token whose profile holds the admin role).
      class Members
        # Lists the members (actors) of a workspace. Requires the admin role.
        #
        # @overload list(workspace_id, cursor: nil, limit: nil, request_options: {})
        #
        # @param workspace_id [String] The workspace whose members will be listed (path).
        #
        # @param cursor [String] Pagination cursor from previous response
        #
        # @param limit [Integer] Maximum number of results to return
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::WorkspaceMember>]
        #
        # @see Cadenya::Models::Workspaces::MemberListParams
        def list(workspace_id, params = {})
          parsed, options = Cadenya::Workspaces::MemberListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/members", workspace_id],
            query: query,
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::WorkspaceMember,
            options: options
          )
        end

        # Grants a profile access to the workspace by creating an actor that links the
        # profile to the workspace. Idempotent — re-adding an active member is a no-op.
        # Requires the admin role.
        #
        # @overload add(workspace_id, profile_id: nil, request_options: {})
        #
        # @param workspace_id [String] The workspace to add the member to (path).
        #
        # @param profile_id [String] The existing account profile to add to the workspace.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::WorkspaceMember]
        #
        # @see Cadenya::Models::Workspaces::MemberAddParams
        def add(workspace_id, params = {})
          parsed, options = Cadenya::Workspaces::MemberAddParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/workspaces/%1$s/members", workspace_id],
            body: parsed,
            model: Cadenya::WorkspaceMember,
            options: options
          )
        end

        # Revokes a member's access to the workspace by deactivating their actor. The
        # member is immediately cut off; the underlying profile is not deleted. Requires
        # the admin role.
        #
        # @overload remove(id, workspace_id:, request_options: {})
        #
        # @param id [String] The member's actor ID to remove (the `actor_id` from WorkspaceMember).
        #
        # @param workspace_id [String] The workspace to remove the member from (path).
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Cadenya::Models::Workspaces::MemberRemoveParams
        def remove(id, params)
          parsed, options = Cadenya::Workspaces::MemberRemoveParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/workspaces/%1$s/members/%2$s", workspace_id, id],
            model: NilClass,
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
