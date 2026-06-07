# frozen_string_literal: true

module Cadenya
  module Resources
    # Manage LLM models available to a workspace. Models represent provider and family
    # pairs (e.g., "anthropic/claude-sonnet-4.6"). Workspaces are seeded with the
    # supported models and you can enable or disable each one.
    class Models
      # Retrieves a model by ID from the workspace
      #
      # @overload retrieve(id, workspace_id:, request_options: {})
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
      def retrieve(id, params)
        parsed, options = Cadenya::ModelRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
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
      # @overload list(workspace_id, ai_provider_key_id: nil, bundle_key: nil, cursor: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, status: nil, request_options: {})
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param ai_provider_key_id [String] Filter to models provisioned on a specific AI provider key. Accepts the
      #
      # @param bundle_key [String] Filter by bundle_key — return only resources owned by this bundle.
      #
      # @param cursor [String] Pagination cursor from previous response
      #
      # @param include_info [Boolean] When true, populate each item's info (e.g. the AI provider), at the cost of
      #
      # @param limit [Integer] Maximum number of results to return
      #
      # @param prefix [String] Filter by name prefix
      #
      # @param query [String] Free-form search query
      #
      # @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      # @param status [Symbol, Cadenya::Models::ModelListParams::Status] Filter by model status
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Model>]
      #
      # @see Cadenya::Models::ModelListParams
      def list(workspace_id, params = {})
        parsed, options = Cadenya::ModelListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/models", workspace_id],
          query: query.transform_keys(
            ai_provider_key_id: "aiProviderKeyId",
            bundle_key: "bundleKey",
            include_info: "includeInfo",
            sort_order: "sortOrder"
          ),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::Model,
          options: options
        )
      end

      # Enables or disables a model in the workspace
      #
      # @overload set_status(id, workspace_id:, status: nil, request_options: {})
      #
      # @param id [String] Path param: Model ID
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param status [Symbol, Cadenya::Models::ModelSetStatusParams::Status] Body param: The new status for the model
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Model]
      #
      # @see Cadenya::Models::ModelSetStatusParams
      def set_status(id, params)
        parsed, options = Cadenya::ModelSetStatusParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :put,
          path: ["v1/workspaces/%1$s/models/%2$s/status", workspace_id, id],
          body: parsed,
          model: Cadenya::Model,
          options: options
        )
      end

      # Reassigns agent variations from one model to another in bulk. Runs
      # asynchronously and returns immediately.
      #
      # @overload swap(workspace_id, model_swaps: nil, request_options: {})
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param model_swaps [Array<Cadenya::Models::ModelSwapParams::ModelSwap>] The swaps to perform.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Cadenya::Models::ModelSwapParams
      def swap(workspace_id, params = {})
        parsed, options = Cadenya::ModelSwapParams.dump_request(params)
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
