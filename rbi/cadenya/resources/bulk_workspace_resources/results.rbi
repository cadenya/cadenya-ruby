# typed: strong

module Cadenya
  module Resources
    class BulkWorkspaceResources
      # Apply a declarative bundle of workspace resources — tool sets, memory layers,
      # agents, variations, assignments, and schedules — in a single asynchronous
      # operation.
      class Results
        # Lists each resource action recorded by a bulk workspace apply operation.
        sig do
          params(
            bulk_workspace_apply_id: String,
            workspace_id: String,
            action:
              Cadenya::BulkWorkspaceResources::ResultListParams::Action::OrSymbol,
            cursor: String,
            limit: Integer,
            sort_order: String,
            type: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResult
            ]
          )
        end
        def list(
          # Path param: Apply ID in canonical apply\_… form.
          bulk_workspace_apply_id,
          # Path param: Workspace ID.
          workspace_id:,
          # Query param: Filter by action.
          action: nil,
          # Query param: Pagination cursor from previous response
          cursor: nil,
          # Query param: Maximum number of results to return
          limit: nil,
          # Query param: Sort order for results (asc or desc by creation time)
          sort_order: nil,
          # Query param: Filter by data.type discriminator (e.g., "toolSet", "memoryEntry").
          type: nil,
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
end
