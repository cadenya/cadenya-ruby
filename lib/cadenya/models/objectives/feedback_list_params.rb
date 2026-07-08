# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # @see Cadenya::Resources::Objectives::Feedback#list
      class FeedbackListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute objective_id
        #
        #   @return [String]
        required :objective_id, String

        # @!attribute cursor
        #   Pagination cursor from previous response
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute labels
        #   Filters by metadata labels. Comma-separated key=value pairs, e.g.
        #   "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        #   semantics).
        #
        #   @return [String, nil]
        optional :labels, String

        # @!attribute limit
        #   Maximum number of results to return
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!method initialize(workspace_id:, objective_id:, cursor: nil, labels: nil, limit: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::FeedbackListParams} for more details.
        #
        #   @param workspace_id [String]
        #
        #   @param objective_id [String]
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
        #
        #   @param limit [Integer] Maximum number of results to return
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
