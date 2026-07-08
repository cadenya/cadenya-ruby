# typed: strong

module Cadenya
  module Resources
    class Objectives
      class Feedback
        # Submits feedback for an objective's execution. Feedback scores are used by the
        # agent variation scoring system to evaluate and rank variation performance.
        sig do
          params(
            objective_id: String,
            workspace_id: String,
            data: Cadenya::Objectives::ObjectiveFeedbackData::OrHash,
            metadata: Cadenya::CreateOperationMetadata::OrHash,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Objectives::ObjectiveFeedback)
        end
        def create(
          # Path param: The ID of the objective. Supports "external_id:" prefix for external
          # IDs.
          objective_id,
          # Path param
          workspace_id:,
          # Body param
          data:,
          # Body param: CreateOperationMetadata contains the user-provided fields for
          # creating an operation. Read-only fields (id, account_id, workspace_id,
          # created_at, profile_id) are excluded since they are set by the server.
          metadata:,
          request_options: {}
        )
        end

        # Lists all feedback submitted for an objective
        sig do
          params(
            objective_id: String,
            workspace_id: String,
            cursor: String,
            labels: String,
            limit: Integer,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[
              Cadenya::Objectives::ObjectiveFeedback
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
          # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
          # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
          # semantics).
          labels: nil,
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
