# typed: strong

module Cadenya
  module Resources
    class Objectives
      class Tools
        # Lists all tools that were assigned to an objective
        sig do
          params(
            objective_id: String,
            workspace_id: String,
            cursor: String,
            limit: Integer,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[
              Cadenya::Objectives::ObjectiveTool
            ]
          )
        end
        def list(
          # Path param: The ID of the objective. Supports "external_id:" prefix for external
          # IDs.
          objective_id,
          # Path param
          workspace_id: nil,
          # Query param: Pagination cursor from previous response
          cursor: nil,
          # Query param: Maximum number of results to return
          limit: nil,
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
