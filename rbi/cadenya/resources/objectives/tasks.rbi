# typed: strong

module Cadenya
  module Resources
    class Objectives
      class Tasks
        # Retrieves a task by ID from an objective
        sig do
          params(
            id: String,
            workspace_id: String,
            objective_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Objectives::ObjectiveTask)
        end
        def retrieve(
          # Task ID
          id,
          workspace_id:,
          # The ID of the objective. Supports "external_id:" prefix for external IDs.
          objective_id:,
          request_options: {}
        )
        end

        # Lists all tasks for an objective
        sig do
          params(
            objective_id: String,
            workspace_id: String,
            cursor: String,
            limit: Integer,
            sort_order: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[
              Cadenya::Objectives::ObjectiveTask
            ]
          )
        end
        def list(
          # Path param: The ID of the objective. Supports "external_id:" prefix for external
          # IDs.
          objective_id,
          # Path param
          workspace_id:,
          # Query param: Pagination cursor from previous response
          cursor: nil,
          # Query param: Maximum number of results to return
          limit: nil,
          # Query param: Sort order for results
          sort_order: nil,
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
