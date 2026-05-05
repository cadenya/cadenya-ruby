# frozen_string_literal: true

module Cadenya
  module Resources
    # Manage memory layers and their entries. Layers are named containers that can be
    # composed into an objective's memory stack; entries are the keyed values within a
    # layer. System-managed layers (e.g., episodic layers created by the runtime)
    # cannot be mutated through this API.
    class MemoryLayers
      # Manage memory layers and their entries. Layers are named containers that can be
      # composed into an objective's memory stack; entries are the keyed values within a
      # layer. System-managed layers (e.g., episodic layers created by the runtime)
      # cannot be mutated through this API.
      # @return [Cadenya::Resources::MemoryLayers::Entries]
      attr_reader :entries

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::MemoryLayerCreateParams} for more details.
      #
      # Creates a new memory layer in the workspace
      #
      # @overload create(workspace_id, metadata:, spec:, request_options: {})
      #
      # @param workspace_id [String]
      #
      # @param metadata [Cadenya::Models::CreateResourceMetadata] CreateResourceMetadata contains the user-provided fields for creating
      #
      # @param spec [Cadenya::Models::MemoryLayerSpec]
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::MemoryLayer]
      #
      # @see Cadenya::Models::MemoryLayerCreateParams
      def create(workspace_id, params)
        parsed, options = Cadenya::MemoryLayerCreateParams.dump_request(params)
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
      # @overload retrieve(id, workspace_id:, request_options: {})
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
      def retrieve(id, params)
        parsed, options = Cadenya::MemoryLayerRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
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
      # @overload update(id, workspace_id:, metadata: nil, spec: nil, update_mask: nil, request_options: {})
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
      def update(id, params)
        parsed, options = Cadenya::MemoryLayerUpdateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :patch,
          path: ["v1/workspaces/%1$s/memory_layers/%2$s", workspace_id, id],
          body: parsed,
          model: Cadenya::MemoryLayer,
          options: options
        )
      end

      # Lists all memory layers in the workspace
      #
      # @overload list(workspace_id, bundle_key: nil, cursor: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, type: nil, request_options: {})
      #
      # @param workspace_id [String]
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
      # @param type [Symbol, Cadenya::Models::MemoryLayerListParams::Type] Filter by layer type
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::MemoryLayer>]
      #
      # @see Cadenya::Models::MemoryLayerListParams
      def list(workspace_id, params = {})
        parsed, options = Cadenya::MemoryLayerListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/memory_layers", workspace_id],
          query: query.transform_keys(
            bundle_key: "bundleKey",
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
      # @overload delete(id, workspace_id:, request_options: {})
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
      def delete(id, params)
        parsed, options = Cadenya::MemoryLayerDeleteParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
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
