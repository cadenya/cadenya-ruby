# typed: strong

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
          # Path param: The workspace whose members will be listed (path).
          workspace_id: nil,
          # Query param: Pagination cursor from previous response
          cursor: nil,
          # Query param: Maximum number of results to return
          limit: nil,
          request_options: {}
        )
        end

        # Grants a profile access to the workspace by creating (or reactivating) the actor
        # that links the profile to the workspace. Accepts either an existing profile_id
        # or an email to resolve-or-invite. Idempotent for an already-active member. Admin
        # only.
        sig do
          params(
            workspace_id: String,
            email: String,
            profile_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::WorkspaceMember)
        end
        def add(
          # Path param: The workspace to add the member to (path).
          workspace_id: nil,
          # Body param: Email address to add (resolve-or-invite). Mutually exclusive with
          # profile_id.
          email: nil,
          # Body param: An existing account profile to add. Mutually exclusive with email.
          profile_id: nil,
          request_options: {}
        )
        end

        # Revokes a member's access by deactivating their actor; the member is immediately
        # cut off. The underlying profile is not deleted. Admin only.
        sig do
          params(
            profile_id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).void
        end
        def remove(
          # The profile to remove from the workspace (path).
          profile_id,
          # The workspace to remove the member from (path).
          workspace_id: nil,
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
