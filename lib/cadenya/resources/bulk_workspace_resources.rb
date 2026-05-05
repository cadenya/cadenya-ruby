# frozen_string_literal: true

module Cadenya
  module Resources
    # Apply a declarative bundle of workspace resources — tool sets, memory layers,
    # agents, variations, assignments, and schedules — in a single asynchronous
    # operation.
    class BulkWorkspaceResources
      # Apply a declarative bundle of workspace resources — tool sets, memory layers,
      # agents, variations, assignments, and schedules — in a single asynchronous
      # operation.
      # @return [Cadenya::Resources::BulkWorkspaceResources::Results]
      attr_reader :results

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::BulkWorkspaceResourceRetrieveParams} for more details.
      #
      # Retrieves a bulk workspace apply operation by ID.
      #
      # @overload retrieve(id, workspace_id:, request_options: {})
      #
      # @param id [String] Apply ID in canonical apply\_… form. Bulk applies do not support
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::BulkWorkspaceApply]
      #
      # @see Cadenya::Models::BulkWorkspaceResourceRetrieveParams
      def retrieve(id, params)
        parsed, options = Cadenya::BulkWorkspaceResourceRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/bulk_workspace_applies/%2$s", workspace_id, id],
          model: Cadenya::BulkWorkspaceApply,
          options: options
        )
      end

      # Lists past and in-flight bulk workspace apply operations in the workspace.
      #
      # @overload list(workspace_id, bundle_key: nil, cursor: nil, limit: nil, sort_order: nil, state: nil, request_options: {})
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param bundle_key [String] Filter by bundle_key — list every apply for a given bundle.
      #
      # @param cursor [String] Pagination cursor from previous response
      #
      # @param limit [Integer] Maximum number of results to return
      #
      # @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      # @param state [Symbol, Cadenya::Models::BulkWorkspaceResourceListParams::State] Filter by lifecycle state.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::BulkWorkspaceApply>]
      #
      # @see Cadenya::Models::BulkWorkspaceResourceListParams
      def list(workspace_id, params = {})
        parsed, options = Cadenya::BulkWorkspaceResourceListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/bulk_workspace_applies", workspace_id],
          query: query.transform_keys(bundle_key: "bundleKey", sort_order: "sortOrder"),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::BulkWorkspaceApply,
          options: options
        )
      end

      # Asynchronously applies a declarative bundle of workspace resources. Returns the
      # operation immediately in PENDING; clients poll Get to track progress.
      #
      # @overload apply(workspace_id, data:, request_options: {})
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param data [Cadenya::Models::BulkWorkspaceApplyData]
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::BulkWorkspaceApply]
      #
      # @see Cadenya::Models::BulkWorkspaceResourceApplyParams
      def apply(workspace_id, params)
        parsed, options = Cadenya::BulkWorkspaceResourceApplyParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/bulk_workspace_applies", workspace_id],
          body: parsed,
          model: Cadenya::BulkWorkspaceApply,
          options: options
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
        @results = Cadenya::Resources::BulkWorkspaceResources::Results.new(client: client)
      end
    end
  end
end
