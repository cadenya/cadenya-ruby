# frozen_string_literal: true

module Cadenya
  module Resources
    class ToolSets
      # Manage tool sets and the tools they contain. Tool sets group related tools, and
      # tools define specific capabilities available to agents.
      #
      # When a tool set is managed, only API key actors can modify its tools; human
      # (profile) actors cannot.
      class Secrets
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::ToolSets::SecretCreateParams} for more details.
        #
        # Creates a new secret scoped to the tool set
        #
        # @overload create(tool_set_id, workspace_id:, metadata:, spec:, request_options: {})
        #
        # @param tool_set_id [String] Path param: The tool set that will own this secret. Accepts the canonical ts\_…
        # f
        #
        # @param workspace_id [String] Path param: The workspace that owns the tool set.
        #
        # @param metadata [Cadenya::Models::CreateResourceMetadata] Body param: CreateResourceMetadata contains the user-provided fields for creatin
        #
        # @param spec [Cadenya::Models::ToolSets::ToolSetSecretSpec] Body param
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::ToolSets::ToolSetSecret]
        #
        # @see Cadenya::Models::ToolSets::SecretCreateParams
        def create(tool_set_id, params)
          parsed, options = Cadenya::ToolSets::SecretCreateParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["v1/workspaces/%1$s/tool_sets/%2$s/secrets", workspace_id, tool_set_id],
            body: parsed,
            model: Cadenya::ToolSets::ToolSetSecret,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::ToolSets::SecretRetrieveParams} for more details.
        #
        # Retrieves a tool set secret by ID from the tool set
        #
        # @overload retrieve(id, workspace_id:, tool_set_id:, request_options: {})
        #
        # @param id [String] The secret to retrieve.
        #
        # @param workspace_id [String] The workspace that owns the tool set.
        #
        # @param tool_set_id [String] The tool set the secret belongs to. Accepts the canonical ts\_… form
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::ToolSets::ToolSetSecret]
        #
        # @see Cadenya::Models::ToolSets::SecretRetrieveParams
        def retrieve(id, params)
          parsed, options = Cadenya::ToolSets::SecretRetrieveParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          tool_set_id =
            parsed.delete(:tool_set_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/tool_sets/%2$s/secrets/%3$s", workspace_id, tool_set_id, id],
            model: Cadenya::ToolSets::ToolSetSecret,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::ToolSets::SecretUpdateParams} for more details.
        #
        # Updates a secret scoped to the tool set
        #
        # @overload update(id, workspace_id:, tool_set_id:, metadata: nil, spec: nil, update_mask: nil, request_options: {})
        #
        # @param id [String] Path param: The secret to update.
        #
        # @param workspace_id [String] Path param: The workspace that owns the tool set.
        #
        # @param tool_set_id [String] Path param: The tool set the secret belongs to. Accepts the canonical ts\_… form
        #
        # @param metadata [Cadenya::Models::UpdateResourceMetadata] Body param: UpdateResourceMetadata contains the user-provided fields for updatin
        #
        # @param spec [Cadenya::Models::ToolSets::ToolSetSecretSpec] Body param
        #
        # @param update_mask [String] Body param: Fields to update.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::ToolSets::ToolSetSecret]
        #
        # @see Cadenya::Models::ToolSets::SecretUpdateParams
        def update(id, params)
          parsed, options = Cadenya::ToolSets::SecretUpdateParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          tool_set_id =
            parsed.delete(:tool_set_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :patch,
            path: ["v1/workspaces/%1$s/tool_sets/%2$s/secrets/%3$s", workspace_id, tool_set_id, id],
            body: parsed,
            model: Cadenya::ToolSets::ToolSetSecret,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::ToolSets::SecretListParams} for more details.
        #
        # Lists all secrets scoped to the tool set
        #
        # @overload list(tool_set_id, workspace_id:, cursor: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, request_options: {})
        #
        # @param tool_set_id [String] Path param: The tool set whose secrets will be listed. Accepts the canonical
        # ts\_
        #
        # @param workspace_id [String] Path param: The workspace that owns the tool set.
        #
        # @param cursor [String] Query param: Pagination cursor from previous response
        #
        # @param include_info [Boolean] Query param: When set to true you may use more of your alloted API rate-limit
        #
        # @param limit [Integer] Query param: Maximum number of results to return
        #
        # @param prefix [String] Query param: Filter expression (query param: prefix)
        #
        # @param query [String] Query param: Free-form search query
        #
        # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time)
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::ToolSets::ToolSetSecret>]
        #
        # @see Cadenya::Models::ToolSets::SecretListParams
        def list(tool_set_id, params)
          parsed, options = Cadenya::ToolSets::SecretListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/tool_sets/%2$s/secrets", workspace_id, tool_set_id],
            query: query.transform_keys(include_info: "includeInfo", sort_order: "sortOrder"),
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::ToolSets::ToolSetSecret,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::ToolSets::SecretDeleteParams} for more details.
        #
        # Deletes a secret scoped to the tool set
        #
        # @overload delete(id, workspace_id:, tool_set_id:, request_options: {})
        #
        # @param id [String] The secret to delete.
        #
        # @param workspace_id [String] The workspace that owns the tool set.
        #
        # @param tool_set_id [String] The tool set the secret belongs to. Accepts the canonical ts\_… form
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Cadenya::Models::ToolSets::SecretDeleteParams
        def delete(id, params)
          parsed, options = Cadenya::ToolSets::SecretDeleteParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          tool_set_id =
            parsed.delete(:tool_set_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/workspaces/%1$s/tool_sets/%2$s/secrets/%3$s", workspace_id, tool_set_id, id],
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
