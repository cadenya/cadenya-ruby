# typed: strong

module Cadenya
  module Resources
    class Workspaces
      # Manage workspaces within an account. Workspaces provide organizational grouping
      # and isolation for resources such as agents, tools, and API keys. Workspace
      # creation, archival, and membership management require an account administrator
      # (a token whose profile holds the admin role).
      class Members
        # Lists the members (actors) of a workspace. Requires the admin role.
        sig do
          params(
            workspace_id: String,
            cursor: String,
            limit: Integer,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[Cadenya::WorkspaceMember]
          )
        end
        def list(
          # The workspace whose members will be listed (path).
          workspace_id,
          # Pagination cursor from previous response
          cursor: nil,
          # Maximum number of results to return
          limit: nil,
          request_options: {}
        )
        end

        # Grants a profile access to the workspace by creating an actor that links the
        # profile to the workspace. Idempotent — re-adding an active member is a no-op.
        # Requires the admin role.
        sig do
          params(
            workspace_id: String,
            profile_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::WorkspaceMember)
        end
        def add(
          # The workspace to add the member to (path).
          workspace_id,
          # The existing account profile to add to the workspace.
          profile_id: nil,
          request_options: {}
        )
        end

        # Revokes a member's access to the workspace by deactivating their actor. The
        # member is immediately cut off; the underlying profile is not deleted. Requires
        # the admin role.
        sig do
          params(
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).void
        end
        def remove(
          # The member's actor ID to remove (the `actor_id` from WorkspaceMember).
          id,
          # The workspace to remove the member from (path).
          workspace_id:,
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
end
