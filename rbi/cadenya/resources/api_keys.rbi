# typed: strong

module Cadenya
  module Resources
    # Issue, rotate, disable, and revoke a workspace's API keys. Every key belongs to
    # exactly one workspace; the system-managed global account key is managed via
    # GlobalAPIKeyService instead.
    class APIKeys
      # Creates a new API key in the workspace.
      sig do
        params(
          metadata: Cadenya::APIKeyCreateParams::Metadata::OrHash,
          spec: Cadenya::APIKeySpec::OrHash,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::APIKey)
      end
      def create(
        # Body param: CreateAccountResourceMetadata contains the user-provided fields for
        # creating an account-scoped resource. Read-only fields (id, account_id,
        # profile_id) are excluded since they are set by the server.
        metadata:,
        # Body param: Configuration for an API key.
        spec:,
        # Path param: The workspace this API key belongs to (path).
        workspace_id: nil,
        request_options: {}
      )
      end

      # Retrieves an API key by ID.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::APIKey)
      end
      def retrieve(
        # The API key to retrieve.
        id,
        # The workspace the API key belongs to (path).
        workspace_id: nil,
        request_options: {}
      )
      end

      # Updates an API key.
      sig do
        params(
          id: String,
          workspace_id: String,
          metadata: Cadenya::APIKeyUpdateParams::Metadata::OrHash,
          spec: Cadenya::APIKeySpec::OrHash,
          update_mask: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::APIKey)
      end
      def update(
        # Path param: The API key to update.
        id,
        # Path param: The workspace the API key belongs to (path).
        workspace_id: nil,
        # Body param: UpdateAccountResourceMetadata contains the user-provided fields for
        # updating an account-scoped resource. Read-only fields (id, account_id,
        # profile_id) are excluded since they are set by the server.
        metadata: nil,
        # Body param: Configuration for an API key.
        spec: nil,
        # Body param: Fields to update.
        update_mask: nil,
        request_options: {}
      )
      end

      # Lists the workspace's API keys.
      sig do
        params(
          workspace_id: String,
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::APIKey])
      end
      def list(
        # Path param: The workspace whose API keys will be listed (path).
        workspace_id: nil,
        # Query param: Pagination cursor from previous response.
        cursor: nil,
        # Query param: When true, included info fields are populated. Requests with this
        # flag count more against your rate limit.
        include_info: nil,
        # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Query param: Maximum number of results to return.
        limit: nil,
        # Query param: Filter by ID prefix.
        prefix: nil,
        # Query param: Free-form search query.
        query: nil,
        # Query param: Sort order for results (asc or desc by creation time).
        sort_order: nil,
        request_options: {}
      )
      end

      # Deletes an API key.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).void
      end
      def delete(
        # The API key to delete.
        id,
        # The workspace the API key belongs to (path).
        workspace_id: nil,
        request_options: {}
      )
      end

      # Disables an API key. While disabled, presenting the key's token fails
      # authentication on every endpoint; the key is retained. Idempotent.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::APIKey)
      end
      def disable(
        # The API key to disable.
        id,
        # The workspace the API key belongs to (path).
        workspace_id: nil,
        request_options: {}
      )
      end

      # Re-enables a disabled API key so its token authenticates again. Idempotent.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::APIKey)
      end
      def enable(
        # The API key to enable.
        id,
        # The workspace the API key belongs to (path).
        workspace_id: nil,
        request_options: {}
      )
      end

      # Rotates an API key and returns a new token. All previous tokens for this key are
      # invalidated.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::APIKey)
      end
      def rotate(
        # The API key to rotate. A new token is issued and any existing token is
        # invalidated.
        id,
        # The workspace the API key belongs to (path).
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
