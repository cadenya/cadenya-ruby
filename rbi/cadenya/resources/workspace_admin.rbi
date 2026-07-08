# typed: strong

module Cadenya
  module Resources
    # Administer workspaces across the account: create and archive workspaces and
    # manage their membership. These operations are account-scoped and require the
    # admin role (a token whose profile holds the WorkOS admin role); they live under
    # /v1/account/workspaces rather than the workspace-scoped /v1/workspaces tree so
    # an admin can manage any workspace in the account, including ones they are not
    # themselves a member of.
    class WorkspaceAdmin
      # Administer workspaces across the account: create and archive workspaces and
      # manage their membership. These operations are account-scoped and require the
      # admin role (a token whose profile holds the WorkOS admin role); they live under
      # /v1/account/workspaces rather than the workspace-scoped /v1/workspaces tree so
      # an admin can manage any workspace in the account, including ones they are not
      # themselves a member of.
      sig { returns(Cadenya::Resources::WorkspaceAdmin::Members) }
      attr_reader :members

      # Administer workspaces across the account: create and archive workspaces and
      # manage their membership. These operations are account-scoped and require the
      # admin role (a token whose profile holds the WorkOS admin role); they live under
      # /v1/account/workspaces rather than the workspace-scoped /v1/workspaces tree so
      # an admin can manage any workspace in the account, including ones they are not
      # themselves a member of.
      sig { returns(Cadenya::Resources::WorkspaceAdmin::Profiles) }
      attr_reader :profiles

      # Creates a new workspace in the account. Admin only.
      sig do
        params(
          metadata: Cadenya::WorkspaceAdminCreateParams::Metadata::OrHash,
          spec: Cadenya::WorkspaceSpec::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Workspace)
      end
      def create(
        # CreateAccountResourceMetadata contains the user-provided fields for creating an
        # account-scoped resource. Read-only fields (id, account_id, profile_id) are
        # excluded since they are set by the server.
        metadata:,
        spec:,
        request_options: {}
      )
      end

      # Retrieves a workspace in the account by ID. Admin only.
      sig do
        params(
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Workspace)
      end
      def retrieve(
        # Workspace ID to retrieve (path).
        workspace_id,
        request_options: {}
      )
      end

      # Updates a workspace's metadata (e.g. name) and spec. Admin only.
      sig do
        params(
          workspace_id: String,
          metadata: Cadenya::WorkspaceAdminUpdateParams::Metadata::OrHash,
          spec: Cadenya::WorkspaceSpec::OrHash,
          update_mask: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Workspace)
      end
      def update(
        # Workspace ID to update (path).
        workspace_id,
        # UpdateAccountResourceMetadata contains the user-provided fields for updating an
        # account-scoped resource. Read-only fields (id, account_id, profile_id) are
        # excluded since they are set by the server.
        metadata: nil,
        spec: nil,
        # Fields to update.
        update_mask: nil,
        request_options: {}
      )
      end

      # Lists every workspace in the account, optionally including archived ones. Admin
      # only.
      sig do
        params(
          cursor: String,
          include_archived: T::Boolean,
          labels: String,
          limit: Integer,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::Workspace])
      end
      def list(
        # Pagination cursor from previous response
        cursor: nil,
        # When true, archived workspaces are included in the results. Defaults to false
        # (active workspaces only).
        include_archived: nil,
        # Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Maximum number of results to return
        limit: nil,
        request_options: {}
      )
      end

      # Archives a workspace (soft delete). The workspace is retained, but any
      # subsequent request scoped to it returns a permission error. Archiving the
      # account's last active (non-archived) workspace is not allowed and returns
      # FailedPrecondition. Admin only.
      sig do
        params(
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).void
      end
      def archive(
        # Workspace ID to archive (path).
        workspace_id,
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
