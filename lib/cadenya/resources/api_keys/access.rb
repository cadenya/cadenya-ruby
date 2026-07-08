# frozen_string_literal: true

module Cadenya
  module Resources
    class APIKeys
      # Issue, rotate, and revoke API keys for the account, and grant or revoke each
      # key's access to individual workspaces.
      class Access
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::APIKeys::AccessListParams} for more details.
        #
        # Lists the workspaces this API key has access to. Cursor-paginated.
        #
        # @overload list(id, cursor: nil, labels: nil, limit: nil, request_options: {})
        #
        # @param id [String] The API key whose workspace associations will be listed.
        #
        # @param cursor [String] Pagination cursor from previous response.
        #
        # @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
        #
        # @param limit [Integer] Maximum number of results to return.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Workspace>]
        #
        # @see Cadenya::Models::APIKeys::AccessListParams
        def list(id, params = {})
          parsed, options = Cadenya::APIKeys::AccessListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: ["v1/account/api_keys/%1$s/workspaces", id],
            query: query,
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::Workspace,
            options: options
          )
        end

        # Grants this API key access to the specified workspace. Idempotent — adding an
        # already-associated workspace is a no-op. Returns the updated API key with
        # refreshed workspace preview and total.
        #
        # @overload add(id, workspace_id: nil, request_options: {})
        #
        # @param id [String] The API key being granted workspace access.
        #
        # @param workspace_id [String] The workspace to grant access to.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::APIKey]
        #
        # @see Cadenya::Models::APIKeys::AccessAddParams
        def add(id, params = {})
          parsed, options = Cadenya::APIKeys::AccessAddParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/account/api_keys/%1$s/workspaces", id],
            body: parsed,
            model: Cadenya::APIKey,
            options: options
          )
        end

        # Revokes this API key's access to the specified workspace. Idempotent. A key may
        # have zero workspaces and remains valid.
        #
        # @overload remove(workspace_id, id:, request_options: {})
        #
        # @param workspace_id [String] The workspace whose access is being revoked (path).
        #
        # @param id [String] The API key losing workspace access (path).
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Cadenya::Models::APIKeys::AccessRemoveParams
        def remove(workspace_id, params)
          parsed, options = Cadenya::APIKeys::AccessRemoveParams.dump_request(params)
          id =
            parsed.delete(:id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/account/api_keys/%1$s/workspaces/%2$s", id, workspace_id],
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
end
