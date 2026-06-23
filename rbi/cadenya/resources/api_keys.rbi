# typed: strong

module Cadenya
  module Resources
    # Issue, rotate, and revoke API keys for the account, and grant or revoke each
    # key's access to individual workspaces.
    class APIKeys
      # Issue, rotate, and revoke API keys for the account, and grant or revoke each
      # key's access to individual workspaces.
      sig { returns(Cadenya::Resources::APIKeys::Access) }
      attr_reader :access

      # Creates a new API key on the account. Optionally grants the key access to one or
      # more workspaces via initial_workspace_ids.
      sig do
        params(
          metadata: Cadenya::APIKeyCreateParams::Metadata::OrHash,
          spec: Cadenya::APIKeySpec::OrHash,
          initial_workspace_ids: T::Array[String],
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::APIKey)
      end
      def create(
        # CreateAccountResourceMetadata contains the user-provided fields for creating an
        # account-scoped resource. Read-only fields (id, account_id, profile_id) are
        # excluded since they are set by the server.
        metadata:,
        # Configuration for an API key.
        spec:,
        # Workspaces this API key will have access to on creation. Optional — a key can be
        # created with no workspace access and granted later via AddAPIKeyWorkspace.
        initial_workspace_ids: nil,
        request_options: {}
      )
      end

      # Retrieves an API key by ID.
      sig do
        params(
          id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::APIKey)
      end
      def retrieve(
        # The API key to retrieve.
        id,
        request_options: {}
      )
      end

      # Updates an API key.
      sig do
        params(
          id: String,
          metadata: Cadenya::APIKeyUpdateParams::Metadata::OrHash,
          spec: Cadenya::APIKeySpec::OrHash,
          update_mask: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::APIKey)
      end
      def update(
        # The API key to update.
        id,
        # UpdateAccountResourceMetadata contains the user-provided fields for updating an
        # account-scoped resource. Read-only fields (id, account_id, profile_id) are
        # excluded since they are set by the server.
        metadata: nil,
        # Configuration for an API key.
        spec: nil,
        # Fields to update.
        update_mask: nil,
        request_options: {}
      )
      end

      # Lists all API keys on the account.
      sig do
        params(
          cursor: String,
          include_info: T::Boolean,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::APIKey])
      end
      def list(
        # Pagination cursor from previous response.
        cursor: nil,
        # When true, included info fields are populated. Requests with this flag count
        # more against your rate limit.
        include_info: nil,
        # Maximum number of results to return.
        limit: nil,
        # Filter by ID prefix.
        prefix: nil,
        # Free-form search query.
        query: nil,
        # Sort order for results (asc or desc by creation time).
        sort_order: nil,
        request_options: {}
      )
      end

      # Deletes an API key.
      sig do
        params(
          id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).void
      end
      def delete(
        # The API key to delete.
        id,
        request_options: {}
      )
      end

      # Rotates an API key and returns a new token. All previous tokens for this key are
      # invalidated.
      sig do
        params(
          id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::APIKey)
      end
      def rotate(
        # The API key to rotate. A new token is issued and any existing token is
        # invalidated.
        id,
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
