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

      # Manage tool sets and the tools they contain. Tool sets group related tools, and
      # tools define specific capabilities available to agents.
      #
      # When a tool set is managed, only API key actors can modify its tools; human
      # (profile) actors cannot.
      # @return [Cadenya::Resources::ToolSets::Secrets]
      attr_reader :secrets

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ToolSetCreateParams} for more details.
      #
      # Creates a new tool set in the workspace
      #
      # @overload create(metadata:, spec:, workspace_id: nil, request_options: {})
      #
      # @param metadata [Cadenya::Models::CreateResourceMetadata] Body param: CreateResourceMetadata contains the user-provided fields for creatin
      #
      # @param spec [Cadenya::Models::ToolSetSpec] Body param
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::ToolSet]
      #
      # @see Cadenya::Models::ToolSetCreateParams
      def create(params)
        parsed, options = Cadenya::ToolSetCreateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
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
      # @overload retrieve(id, workspace_id: nil, request_options: {})
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
      def retrieve(id, params = {})
        parsed, options = Cadenya::ToolSetRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
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
      # @overload update(id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil, request_options: {})
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
      def update(id, params = {})
        parsed, options = Cadenya::ToolSetUpdateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :patch,
          path: ["v1/workspaces/%1$s/tool_sets/%2$s", workspace_id, id],
          body: parsed,
          model: Cadenya::ToolSet,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ToolSetListParams} for more details.
      #
      # Lists all tool sets in the workspace
      #
      # @overload list(workspace_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, state: nil, request_options: {})
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param cursor [String] Query param: Pagination cursor from previous response
      #
      # @param include_info [Boolean] Query param: When set to true you may use more of your alloted API rate-limit
      #
      # @param labels [String] Query param: Filters by metadata labels. Comma-separated key=value pairs,
      #
      # @param limit [Integer] Query param: Maximum number of results to return
      #
      # @param prefix [String] Query param: Filter expression (query param: prefix)
      #
      # @param query [String] Query param: Free-form search query
      #
      # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time)
      #
      # @param state [Symbol, Cadenya::Models::ToolSetListParams::State] Query param: Filter by tool set lifecycle state. Defaults to STATE_ACTIVE when
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::ToolSet>]
      #
      # @see Cadenya::Models::ToolSetListParams
      def list(params = {})
        parsed, options = Cadenya::ToolSetListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/tool_sets", workspace_id],
          query: query.transform_keys(include_info: "includeInfo", sort_order: "sortOrder"),
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
      # @overload delete(id, workspace_id: nil, request_options: {})
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
      def delete(id, params = {})
        parsed, options = Cadenya::ToolSetDeleteParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :delete,
          path: ["v1/workspaces/%1$s/tool_sets/%2$s", workspace_id, id],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ToolSetArchiveParams} for more details.
      #
      # Transitions a tool set to STATE_ARCHIVED. Syncing stops, the tool set is hidden
      # from list results, its tools are no longer offered to objectives, and new
      # variation assignments are rejected. Existing assignments are retained, and
      # history is preserved — unlike delete, archiving works while the tool set is
      # still assigned to agent variations.
      #
      # @overload archive(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] Tool set ID. Accepts the canonical ts\_… form or the
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::ToolSet]
      #
      # @see Cadenya::Models::ToolSetArchiveParams
      def archive(id, params = {})
        parsed, options = Cadenya::ToolSetArchiveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/tool_sets/%2$s:archive", workspace_id, id],
          model: Cadenya::ToolSet,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ToolSetGetOpenAPISpecParams} for more details.
      #
      # Retrieves the current OpenAPI specification JSON that has been consumed by the
      # tool set. Only applicable to tool sets using the OpenAPI adapter.
      #
      # @overload get_openapi_spec(tool_set_id, workspace_id: nil, request_options: {})
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
      def get_openapi_spec(tool_set_id, params = {})
        parsed, options = Cadenya::ToolSetGetOpenAPISpecParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
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
      # @overload list_events(tool_set_id, workspace_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, sort_order: nil, request_options: {})
      #
      # @param tool_set_id [String] Path param: Tool set ID. Accepts the canonical ts\_… form or the
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param cursor [String] Query param: Pagination cursor from previous response
      #
      # @param include_info [Boolean] Query param: When set to true you may use more of your alloted API rate-limit
      #
      # @param labels [String] Query param: Filters by metadata labels. Comma-separated key=value pairs,
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
      def list_events(tool_set_id, params = {})
        parsed, options = Cadenya::ToolSetListEventsParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
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

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ToolSetUnarchiveParams} for more details.
      #
      # Transitions an archived tool set back to STATE_ACTIVE. Managed tool sets resume
      # syncing on their next cycle and their tools become available to objectives
      # again.
      #
      # @overload unarchive(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] Tool set ID. Accepts the canonical ts\_… form or the
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::ToolSet]
      #
      # @see Cadenya::Models::ToolSetUnarchiveParams
      def unarchive(id, params = {})
        parsed, options = Cadenya::ToolSetUnarchiveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/tool_sets/%2$s:unarchive", workspace_id, id],
          model: Cadenya::ToolSet,
          options: options
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
        @tools = Cadenya::Resources::ToolSets::Tools.new(client: client)
        @secrets = Cadenya::Resources::ToolSets::Secrets.new(client: client)
      end
    end
  end
end
