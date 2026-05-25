# frozen_string_literal: true

module Cadenya
  module Resources
    # Manage tool sets and the tools they contain. Tool sets group related tools, and
    # tools define specific capabilities available to agents.
    #
    # When a tool set is managed, only API key actors can modify its tools; human
    # (profile) actors cannot.
    class ToolSets
      # Manage tool sets and the tools they contain. Tool sets group related tools, and
      # tools define specific capabilities available to agents.
      #
      # When a tool set is managed, only API key actors can modify its tools; human
      # (profile) actors cannot.
      # @return [Cadenya::Resources::ToolSets::Tools]
      attr_reader :tools

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ToolSetCreateParams} for more details.
      #
      # Creates a new tool set in the workspace
      #
      # @overload create(workspace_id, metadata:, spec:, request_options: {})
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param metadata [Cadenya::Models::CreateResourceMetadata] CreateResourceMetadata contains the user-provided fields for creating
      #
      # @param spec [Cadenya::Models::ToolSetSpec]
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::ToolSet]
      #
      # @see Cadenya::Models::ToolSetCreateParams
      def create(workspace_id, params)
        parsed, options = Cadenya::ToolSetCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/tool_sets", workspace_id],
          body: parsed,
          model: Cadenya::ToolSet,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ToolSetRetrieveParams} for more details.
      #
      # Retrieves a tool set by ID from the workspace
      #
      # @overload retrieve(id, workspace_id:, request_options: {})
      #
      # @param id [String] Tool set ID. Accepts the canonical ts\_… form or the
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::ToolSet]
      #
      # @see Cadenya::Models::ToolSetRetrieveParams
      def retrieve(id, params)
        parsed, options = Cadenya::ToolSetRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/tool_sets/%2$s", workspace_id, id],
          model: Cadenya::ToolSet,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ToolSetUpdateParams} for more details.
      #
      # Updates a tool set in the workspace
      #
      # @overload update(id, workspace_id:, metadata: nil, spec: nil, update_mask: nil, request_options: {})
      #
      # @param id [String] Path param: Tool set ID. Accepts the canonical ts\_… form or the
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param metadata [Cadenya::Models::UpdateResourceMetadata] Body param: UpdateResourceMetadata contains the user-provided fields for updatin
      #
      # @param spec [Cadenya::Models::ToolSetSpec] Body param
      #
      # @param update_mask [String] Body param
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::ToolSet]
      #
      # @see Cadenya::Models::ToolSetUpdateParams
      def update(id, params)
        parsed, options = Cadenya::ToolSetUpdateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :put,
          path: ["v1/workspaces/%1$s/tool_sets/%2$s", workspace_id, id],
          body: parsed,
          model: Cadenya::ToolSet,
          options: options
        )
      end

      # Lists all tool sets in the workspace
      #
      # @overload list(workspace_id, bundle_key: nil, cursor: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, request_options: {})
      #
      # @param workspace_id [String] Workspace ID.
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
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::ToolSet>]
      #
      # @see Cadenya::Models::ToolSetListParams
      def list(workspace_id, params = {})
        parsed, options = Cadenya::ToolSetListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/tool_sets", workspace_id],
          query: query.transform_keys(
            bundle_key: "bundleKey",
            include_info: "includeInfo",
            sort_order: "sortOrder"
          ),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::ToolSet,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ToolSetDeleteParams} for more details.
      #
      # Deletes a tool set in the workspace
      #
      # @overload delete(id, workspace_id:, request_options: {})
      #
      # @param id [String] Tool set ID. Accepts the canonical ts\_… form or the
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Cadenya::Models::ToolSetDeleteParams
      def delete(id, params)
        parsed, options = Cadenya::ToolSetDeleteParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :delete,
          path: ["v1/workspaces/%1$s/tool_sets/%2$s", workspace_id, id],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ToolSetGetOpenAPISpecParams} for more details.
      #
      # Retrieves the current OpenAPI specification JSON that has been consumed by the
      # tool set. Only applicable to tool sets using the OpenAPI adapter.
      #
      # @overload get_openapi_spec(tool_set_id, workspace_id:, request_options: {})
      #
      # @param tool_set_id [String] Tool set ID. Accepts the canonical ts\_… form or the
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::ToolSetGetOpenAPISpecResponse]
      #
      # @see Cadenya::Models::ToolSetGetOpenAPISpecParams
      def get_openapi_spec(tool_set_id, params)
        parsed, options = Cadenya::ToolSetGetOpenAPISpecParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/tool_sets/%2$s/openapi_spec", workspace_id, tool_set_id],
          model: Cadenya::Models::ToolSetGetOpenAPISpecResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ToolSetListEventsParams} for more details.
      #
      # Lists all events (including sync status) for a tool set
      #
      # @overload list_events(tool_set_id, workspace_id:, cursor: nil, include_info: nil, limit: nil, sort_order: nil, request_options: {})
      #
      # @param tool_set_id [String] Path param: Tool set ID. Accepts the canonical ts\_… form or the
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param cursor [String] Query param: Pagination cursor from previous response
      #
      # @param include_info [Boolean] Query param: When set to true you may use more of your alloted API rate-limit
      #
      # @param limit [Integer] Query param: Maximum number of results to return
      #
      # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time)
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::ToolSetEvent>]
      #
      # @see Cadenya::Models::ToolSetListEventsParams
      def list_events(tool_set_id, params)
        parsed, options = Cadenya::ToolSetListEventsParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/tool_sets/%2$s/events", workspace_id, tool_set_id],
          query: query.transform_keys(include_info: "includeInfo", sort_order: "sortOrder"),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::ToolSetEvent,
          options: options
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
        @tools = Cadenya::Resources::ToolSets::Tools.new(client: client)
      end
    end
  end
end
