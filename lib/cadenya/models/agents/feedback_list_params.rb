# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::Feedback#list
      class FeedbackListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

        # @!attribute agent_variation_id
        #   Optional filter to limit results to feedback on objectives run by a single agent
        #   variation. Supports "external_id:" prefix for external IDs.
        #
        #   @return [String, nil]
        optional :agent_variation_id, String

        # @!attribute created_after
        #   Inclusive lower bound on feedback creation time.
        #
        #   @return [Time, nil]
        optional :created_after, Time

        # @!attribute created_before
        #   Exclusive upper bound on feedback creation time.
        #
        #   @return [Time, nil]
        optional :created_before, Time

        # @!attribute cursor
        #   Pagination cursor from previous response.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute include_info
        #   When set to true you may use more of your alloted API rate-limit
        #
        #   @return [Boolean, nil]
        optional :include_info, Cadenya::Internal::Type::Boolean

        # @!attribute labels
        #   Filters by metadata labels. Comma-separated key=value pairs, e.g.
        #   "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        #   semantics).
        #
        #   @return [String, nil]
        optional :labels, String

        # @!attribute limit
        #   Maximum number of results to return.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute query
        #   Free-text search applied to the feedback comment. Case-insensitive substring
        #   match.
        #
        #   @return [String, nil]
        optional :query, String

        # @!attribute sentiment
        #   Filter by sentiment. UNSPECIFIED returns feedback regardless of score.
        #
        #   @return [Symbol, Cadenya::Models::Agents::FeedbackListParams::Sentiment, nil]
        optional :sentiment, enum: -> { Cadenya::Agents::FeedbackListParams::Sentiment }

        # @!method initialize(agent_id:, workspace_id: nil, agent_variation_id: nil, created_after: nil, created_before: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, query: nil, sentiment: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::FeedbackListParams} for more details.
        #
        #   @param agent_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param agent_variation_id [String] Optional filter to limit results to feedback on objectives run by a single
        #
        #   @param created_after [Time] Inclusive lower bound on feedback creation time.
        #
        #   @param created_before [Time] Exclusive upper bound on feedback creation time.
        #
        #   @param cursor [String] Pagination cursor from previous response.
        #
        #   @param include_info [Boolean] When set to true you may use more of your alloted API rate-limit
        #
        #   @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
        #
        #   @param limit [Integer] Maximum number of results to return.
        #
        #   @param query [String] Free-text search applied to the feedback comment. Case-insensitive substring mat
        #
        #   @param sentiment [Symbol, Cadenya::Models::Agents::FeedbackListParams::Sentiment] Filter by sentiment. UNSPECIFIED returns feedback regardless of score.
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

        # Filter by sentiment. UNSPECIFIED returns feedback regardless of score.
        module Sentiment
          extend Cadenya::Internal::Type::Enum

          FEEDBACK_SENTIMENT_UNSPECIFIED = :FEEDBACK_SENTIMENT_UNSPECIFIED
          FEEDBACK_SENTIMENT_POSITIVE = :FEEDBACK_SENTIMENT_POSITIVE
          FEEDBACK_SENTIMENT_NEGATIVE = :FEEDBACK_SENTIMENT_NEGATIVE

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
