# frozen_string_literal: true

module Cadenya
  module Resources
    class AIProviderKeys
      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::AIProviderKeyCreateParams} for more details.
      #
      # Creates a new customer-provided AI provider key in the workspace
      #
      # @overload create(workspace_id, metadata:, spec:, request_options: {})
      #
      # @param workspace_id [String] The workspace that will own this key.
      #
      # @param metadata [Cadenya::Models::CreateResourceMetadata] CreateResourceMetadata contains the user-provided fields for creating
      #
      # @param spec [Cadenya::Models::AIProviderKeySpec]
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::AIProviderKey]
      #
      # @see Cadenya::Models::AIProviderKeyCreateParams
      def create(workspace_id, params)
        parsed, options = Cadenya::AIProviderKeyCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/ai_provider_keys", workspace_id],
          body: parsed,
          model: Cadenya::AIProviderKey,
          options: options
        )
      end

      # Retrieves an AI provider key by ID from the workspace
      #
      # @overload retrieve(id, workspace_id:, request_options: {})
      #
      # @param id [String] The key to retrieve.
      #
      # @param workspace_id [String] The workspace the key belongs to.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::AIProviderKey]
      #
      # @see Cadenya::Models::AIProviderKeyRetrieveParams
      def retrieve(id, params)
        parsed, options = Cadenya::AIProviderKeyRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/ai_provider_keys/%2$s", workspace_id, id],
          model: Cadenya::AIProviderKey,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::AIProviderKeyUpdateParams} for more details.
      #
      # Updates an AI provider key's name or key value in the workspace
      #
      # @overload update(id, workspace_id:, metadata: nil, spec: nil, update_mask: nil, request_options: {})
      #
      # @param id [String] Path param: The key to update.
      #
      # @param workspace_id [String] Path param: The workspace the key belongs to.
      #
      # @param metadata [Cadenya::Models::UpdateResourceMetadata] Body param: UpdateResourceMetadata contains the user-provided fields for updatin
      #
      # @param spec [Cadenya::Models::AIProviderKeySpec] Body param
      #
      # @param update_mask [String] Body param: Fields to update.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::AIProviderKey]
      #
      # @see Cadenya::Models::AIProviderKeyUpdateParams
      def update(id, params)
        parsed, options = Cadenya::AIProviderKeyUpdateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :patch,
          path: ["v1/workspaces/%1$s/ai_provider_keys/%2$s", workspace_id, id],
          body: parsed,
          model: Cadenya::AIProviderKey,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::AIProviderKeyListParams} for more details.
      #
      # Lists all customer-provided AI provider keys in the workspace
      #
      # @overload list(workspace_id, cursor: nil, include_info: nil, labels: nil, limit: nil, prefix: nil, promotional: nil, query: nil, sort_order: nil, request_options: {})
      #
      # @param workspace_id [String] The workspace whose keys will be listed.
      #
      # @param cursor [String] Pagination cursor from previous response
      #
      # @param include_info [Boolean] When true, populate each item's info (model counts), at the cost of extra
      #
      # @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
      #
      # @param limit [Integer] Maximum number of results to return
      #
      # @param prefix [String] Filter expression (query param: prefix)
      #
      # @param promotional [Boolean] When true, return only promotional keys (provided by Cadenya, e.g. for
      #
      # @param query [String] Free-form search query
      #
      # @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::AIProviderKey>]
      #
      # @see Cadenya::Models::AIProviderKeyListParams
      def list(workspace_id, params = {})
        parsed, options = Cadenya::AIProviderKeyListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/ai_provider_keys", workspace_id],
          query: query.transform_keys(include_info: "includeInfo", sort_order: "sortOrder"),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::AIProviderKey,
          options: options
        )
      end

      # Deletes an AI provider key from the workspace
      #
      # @overload delete(id, workspace_id:, request_options: {})
      #
      # @param id [String] The key to delete.
      #
      # @param workspace_id [String] The workspace the key belongs to.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Cadenya::Models::AIProviderKeyDeleteParams
      def delete(id, params)
        parsed, options = Cadenya::AIProviderKeyDeleteParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :delete,
          path: ["v1/workspaces/%1$s/ai_provider_keys/%2$s", workspace_id, id],
          model: NilClass,
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
