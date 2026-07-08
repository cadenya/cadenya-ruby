# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#list_events
    class ObjectiveListEventsParams < Cadenya::Internal::Type::BaseModel
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
      #   Maximum number of results to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute since_event_id
      #   Optional string to fetch events since an ID
      #
      #   @return [String, nil]
      optional :since_event_id, String

      # @!attribute sort_order
      #   Sort order for results (asc or desc by creation time)
      #
      #   @return [String, nil]
      optional :sort_order, String

      # @!attribute window_id
      #   Optional context window ID to filter events by
      #
      #   @return [String, nil]
      optional :window_id, String

      # @!method initialize(workspace_id:, objective_id:, cursor: nil, include_info: nil, labels: nil, limit: nil, since_event_id: nil, sort_order: nil, window_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveListEventsParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param objective_id [String]
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param include_info [Boolean] When set to true you may use more of your alloted API rate-limit
      #
      #   @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param since_event_id [String] Optional string to fetch events since an ID
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      #   @param window_id [String] Optional context window ID to filter events by
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
