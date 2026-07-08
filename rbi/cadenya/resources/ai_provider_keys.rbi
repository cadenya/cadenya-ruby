# typed: strong

module Cadenya
  module Resources
    class AIProviderKeys
      # Creates a new customer-provided AI provider key in the workspace
      sig do
        params(
          workspace_id: String,
          metadata: Cadenya::CreateResourceMetadata::OrHash,
          spec: Cadenya::AIProviderKeySpec::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::AIProviderKey)
      end
      def create(
        # The workspace that will own this key.
        workspace_id,
        # CreateResourceMetadata contains the user-provided fields for creating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        metadata:,
        spec:,
        request_options: {}
      )
      end

      # Retrieves an AI provider key by ID from the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::AIProviderKey)
      end
      def retrieve(
        # The key to retrieve.
        id,
        # The workspace the key belongs to.
        workspace_id:,
        request_options: {}
      )
      end

      # Updates an AI provider key's name or key value in the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          metadata: Cadenya::UpdateResourceMetadata::OrHash,
          spec: Cadenya::AIProviderKeySpec::OrHash,
          update_mask: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::AIProviderKey)
      end
      def update(
        # Path param: The key to update.
        id,
        # Path param: The workspace the key belongs to.
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

      # Lists all customer-provided AI provider keys in the workspace
      sig do
        params(
          workspace_id: String,
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          prefix: String,
          promotional: T::Boolean,
          query: String,
          sort_order: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::AIProviderKey])
      end
      def list(
        # The workspace whose keys will be listed.
        workspace_id,
        # Pagination cursor from previous response
        cursor: nil,
        # When true, populate each item's info (model counts), at the cost of extra
        # lookups.
        include_info: nil,
        # Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Maximum number of results to return
        limit: nil,
        # Filter expression (query param: prefix)
        prefix: nil,
        # When true, return only promotional keys (provided by Cadenya, e.g. for
        # onboarding). Defaults to returning all keys, customer-provided and promotional
        # alike.
        promotional: nil,
        # Free-form search query
        query: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        request_options: {}
      )
      end

      # Deletes an AI provider key from the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).void
      end
      def delete(
        # The key to delete.
        id,
        # The workspace the key belongs to.
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
