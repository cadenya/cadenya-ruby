# frozen_string_literal: true

module Cadenya
  module Resources
    # Manage memory layers and their entries. Layers are named containers that can be
    # composed into an objective's memory cascade; entries are the keyed values within
    # a layer. System-managed layers (e.g., episodic layers created by the runtime)
    # cannot be mutated through this API.
    class MemoryLayers
      # Manage memory layers and their entries. Layers are named containers that can be
      # composed into an objective's memory cascade; entries are the keyed values within
      # a layer. System-managed layers (e.g., episodic layers created by the runtime)
      # cannot be mutated through this API.
      # @return [Cadenya::Resources::MemoryLayers::Entries]
      attr_reader :entries

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::MemoryLayerCreateParams} for more details.
      #
      # Creates a new memory layer in the workspace
      #
      # @overload create(metadata:, spec:, workspace_id: nil, request_options: {})
      #
      # @param metadata [Cadenya::Models::CreateResourceMetadata] Body param: CreateResourceMetadata contains the user-provided fields for creatin
      #
      # @param spec [Cadenya::Models::MemoryLayerSpec] Body param
      #
      # @param workspace_id [String] Path param
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::MemoryLayer]
      #
      # @see Cadenya::Models::MemoryLayerCreateParams
      def create(params)
        parsed, options = Cadenya::MemoryLayerCreateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/memory_layers", workspace_id],
          body: parsed,
          model: Cadenya::MemoryLayer,
          options: options
        )
      end

      # Retrieves a memory layer by ID from the workspace
      #
      # @overload retrieve(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] Memory layer ID. Accepts canonical memlyr\_… form or external_id:<value> form.
      #
      # @param workspace_id [String]
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::MemoryLayer]
      #
      # @see Cadenya::Models::MemoryLayerRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Cadenya::MemoryLayerRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/memory_layers/%2$s", workspace_id, id],
          model: Cadenya::MemoryLayer,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::MemoryLayerUpdateParams} for more details.
      #
      # Updates a memory layer in the workspace
      #
      # @overload update(id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil, request_options: {})
      #
      # @param id [String] Path param: Memory layer ID. Accepts canonical memlyr\_… form or
      # external_id:<val
      #
      # @param workspace_id [String] Path param
      #
      # @param metadata [Cadenya::Models::UpdateResourceMetadata] Body param: UpdateResourceMetadata contains the user-provided fields for updatin
      #
      # @param spec [Cadenya::Models::MemoryLayerSpec] Body param
      #
      # @param update_mask [String] Body param
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::MemoryLayer]
      #
      # @see Cadenya::Models::MemoryLayerUpdateParams
      def update(id, params = {})
        parsed, options = Cadenya::MemoryLayerUpdateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :patch,
          path: ["v1/workspaces/%1$s/memory_layers/%2$s", workspace_id, id],
          body: parsed,
          model: Cadenya::MemoryLayer,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::MemoryLayerListParams} for more details.
      #
      # Lists all memory layers in the workspace
      #
      # @overload list(workspace_id: nil, agent_id: nil, cursor: nil, episodic_key_prefix: nil, include_info: nil, labels: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, type: nil, request_options: {})
      #
      # @param workspace_id [String] Path param
      #
      # @param agent_id [String] Query param: Filter to episodic layers belonging to this agent.
      #
      # @param cursor [String] Query param: Pagination cursor from previous response
      #
      # @param episodic_key_prefix [String] Query param: Filter to episodic layers whose episodic key starts with this prefi
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
      # @param type [Symbol, Cadenya::Models::MemoryLayerListParams::Type] Query param: Filter by layer type
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::MemoryLayer>]
      #
      # @see Cadenya::Models::MemoryLayerListParams
      def list(params = {})
        parsed, options = Cadenya::MemoryLayerListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/memory_layers", workspace_id],
          query: query.transform_keys(
            agent_id: "agentId",
            episodic_key_prefix: "episodicKeyPrefix",
            include_info: "includeInfo",
            sort_order: "sortOrder"
          ),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::MemoryLayer,
          options: options
        )
      end

      # Deletes a memory layer from the workspace
      #
      # @overload delete(id, workspace_id: nil, request_options: {})
      #
      # @param id [String] Memory layer ID. Accepts canonical memlyr\_… form or external_id:<value> form.
      #
      # @param workspace_id [String]
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Cadenya::Models::MemoryLayerDeleteParams
      def delete(id, params = {})
        parsed, options = Cadenya::MemoryLayerDeleteParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :delete,
          path: ["v1/workspaces/%1$s/memory_layers/%2$s", workspace_id, id],
          model: NilClass,
          options: options
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
        @entries = Cadenya::Resources::MemoryLayers::Entries.new(client: client)
      end
    end
  end
end
