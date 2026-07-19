# frozen_string_literal: true

module Cadenya
  module Resources
    # Issue, rotate, disable, and revoke a workspace's API keys. Every key belongs to
    # exactly one workspace; the system-managed global account key is managed via
    # GlobalAPIKeyService instead.
    class APIKeys
      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::APIKeyCreateParams} for more details.
      #
      # Creates a new API key in the workspace.
      #
      # @overload create(metadata:, spec:, workspace_id: nil, request_options: {})
      #
      # @param metadata [Cadenya::Models::APIKeyCreateParams::Metadata] Body param: CreateAccountResourceMetadata contains the user-provided fields for
      #
      # @param spec [Cadenya::Models::APIKeySpec] Body param: Configuration for an API key.
      #
      # @param workspace_id [String] Path param: The workspace this API key belongs to (path).
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::APIKeyCreateParams
      def create(params)
        parsed, options = Cadenya::APIKeyCreateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/api_keys", workspace_id],
          body: parsed,
          model: Cadenya::APIKey,
          options: options
        )
      end

      # Retrieves an API key by ID.
      #
      # @overload retrieve(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] The API key to retrieve.
      #
      # @param workspace_id [String] The workspace the API key belongs to (path).
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::APIKeyRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Cadenya::APIKeyRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/api_keys/%2$s", workspace_id, id],
          model: Cadenya::APIKey,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::APIKeyUpdateParams} for more details.
      #
      # Updates an API key.
      #
      # @overload update(id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil, request_options: {})
      #
      # @param id [String] Path param: The API key to update.
      #
      # @param workspace_id [String] Path param: The workspace the API key belongs to (path).
      #
      # @param metadata [Cadenya::Models::APIKeyUpdateParams::Metadata] Body param: UpdateAccountResourceMetadata contains the user-provided fields for
      #
      # @param spec [Cadenya::Models::APIKeySpec] Body param: Configuration for an API key.
      #
      # @param update_mask [String] Body param: Fields to update.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::APIKeyUpdateParams
      def update(id, params = {})
        parsed, options = Cadenya::APIKeyUpdateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :patch,
          path: ["v1/workspaces/%1$s/api_keys/%2$s", workspace_id, id],
          body: parsed,
          model: Cadenya::APIKey,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::APIKeyListParams} for more details.
      #
      # Lists the workspace's API keys.
      #
      # @overload list(workspace_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, request_options: {})
      #
      # @param workspace_id [String] Path param: The workspace whose API keys will be listed (path).
      #
      # @param cursor [String] Query param: Pagination cursor from previous response.
      #
      # @param include_info [Boolean] Query param: When true, included info fields are populated. Requests with this
      #
      # @param labels [String] Query param: Filters by metadata labels. Comma-separated key=value pairs,
      #
      # @param limit [Integer] Query param: Maximum number of results to return.
      #
      # @param prefix [String] Query param: Filter by ID prefix.
      #
      # @param query [String] Query param: Free-form search query.
      #
      # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time).
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::APIKey>]
      #
      # @see Cadenya::Models::APIKeyListParams
      def list(params = {})
        parsed, options = Cadenya::APIKeyListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/api_keys", workspace_id],
          query: query.transform_keys(include_info: "includeInfo", sort_order: "sortOrder"),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::APIKey,
          options: options
        )
      end

      # Deletes an API key.
      #
      # @overload delete(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] The API key to delete.
      #
      # @param workspace_id [String] The workspace the API key belongs to (path).
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Cadenya::Models::APIKeyDeleteParams
      def delete(id, params = {})
        parsed, options = Cadenya::APIKeyDeleteParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :delete,
          path: ["v1/workspaces/%1$s/api_keys/%2$s", workspace_id, id],
          model: NilClass,
          options: options
        )
      end

      # Disables an API key. While disabled, presenting the key's token fails
      # authentication on every endpoint; the key is retained. Idempotent.
      #
      # @overload disable(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] The API key to disable.
      #
      # @param workspace_id [String] The workspace the API key belongs to (path).
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::APIKeyDisableParams
      def disable(id, params = {})
        parsed, options = Cadenya::APIKeyDisableParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/api_keys/%2$s:disable", workspace_id, id],
          model: Cadenya::APIKey,
          options: options
        )
      end

      # Re-enables a disabled API key so its token authenticates again. Idempotent.
      #
      # @overload enable(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] The API key to enable.
      #
      # @param workspace_id [String] The workspace the API key belongs to (path).
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::APIKeyEnableParams
      def enable(id, params = {})
        parsed, options = Cadenya::APIKeyEnableParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/api_keys/%2$s:enable", workspace_id, id],
          model: Cadenya::APIKey,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::APIKeyRotateParams} for more details.
      #
      # Rotates an API key and returns a new token. All previous tokens for this key are
      # invalidated.
      #
      # @overload rotate(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] The API key to rotate. A new token is issued and any existing token is
      #
      # @param workspace_id [String] The workspace the API key belongs to (path).
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::APIKeyRotateParams
      def rotate(id, params = {})
        parsed, options = Cadenya::APIKeyRotateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/api_keys/%2$s:rotate", workspace_id, id],
          model: Cadenya::APIKey,
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
