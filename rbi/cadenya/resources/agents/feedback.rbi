# typed: strong

module Cadenya
  module Resources
    class Agents
      # Manage AI agents within a workspace. Agents define AI behavior and tool access.
      class Feedback
        # Lists feedback submitted across all objectives belonging to an agent. Supports
        # search by comment, sentiment filter, agent variation filter, and creation date
        # range. Results are ordered by creation time, newest first.
        sig do
          params(
            agent_id: String,
            workspace_id: String,
            agent_variation_id: String,
            created_after: Time,
            created_before: Time,
            cursor: String,
            include_info: T::Boolean,
            labels: String,
            limit: Integer,
            query: String,
            sentiment: Cadenya::Agents::FeedbackListParams::Sentiment::OrSymbol,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[
              Cadenya::Objectives::ObjectiveFeedback
            ]
          )
        end
        def list(
          # Path param: The ID of the agent. Supports "external_id:" prefix for external
          # IDs.
          agent_id,
          # Path param
          workspace_id:,
          # Query param: Optional filter to limit results to feedback on objectives run by a
          # single agent variation. Supports "external_id:" prefix for external IDs.
          agent_variation_id: nil,
          # Query param: Inclusive lower bound on feedback creation time.
          created_after: nil,
          # Query param: Exclusive upper bound on feedback creation time.
          created_before: nil,
          # Query param: Pagination cursor from previous response.
          cursor: nil,
          # Query param: When set to true you may use more of your alloted API rate-limit
          include_info: nil,
          # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
          # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
          # semantics).
          labels: nil,
          # Query param: Maximum number of results to return.
          limit: nil,
          # Query param: Free-text search applied to the feedback comment. Case-insensitive
          # substring match.
          query: nil,
          # Query param: Filter by sentiment. UNSPECIFIED returns feedback regardless of
          # score.
          sentiment: nil,
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
