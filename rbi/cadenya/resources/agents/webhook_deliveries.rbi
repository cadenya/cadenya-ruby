# typed: strong

module Cadenya
  module Resources
    class Agents
      # Manage AI agents within a workspace. Agents define AI behavior and tool access.
      class WebhookDeliveries
        # Lists all webhook deliveries for an agent
        sig do
          params(
            agent_id: String,
            workspace_id: String,
            cursor: String,
            event_type:
              Cadenya::Agents::WebhookDeliveryListParams::EventType::OrSymbol,
            labels: String,
            limit: Integer,
            objective_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[
              Cadenya::Agents::WebhookDelivery
            ]
          )
        end
        def list(
          # Path param
          agent_id,
          # Path param: Workspace ID.
          workspace_id: nil,
          # Query param: Pagination cursor from previous response
          cursor: nil,
          # Query param: Optional filter by event type
          event_type: nil,
          # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
          # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
          # semantics).
          labels: nil,
          # Query param: Maximum number of results to return
          limit: nil,
          # Query param: Optional filter by objective ID
          objective_id: nil,
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
