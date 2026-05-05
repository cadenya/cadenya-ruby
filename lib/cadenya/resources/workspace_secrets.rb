# frozen_string_literal: true

module Cadenya
  module Resources
    class WorkspaceSecrets
      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WorkspaceSecretCreateParams} for more details.
      #
      # Creates a new workspace secret in the workspace
      #
      # @overload create(workspace_id, metadata:, spec:, request_options: {})
      #
      # @param workspace_id [String] The workspace that will own this secret.
      #
      # @param metadata [Cadenya::Models::CreateResourceMetadata] CreateResourceMetadata contains the user-provided fields for creating
      #
      # @param spec [Cadenya::Models::WorkspaceSecretSpec]
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::WorkspaceSecret]
      #
      # @see Cadenya::Models::WorkspaceSecretCreateParams
      def create(workspace_id, params)
        parsed, options = Cadenya::WorkspaceSecretCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/workspace_secrets", workspace_id],
          body: parsed,
          model: Cadenya::WorkspaceSecret,
          options: options
        )
      end

      # Retrieves a workspace secret by ID from the workspace
      #
      # @overload retrieve(id, workspace_id:, request_options: {})
      #
      # @param id [String] The secret to retrieve.
      #
      # @param workspace_id [String] The workspace the secret belongs to.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::WorkspaceSecret]
      #
      # @see Cadenya::Models::WorkspaceSecretRetrieveParams
      def retrieve(id, params)
        parsed, options = Cadenya::WorkspaceSecretRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/workspace_secrets/%2$s", workspace_id, id],
          model: Cadenya::WorkspaceSecret,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::WorkspaceSecretUpdateParams} for more details.
      #
      # Updates a workspace secret in the workspace
      #
      # @overload update(id, workspace_id:, metadata: nil, spec: nil, update_mask: nil, request_options: {})
      #
      # @param id [String] Path param: The secret to update.
      #
      # @param workspace_id [String] Path param: The workspace the secret belongs to.
      #
      # @param metadata [Cadenya::Models::UpdateResourceMetadata] Body param: UpdateResourceMetadata contains the user-provided fields for updatin
      #
      # @param spec [Cadenya::Models::WorkspaceSecretSpec] Body param
      #
      # @param update_mask [String] Body param: Fields to update.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::WorkspaceSecret]
      #
      # @see Cadenya::Models::WorkspaceSecretUpdateParams
      def update(id, params)
        parsed, options = Cadenya::WorkspaceSecretUpdateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :patch,
          path: ["v1/workspaces/%1$s/workspace_secrets/%2$s", workspace_id, id],
          body: parsed,
          model: Cadenya::WorkspaceSecret,
          options: options
        )
      end

      # Lists all workspace secrets in the workspace
      #
      # @overload list(workspace_id, bundle_key: nil, cursor: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, request_options: {})
      #
      # @param workspace_id [String] The workspace whose secrets will be listed.
      #
      # @param bundle_key [String] Filter by bundle_key — return only resources owned by this bundle.
      #
      # @param cursor [String] Pagination cursor from previous response
      #
      # @param include_info [Boolean] When set to true you may use more of your alloted API rate-limit
      #
      # @param limit [Integer] Maximum number of results to return
      #
      # @param prefix [String] Filter expression (query param: prefix)
      #
      # @param query [String] Free-form search query
      #
      # @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::WorkspaceSecret>]
      #
      # @see Cadenya::Models::WorkspaceSecretListParams
      def list(workspace_id, params = {})
        parsed, options = Cadenya::WorkspaceSecretListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/workspace_secrets", workspace_id],
          query: query.transform_keys(
            bundle_key: "bundleKey",
            include_info: "includeInfo",
            sort_order: "sortOrder"
          ),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::WorkspaceSecret,
          options: options
        )
      end

      # Deletes a workspace secret from the workspace
      #
      # @overload delete(id, workspace_id:, request_options: {})
      #
      # @param id [String] The secret to delete.
      #
      # @param workspace_id [String] The workspace the secret belongs to.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Cadenya::Models::WorkspaceSecretDeleteParams
      def delete(id, params)
        parsed, options = Cadenya::WorkspaceSecretDeleteParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :delete,
          path: ["v1/workspaces/%1$s/workspace_secrets/%2$s", workspace_id, id],
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
