# frozen_string_literal: true

module Cadenya
  module Resources
    class BulkWorkspaceResources
      # Apply a declarative bundle of workspace resources — tool sets, memory layers,
      # agents, variations, assignments, and schedules — in a single asynchronous
      # operation.
      class Results
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::BulkWorkspaceResources::ResultListParams} for more details.
        #
        # Lists each resource action recorded by a bulk workspace apply operation.
        #
        # @overload list(bulk_workspace_apply_id, workspace_id:, action: nil, cursor: nil, limit: nil, sort_order: nil, type: nil, request_options: {})
        #
        # @param bulk_workspace_apply_id [String] Path param: Apply ID in canonical apply\_… form.
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param action [Symbol, Cadenya::Models::BulkWorkspaceResources::ResultListParams::Action] Query param: Filter by action.
        #
        # @param cursor [String] Query param: Pagination cursor from previous response
        #
        # @param limit [Integer] Query param: Maximum number of results to return
        #
        # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time)
        #
        # @param type [String] Query param: Filter by data.type discriminator (e.g., "toolSet", "memoryEntry").
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResult>]
        #
        # @see Cadenya::Models::BulkWorkspaceResources::ResultListParams
        def list(bulk_workspace_apply_id, params)
          parsed, options = Cadenya::BulkWorkspaceResources::ResultListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: [
              "v1/workspaces/%1$s/bulk_workspace_applies/%2$s/results",
              workspace_id,
              bulk_workspace_apply_id
            ],
            query: query.transform_keys(sort_order: "sortOrder"),
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResult,
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
