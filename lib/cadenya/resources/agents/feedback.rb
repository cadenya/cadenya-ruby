# frozen_string_literal: true

module Cadenya
  module Resources
    class Agents
      # Manage AI agents within a workspace. Agents define AI behavior and tool access.
      class Feedback
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::FeedbackListParams} for more details.
        #
        # Lists feedback submitted across all objectives belonging to an agent. Supports
        # search by comment, sentiment filter, agent variation filter, and creation date
        # range. Results are ordered by creation time, newest first.
        #
        # @overload list(agent_id, workspace_id:, agent_variation_id: nil, created_after: nil, created_before: nil, cursor: nil, include_info: nil, limit: nil, query: nil, sentiment: nil, request_options: {})
        #
        # @param agent_id [String] Path param: The ID of the agent. Supports "external_id:" prefix for external IDs
        #
        # @param workspace_id [String] Path param
        #
        # @param agent_variation_id [String] Query param: Optional filter to limit results to feedback on objectives run by a
        #
        # @param created_after [Time] Query param: Inclusive lower bound on feedback creation time.
        #
        # @param created_before [Time] Query param: Exclusive upper bound on feedback creation time.
        #
        # @param cursor [String] Query param: Pagination cursor from previous response.
        #
        # @param include_info [Boolean] Query param: When set to true you may use more of your alloted API rate-limit
        #
        # @param limit [Integer] Query param: Maximum number of results to return.
        #
        # @param query [String] Query param: Free-text search applied to the feedback comment. Case-insensitive
        #
        # @param sentiment [Symbol, Cadenya::Models::Agents::FeedbackListParams::Sentiment] Query param: Filter by sentiment. UNSPECIFIED returns feedback regardless of sco
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Objectives::ObjectiveFeedback>]
        #
        # @see Cadenya::Models::Agents::FeedbackListParams
        def list(agent_id, params)
          parsed, options = Cadenya::Agents::FeedbackListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/agents/%2$s/feedback", workspace_id, agent_id],
            query: query.transform_keys(
              agent_variation_id: "agentVariationId",
              created_after: "createdAfter",
              created_before: "createdBefore",
              include_info: "includeInfo"
            ),
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::Objectives::ObjectiveFeedback,
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
