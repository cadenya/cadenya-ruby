# frozen_string_literal: true

module Cadenya
  module Resources
    class ToolSets
      # Manage tool sets and the tools they contain. Tool sets group related tools, and
      # tools define specific capabilities available to agents.
      #
      # When a tool set is managed, only API key actors can modify its tools; human
      # (profile) actors cannot.
      class Tools
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::ToolSets::ToolCreateParams} for more details.
        #
        # Creates a new tool in the tool set
        #
        # @overload create(tool_set_id, workspace_id:, metadata:, spec:, request_options: {})
        #
        # @param tool_set_id [String] Path param: Tool set ID. Accepts the canonical ts\_… form or the
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param metadata [Cadenya::Models::CreateResourceMetadata] Body param: CreateResourceMetadata contains the user-provided fields for creatin
        #
        # @param spec [Cadenya::Models::ToolSets::ToolSpec] Body param
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::ToolSets::Tool]
        #
        # @see Cadenya::Models::ToolSets::ToolCreateParams
        def create(tool_set_id, params)
          parsed, options = Cadenya::ToolSets::ToolCreateParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["v1/workspaces/%1$s/tool_sets/%2$s/tools", workspace_id, tool_set_id],
            body: parsed,
            model: Cadenya::ToolSets::Tool,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::ToolSets::ToolRetrieveParams} for more details.
        #
        # Retrieves a tool by ID from the workspace
        #
        # @overload retrieve(id, workspace_id:, tool_set_id:, request_options: {})
        #
        # @param id [String] Tool ID. Accepts the canonical tool\_… form or the
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param tool_set_id [String] Tool set ID. Accepts the canonical ts\_… form or the
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::ToolSets::Tool]
        #
        # @see Cadenya::Models::ToolSets::ToolRetrieveParams
        def retrieve(id, params)
          parsed, options = Cadenya::ToolSets::ToolRetrieveParams.dump_request(params)
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
            path: ["v1/workspaces/%1$s/tool_sets/%2$s/tools/%3$s", workspace_id, tool_set_id, id],
            model: Cadenya::ToolSets::Tool,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::ToolSets::ToolUpdateParams} for more details.
        #
        # Updates a tool in the tool set
        #
        # @overload update(id, workspace_id:, tool_set_id:, metadata: nil, spec: nil, update_mask: nil, request_options: {})
        #
        # @param id [String] Path param: Tool ID. Accepts the canonical tool\_… form or the
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param tool_set_id [String] Path param: Tool set ID. Accepts the canonical ts\_… form or the
        #
        # @param metadata [Cadenya::Models::UpdateResourceMetadata] Body param: UpdateResourceMetadata contains the user-provided fields for updatin
        #
        # @param spec [Cadenya::Models::ToolSets::ToolSpec] Body param
        #
        # @param update_mask [String] Body param
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::ToolSets::Tool]
        #
        # @see Cadenya::Models::ToolSets::ToolUpdateParams
        def update(id, params)
          parsed, options = Cadenya::ToolSets::ToolUpdateParams.dump_request(params)
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
            path: ["v1/workspaces/%1$s/tool_sets/%2$s/tools/%3$s", workspace_id, tool_set_id, id],
            body: parsed,
            model: Cadenya::ToolSets::Tool,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::ToolSets::ToolListParams} for more details.
        #
        # Lists all tools in the tool set
        #
        # @overload list(tool_set_id, workspace_id:, cursor: nil, include_info: nil, limit: nil, names: nil, prefix: nil, query: nil, requires_approval: nil, sort_order: nil, states: nil, request_options: {})
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
        # @param names [Array<String>] Query param: Filter by tool name (exact match). Multiple values are OR'd togethe
        #
        # @param prefix [String] Query param: Filter expression (query param: prefix)
        #
        # @param query [String] Query param: Free-form search query
        #
        # @param requires_approval [Boolean] Query param: Filter by approval requirement. Omitted = no filter; true = only to
        #
        # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time)
        #
        # @param states [Array<Symbol, Cadenya::Models::ToolSets::ToolListParams::State>] Query param: Filter by tool state. Multiple values are OR'd together.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::ToolSets::Tool>]
        #
        # @see Cadenya::Models::ToolSets::ToolListParams
        def list(tool_set_id, params)
          parsed, options = Cadenya::ToolSets::ToolListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/tool_sets/%2$s/tools", workspace_id, tool_set_id],
            query: query.transform_keys(
              include_info: "includeInfo",
              requires_approval: "requiresApproval",
              sort_order: "sortOrder"
            ),
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::ToolSets::Tool,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::ToolSets::ToolDeleteParams} for more details.
        #
        # Deletes a tool in the tool set
        #
        # @overload delete(id, workspace_id:, tool_set_id:, request_options: {})
        #
        # @param id [String] Tool ID. Accepts the canonical tool\_… form or the
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param tool_set_id [String] Tool set ID. Accepts the canonical ts\_… form or the
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Cadenya::Models::ToolSets::ToolDeleteParams
        def delete(id, params)
          parsed, options = Cadenya::ToolSets::ToolDeleteParams.dump_request(params)
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
            path: ["v1/workspaces/%1$s/tool_sets/%2$s/tools/%3$s", workspace_id, tool_set_id, id],
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::ToolSets::ToolOmitParams} for more details.
        #
        # Transitions a tool to STATE_OMITTED, excluding it from agent use. Fails if the
        # tool is currently assigned to agent variations.
        #
        # @overload omit(id, workspace_id:, tool_set_id:, request_options: {})
        #
        # @param id [String] Tool ID. Accepts the canonical tool\_… form or the
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param tool_set_id [String] Tool set ID. Accepts the canonical ts\_… form or the
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::ToolSets::Tool]
        #
        # @see Cadenya::Models::ToolSets::ToolOmitParams
        def omit(id, params)
          parsed, options = Cadenya::ToolSets::ToolOmitParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          tool_set_id =
            parsed.delete(:tool_set_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["v1/workspaces/%1$s/tool_sets/%2$s/tools/%3$s:omit", workspace_id, tool_set_id, id],
            model: Cadenya::ToolSets::Tool,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::ToolSets::ToolRestoreParams} for more details.
        #
        # Transitions an omitted tool back to STATE_AVAILABLE. For managed tool sets, the
        # next sync may omit the tool again if its filters still exclude it.
        #
        # @overload restore(id, workspace_id:, tool_set_id:, request_options: {})
        #
        # @param id [String] Tool ID. Accepts the canonical tool\_… form or the
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param tool_set_id [String] Tool set ID. Accepts the canonical ts\_… form or the
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::ToolSets::Tool]
        #
        # @see Cadenya::Models::ToolSets::ToolRestoreParams
        def restore(id, params)
          parsed, options = Cadenya::ToolSets::ToolRestoreParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          tool_set_id =
            parsed.delete(:tool_set_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["v1/workspaces/%1$s/tool_sets/%2$s/tools/%3$s:restore", workspace_id, tool_set_id, id],
            model: Cadenya::ToolSets::Tool,
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
