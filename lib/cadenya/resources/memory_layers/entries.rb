# frozen_string_literal: true

module Cadenya
  module Resources
    class MemoryLayers
      # Manage memory layers and their entries. Layers are named containers that can be
      # composed into an objective's memory stack; entries are the keyed values within a
      # layer. System-managed layers (e.g., episodic layers created by the runtime)
      # cannot be mutated through this API.
      class Entries
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::MemoryLayers::EntryCreateParams} for more details.
        #
        # Creates a new entry in a memory layer. Returns the detail view, including the
        # resolved content body.
        #
        # @overload create(memory_layer_id, workspace_id:, metadata:, spec:, request_options: {})
        #
        # @param memory_layer_id [String] Path param: Memory layer ID. Accepts canonical memlyr\_… form or
        # external_id:<val
        #
        # @param workspace_id [String] Path param
        #
        # @param metadata [Cadenya::Models::CreateResourceMetadata] Body param: CreateResourceMetadata contains the user-provided fields for creatin
        #
        # @param spec [Cadenya::Models::MemoryLayers::MemoryEntryCreateSpec] Body param: MemoryEntryCreateSpec is the input shape for CreateMemoryEntry. It a
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::MemoryLayers::MemoryEntryDetail]
        #
        # @see Cadenya::Models::MemoryLayers::EntryCreateParams
        def create(memory_layer_id, params)
          parsed, options = Cadenya::MemoryLayers::EntryCreateParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["v1/workspaces/%1$s/memory_layers/%2$s/entries", workspace_id, memory_layer_id],
            body: parsed,
            model: Cadenya::MemoryLayers::MemoryEntryDetail,
            options: options
          )
        end

        # Retrieves a memory entry by ID from a memory layer. Returns the detail view,
        # including the content body.
        #
        # @overload retrieve(id, workspace_id:, memory_layer_id:, request_options: {})
        #
        # @param id [String]
        #
        # @param workspace_id [String]
        #
        # @param memory_layer_id [String] Memory layer ID. Accepts canonical memlyr\_… form or external_id:<value> form.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::MemoryLayers::MemoryEntryDetail]
        #
        # @see Cadenya::Models::MemoryLayers::EntryRetrieveParams
        def retrieve(id, params)
          parsed, options = Cadenya::MemoryLayers::EntryRetrieveParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          memory_layer_id =
            parsed.delete(:memory_layer_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/memory_layers/%2$s/entries/%3$s", workspace_id, memory_layer_id, id],
            model: Cadenya::MemoryLayers::MemoryEntryDetail,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::MemoryLayers::EntryUpdateParams} for more details.
        #
        # Updates a memory entry in a memory layer. Returns the detail view, including the
        # resolved content body.
        #
        # @overload update(id, workspace_id:, memory_layer_id:, metadata: nil, spec: nil, update_mask: nil, request_options: {})
        #
        # @param id [String] Path param
        #
        # @param workspace_id [String] Path param
        #
        # @param memory_layer_id [String] Path param: Memory layer ID. Accepts canonical memlyr\_… form or
        # external_id:<val
        #
        # @param metadata [Cadenya::Models::UpdateResourceMetadata] Body param: UpdateResourceMetadata contains the user-provided fields for updatin
        #
        # @param spec [Cadenya::Models::MemoryLayers::MemoryEntryUpdateSpec] Body param: MemoryEntryUpdateSpec is the input shape for UpdateMemoryEntry. Fiel
        #
        # @param update_mask [String] Body param
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::MemoryLayers::MemoryEntryDetail]
        #
        # @see Cadenya::Models::MemoryLayers::EntryUpdateParams
        def update(id, params)
          parsed, options = Cadenya::MemoryLayers::EntryUpdateParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          memory_layer_id =
            parsed.delete(:memory_layer_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :patch,
            path: ["v1/workspaces/%1$s/memory_layers/%2$s/entries/%3$s", workspace_id, memory_layer_id, id],
            body: parsed,
            model: Cadenya::MemoryLayers::MemoryEntryDetail,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::MemoryLayers::EntryListParams} for more details.
        #
        # Lists all entries in a memory layer
        #
        # @overload list(memory_layer_id, workspace_id:, bundle_key: nil, cursor: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, request_options: {})
        #
        # @param memory_layer_id [String] Path param: Memory layer ID. Accepts canonical memlyr\_… form or
        # external_id:<val
        #
        # @param workspace_id [String] Path param
        #
        # @param bundle_key [String] Query param: Filter by bundle_key — return only resources owned by this bundle.
        #
        # @param cursor [String] Query param: Pagination cursor from previous response
        #
        # @param include_info [Boolean] Query param: When set to true you may use more of your alloted API rate-limit
        #
        # @param limit [Integer] Query param: Maximum number of results to return
        #
        # @param prefix [String] Query param: Filter by key prefix (e.g., "skills/postmortem/" to list all entrie
        #
        # @param query [String] Query param: Free-form search query
        #
        # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time)
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::MemoryLayers::MemoryEntry>]
        #
        # @see Cadenya::Models::MemoryLayers::EntryListParams
        def list(memory_layer_id, params)
          parsed, options = Cadenya::MemoryLayers::EntryListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/memory_layers/%2$s/entries", workspace_id, memory_layer_id],
            query: query.transform_keys(
              bundle_key: "bundleKey",
              include_info: "includeInfo",
              sort_order: "sortOrder"
            ),
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::MemoryLayers::MemoryEntry,
            options: options
          )
        end

        # Deletes a memory entry from a memory layer
        #
        # @overload delete(id, workspace_id:, memory_layer_id:, request_options: {})
        #
        # @param id [String]
        #
        # @param workspace_id [String]
        #
        # @param memory_layer_id [String] Memory layer ID. Accepts canonical memlyr\_… form or external_id:<value> form.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Cadenya::Models::MemoryLayers::EntryDeleteParams
        def delete(id, params)
          parsed, options = Cadenya::MemoryLayers::EntryDeleteParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          memory_layer_id =
            parsed.delete(:memory_layer_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/workspaces/%1$s/memory_layers/%2$s/entries/%3$s", workspace_id, memory_layer_id, id],
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
