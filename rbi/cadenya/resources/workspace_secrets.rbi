# typed: strong

module Cadenya
  module Resources
    class WorkspaceSecrets
      # Creates a new workspace secret in the workspace
      sig do
        params(
          workspace_id: String,
          metadata: Cadenya::CreateResourceMetadata::OrHash,
          spec: Cadenya::WorkspaceSecretSpec::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::WorkspaceSecret)
      end
      def create(
        # The workspace that will own this secret.
        workspace_id,
        # CreateResourceMetadata contains the user-provided fields for creating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        metadata:,
        spec:,
        request_options: {}
      )
      end

      # Retrieves a workspace secret by ID from the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::WorkspaceSecret)
      end
      def retrieve(
        # The secret to retrieve.
        id,
        # The workspace the secret belongs to.
        workspace_id:,
        request_options: {}
      )
      end

      # Updates a workspace secret in the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          metadata: Cadenya::UpdateResourceMetadata::OrHash,
          spec: Cadenya::WorkspaceSecretSpec::OrHash,
          update_mask: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::WorkspaceSecret)
      end
      def update(
        # Path param: The secret to update.
        id,
        # Path param: The workspace the secret belongs to.
        workspace_id:,
        # Body param: UpdateResourceMetadata contains the user-provided fields for
        # updating a workspace-scoped resource. Read-only fields (id, account_id,
        # workspace_id, profile_id, created_at) are excluded since they are set by the
        # server.
        metadata: nil,
        # Body param
        spec: nil,
        # Body param: Fields to update.
        update_mask: nil,
        request_options: {}
      )
      end

      # Lists all workspace secrets in the workspace
      sig do
        params(
          workspace_id: String,
          bundle_key: String,
          cursor: String,
          include_info: T::Boolean,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::WorkspaceSecret])
      end
      def list(
        # The workspace whose secrets will be listed.
        workspace_id,
        # Filter by bundle_key — return only resources owned by this bundle.
        bundle_key: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # When set to true you may use more of your alloted API rate-limit
        include_info: nil,
        # Maximum number of results to return
        limit: nil,
        # Filter expression (query param: prefix)
        prefix: nil,
        # Free-form search query
        query: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        request_options: {}
      )
      end

      # Deletes a workspace secret from the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).void
      end
      def delete(
        # The secret to delete.
        id,
        # The workspace the secret belongs to.
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
