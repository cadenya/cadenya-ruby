# typed: strong

module Cadenya
  module Resources
    # Manage workspaces within an account. Workspaces provide organizational grouping
    # and isolation for resources such as agents, tools, and API keys. Workspace
    # creation, archival, and membership management require an account administrator
    # (a token whose profile holds the admin role).
    class Workspaces
      # Manage workspaces within an account. Workspaces provide organizational grouping
      # and isolation for resources such as agents, tools, and API keys. Workspace
      # creation, archival, and membership management require an account administrator
      # (a token whose profile holds the admin role).
      sig { returns(Cadenya::Resources::Workspaces::Members) }
      attr_reader :members

      # Creates a new workspace in the current account. Requires the admin role.
      sig do
        params(
          metadata: Cadenya::WorkspaceCreateParams::Metadata::OrHash,
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

      # Retrieves a workspace by ID from the current account.
      sig do
        params(
          id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Workspace)
      end
      def retrieve(
        # Workspace ID. Accepts the canonical workspace ID or the `external_id:<value>`
        # form.
        id,
        request_options: {}
      )
      end

      # Lists all workspaces for the current account
      sig do
        params(
          cursor: String,
          include_info: T::Boolean,
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
        # Maximum number of results to return
        limit: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        request_options: {}
      )
      end

      # Archives a workspace. This is a soft delete: the workspace is retained but any
      # subsequent request scoped to it returns a permission error. Requires the admin
      # role.
      sig do
        params(
          id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Workspace ID to archive.
        id,
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
      def get_current(request_options: {})
      end

      # @api private
      sig { params(client: Cadenya::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
