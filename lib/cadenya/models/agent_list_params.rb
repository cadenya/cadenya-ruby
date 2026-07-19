# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Agents#list
    class AgentListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!attribute cursor
      #   Pagination cursor from previous response
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute include_info
      #   When true, the `info` field on each returned agent is populated. Requests with
      #   this flag count more against your rate limit.
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

      # @!attribute prefix
      #   Filter expression (query param: prefix)
      #
      #   @return [String, nil]
      optional :prefix, String

      # @!attribute query
      #   Free-form search query
      #
      #   @return [String, nil]
      optional :query, String

      # @!attribute sort_order
      #   Sort order for results (asc or desc by creation time)
      #
      #   @return [String, nil]
      optional :sort_order, String

      # @!attribute state
      #   Filter by agent lifecycle state
      #
      #   @return [Symbol, Cadenya::Models::AgentListParams::State, nil]
      optional :state, enum: -> { Cadenya::AgentListParams::State }

      # @!attribute variation_selection_mode
      #   Filter by variation selection mode
      #
      #   @return [Symbol, Cadenya::Models::AgentListParams::VariationSelectionMode, nil]
      optional :variation_selection_mode, enum: -> { Cadenya::AgentListParams::VariationSelectionMode }

      # @!method initialize(workspace_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, state: nil, variation_selection_mode: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AgentListParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param include_info [Boolean] When true, the `info` field on each returned agent is populated. Requests
      #
      #   @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param prefix [String] Filter expression (query param: prefix)
      #
      #   @param query [String] Free-form search query
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      #   @param state [Symbol, Cadenya::Models::AgentListParams::State] Filter by agent lifecycle state
      #
      #   @param variation_selection_mode [Symbol, Cadenya::Models::AgentListParams::VariationSelectionMode] Filter by variation selection mode
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      # Filter by agent lifecycle state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_DRAFT = :STATE_DRAFT
        STATE_PUBLISHED = :STATE_PUBLISHED
        STATE_ARCHIVED = :STATE_ARCHIVED

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Filter by variation selection mode
      module VariationSelectionMode
        extend Cadenya::Internal::Type::Enum

        VARIATION_SELECTION_MODE_UNSPECIFIED = :VARIATION_SELECTION_MODE_UNSPECIFIED
        VARIATION_SELECTION_MODE_RANDOM = :VARIATION_SELECTION_MODE_RANDOM
        VARIATION_SELECTION_MODE_WEIGHTED = :VARIATION_SELECTION_MODE_WEIGHTED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
