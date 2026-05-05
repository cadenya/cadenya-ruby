# frozen_string_literal: true

module Cadenya
  module Resources
    # Issue, rotate, and revoke API keys for the account, and grant or revoke each
    # key's access to individual workspaces.
    class APIKeys
      # Issue, rotate, and revoke API keys for the account, and grant or revoke each
      # key's access to individual workspaces.
      # @return [Cadenya::Resources::APIKeys::Access]
      attr_reader :access

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::APIKeyCreateParams} for more details.
      #
      # Creates a new API key on the account. Optionally grants the key access to one or
      # more workspaces via initial_workspace_ids.
      #
      # @overload create(metadata:, spec:, initial_workspace_ids: nil, request_options: {})
      #
      # @param metadata [Cadenya::Models::APIKeyCreateParams::Metadata] CreateAccountResourceMetadata contains the user-provided fields for creating
      #
      # @param spec [Cadenya::Models::APIKeySpec] Configuration for an API key.
      #
      # @param initial_workspace_ids [Array<String>] Workspaces this API key will have access to on creation. Optional —
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::APIKeyCreateParams
      def create(params)
        parsed, options = Cadenya::APIKeyCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/account/api_keys",
          body: parsed,
          model: Cadenya::APIKey,
          options: options
        )
      end

      # Retrieves an API key by ID.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] The API key to retrieve.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::APIKeyRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["v1/account/api_keys/%1$s", id],
          model: Cadenya::APIKey,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::APIKeyUpdateParams} for more details.
      #
      # Updates an API key.
      #
      # @overload update(id, metadata: nil, spec: nil, update_mask: nil, request_options: {})
      #
      # @param id [String] The API key to update.
      #
      # @param metadata [Cadenya::Models::APIKeyUpdateParams::Metadata] UpdateAccountResourceMetadata contains the user-provided fields for updating
      #
      # @param spec [Cadenya::Models::APIKeySpec] Configuration for an API key.
      #
      # @param update_mask [String] Fields to update.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::APIKeyUpdateParams
      def update(id, params = {})
        parsed, options = Cadenya::APIKeyUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/account/api_keys/%1$s", id],
          body: parsed,
          model: Cadenya::APIKey,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::APIKeyListParams} for more details.
      #
      # Lists all API keys on the account.
      #
      # @overload list(bundle_key: nil, cursor: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, request_options: {})
      #
      # @param bundle_key [String] Filter by bundle_key — return only resources owned by this bundle.
      #
      # @param cursor [String] Pagination cursor from previous response.
      #
      # @param include_info [Boolean] When true, included info fields are populated. Requests with this
      #
      # @param limit [Integer] Maximum number of results to return.
      #
      # @param prefix [String] Filter by ID prefix.
      #
      # @param query [String] Free-form search query.
      #
      # @param sort_order [String] Sort order for results (asc or desc by creation time).
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::APIKey>]
      #
      # @see Cadenya::Models::APIKeyListParams
      def list(params = {})
        parsed, options = Cadenya::APIKeyListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/account/api_keys",
          query: query.transform_keys(
            bundle_key: "bundleKey",
            include_info: "includeInfo",
            sort_order: "sortOrder"
          ),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::APIKey,
          options: options
        )
      end

      # Deletes an API key.
      #
      # @overload delete(id, request_options: {})
      #
      # @param id [String] The API key to delete.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Cadenya::Models::APIKeyDeleteParams
      def delete(id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/account/api_keys/%1$s", id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::APIKeyRotateParams} for more details.
      #
      # Rotates an API key and returns a new token. All previous tokens for this key are
      # invalidated.
      #
      # @overload rotate(id, request_options: {})
      #
      # @param id [String] The API key to rotate. A new token is issued and any existing token is
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::APIKey]
      #
      # @see Cadenya::Models::APIKeyRotateParams
      def rotate(id, params = {})
        @client.request(
          method: :put,
          path: ["v1/account/api_keys/%1$s/rotate", id],
          model: Cadenya::APIKey,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
        @access = Cadenya::Resources::APIKeys::Access.new(client: client)
      end
    end
  end
end
