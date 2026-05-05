# typed: strong

module Cadenya
  module Resources
    # Apply a declarative bundle of workspace resources — tool sets, memory layers,
    # agents, variations, assignments, and schedules — in a single asynchronous
    # operation.
    class BulkWorkspaceResources
      # Apply a declarative bundle of workspace resources — tool sets, memory layers,
      # agents, variations, assignments, and schedules — in a single asynchronous
      # operation.
      sig { returns(Cadenya::Resources::BulkWorkspaceResources::Results) }
      attr_reader :results

      # Retrieves a bulk workspace apply operation by ID.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::BulkWorkspaceApply)
      end
      def retrieve(
        # Apply ID in canonical apply\_… form. Bulk applies do not support external_id
        # lookup.
        id,
        # Workspace ID.
        workspace_id:,
        request_options: {}
      )
      end

      # Lists past and in-flight bulk workspace apply operations in the workspace.
      sig do
        params(
          workspace_id: String,
          bundle_key: String,
          cursor: String,
          limit: Integer,
          sort_order: String,
          state: Cadenya::BulkWorkspaceResourceListParams::State::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(
          Cadenya::Internal::CursorPagination[Cadenya::BulkWorkspaceApply]
        )
      end
      def list(
        # Workspace ID.
        workspace_id,
        # Filter by bundle_key — list every apply for a given bundle.
        bundle_key: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # Maximum number of results to return
        limit: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Filter by lifecycle state.
        state: nil,
        request_options: {}
      )
      end

      # Asynchronously applies a declarative bundle of workspace resources. Returns the
      # operation immediately in PENDING; clients poll Get to track progress.
      sig do
        params(
          workspace_id: String,
          data: Cadenya::BulkWorkspaceApplyData::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::BulkWorkspaceApply)
      end
      def apply(
        # Workspace ID.
        workspace_id,
        data:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Cadenya::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
