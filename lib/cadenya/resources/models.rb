# frozen_string_literal: true

module Cadenya
  module Resources
    # Manage LLM models available to a workspace. Models represent provider and family
    # pairs (e.g., "anthropic/claude-sonnet-4.6"). Workspaces are seeded with the
    # supported models and you can enable or disable each one.
    class Models
      # Retrieves a model by ID from the workspace
      #
      # @overload retrieve(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] Model ID
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Model]
      #
      # @see Cadenya::Models::ModelRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Cadenya::ModelRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/models/%2$s", workspace_id, id],
          model: Cadenya::Model,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ModelListParams} for more details.
      #
      # Lists all models in the workspace
      #
      # @overload list(workspace_id: nil, ai_provider_key_id: nil, cursor: nil, include_info: nil, is_assigned: nil, labels: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, state: nil, request_options: {})
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param ai_provider_key_id [String] Query param: Filter to models provisioned on a specific AI provider key. Accepts
      #
      # @param cursor [String] Query param: Pagination cursor from previous response
      #
      # @param include_info [Boolean] Query param: When true, populate each item's info (e.g. the AI provider), at the
      #
      # @param is_assigned [Boolean] Query param: Filter models to only ones assigned to an active agent variation/ag
      #
      # @param labels [String] Query param: Filters by metadata labels. Comma-separated key=value pairs,
      #
      # @param limit [Integer] Query param: Maximum number of results to return
      #
      # @param prefix [String] Query param: Filter by a prefix of the model's display name, external id, or id
      #
      # @param query [String] Query param: Free-form search query
      #
      # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time)
      #
      # @param state [Symbol, Cadenya::Models::ModelListParams::State] Query param: Filter by model state
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Model>]
      #
      # @see Cadenya::Models::ModelListParams
      def list(params = {})
        parsed, options = Cadenya::ModelListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/models", workspace_id],
          query: query.transform_keys(
            ai_provider_key_id: "aiProviderKeyId",
            include_info: "includeInfo",
            is_assigned: "isAssigned",
            sort_order: "sortOrder"
          ),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::Model,
          options: options
        )
      end

      # Transitions a model to STATE_DISABLED. Fails while agent variations are still
      # provisioned on the model; use :swapModelOnVariations to move them first.
      #
      # @overload disable(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] Model ID
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Model]
      #
      # @see Cadenya::Models::ModelDisableParams
      def disable(id, params = {})
        parsed, options = Cadenya::ModelDisableParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/models/%2$s:disable", workspace_id, id],
          model: Cadenya::Model,
          options: options
        )
      end

      # Transitions a model to STATE_ENABLED, making it available for agent variations
      # in the workspace
      #
      # @overload enable(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] Model ID
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Model]
      #
      # @see Cadenya::Models::ModelEnableParams
      def enable(id, params = {})
        parsed, options = Cadenya::ModelEnableParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/models/%2$s:enable", workspace_id, id],
          model: Cadenya::Model,
          options: options
        )
      end

      # Reassigns agent variations from one model to another in bulk. Runs
      # asynchronously and returns immediately.
      #
      # @overload swap(workspace_id: nil, model_swaps: nil, request_options: {})
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param model_swaps [Array<Cadenya::Models::ModelSwapParams::ModelSwap>] Body param: The swaps to perform.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Cadenya::Models::ModelSwapParams
      def swap(params = {})
        parsed, options = Cadenya::ModelSwapParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/models:swapModelOnVariations", workspace_id],
          body: parsed,
          model: Cadenya::Internal::Type::Unknown,
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
