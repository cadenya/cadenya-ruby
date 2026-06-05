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
      class Members
        # Lists the members of a workspace. Admin only.
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
        # @see Cadenya::Models::WorkspaceAdmin::MemberListParams
        def list(workspace_id, params = {})
          parsed, options = Cadenya::WorkspaceAdmin::MemberListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["v1/account/workspaces/%1$s/members", workspace_id],
            query: query,
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::WorkspaceMember,
            options: options
          )
        end

        # Grants a profile access to the workspace by creating (or reactivating) the actor
        # that links the profile to the workspace. Accepts either an existing profile_id
        # or an email to resolve-or-invite. Idempotent for an already-active member. Admin
        # only.
        #
        # @overload add(workspace_id, email: nil, profile_id: nil, request_options: {})
        #
        # @param workspace_id [String] The workspace to add the member to (path).
        #
        # @param email [String] Email address to add (resolve-or-invite). Mutually exclusive with profile_id.
        #
        # @param profile_id [String] An existing account profile to add. Mutually exclusive with email.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::WorkspaceMember]
        #
        # @see Cadenya::Models::WorkspaceAdmin::MemberAddParams
        def add(workspace_id, params = {})
          parsed, options = Cadenya::WorkspaceAdmin::MemberAddParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/account/workspaces/%1$s/members", workspace_id],
            body: parsed,
            model: Cadenya::WorkspaceMember,
            options: options
          )
        end

        # Revokes a member's access by deactivating their actor; the member is immediately
        # cut off. The underlying profile is not deleted. Admin only.
        #
        # @overload remove(profile_id, workspace_id:, request_options: {})
        #
        # @param profile_id [String] The profile to remove from the workspace (path).
        #
        # @param workspace_id [String] The workspace to remove the member from (path).
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Cadenya::Models::WorkspaceAdmin::MemberRemoveParams
        def remove(profile_id, params)
          parsed, options = Cadenya::WorkspaceAdmin::MemberRemoveParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/account/workspaces/%1$s/members/%2$s", workspace_id, profile_id],
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
