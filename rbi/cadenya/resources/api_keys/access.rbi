# typed: strong

module Cadenya
  module Resources
    class APIKeys
      # Issue, rotate, and revoke API keys for the account, and grant or revoke each
      # key's access to individual workspaces.
      class Access
        # Lists the workspaces this API key has access to. Cursor-paginated.
        sig do
          params(
            id: String,
            cursor: String,
            limit: Integer,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Internal::CursorPagination[Cadenya::Workspace])
        end
        def list(
          # The API key whose workspace associations will be listed.
          id,
          # Pagination cursor from previous response.
          cursor: nil,
          # Maximum number of results to return.
          limit: nil,
          request_options: {}
        )
        end

        # Grants this API key access to the specified workspace. Idempotent — adding an
        # already-associated workspace is a no-op. Returns the updated API key with
        # refreshed workspace preview and total.
        sig do
          params(
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::APIKey)
        end
        def add(
          # The API key being granted workspace access.
          id,
          # The workspace to grant access to.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Revokes this API key's access to the specified workspace. Idempotent. A key may
        # have zero workspaces and remains valid.
        sig do
          params(
            workspace_id: String,
            id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).void
        end
        def remove(
          # The workspace whose access is being revoked (path).
          workspace_id,
          # The API key losing workspace access (path).
          id:,
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
