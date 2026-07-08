# frozen_string_literal: true

module Cadenya
  module Resources
    class Agents
      # Manage AI agents within a workspace. Agents define AI behavior and tool access.
      class WebhookDeliveries
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::WebhookDeliveryListParams} for more details.
        #
        # Lists all webhook deliveries for an agent
        #
        # @overload list(agent_id, workspace_id:, cursor: nil, event_type: nil, labels: nil, limit: nil, objective_id: nil, request_options: {})
        #
        # @param agent_id [String] Path param
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param cursor [String] Query param: Pagination cursor from previous response
        #
        # @param event_type [Symbol, Cadenya::Models::Agents::WebhookDeliveryListParams::EventType] Query param: Optional filter by event type
        #
        # @param labels [String] Query param: Filters by metadata labels. Comma-separated key=value pairs,
        #
        # @param limit [Integer] Query param: Maximum number of results to return
        #
        # @param objective_id [String] Query param: Optional filter by objective ID
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Agents::WebhookDelivery>]
        #
        # @see Cadenya::Models::Agents::WebhookDeliveryListParams
        def list(agent_id, params)
          parsed, options = Cadenya::Agents::WebhookDeliveryListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/agents/%2$s/webhook_deliveries", workspace_id, agent_id],
            query: query.transform_keys(event_type: "eventType", objective_id: "objectiveId"),
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::Agents::WebhookDelivery,
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
