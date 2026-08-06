# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::WidgetSessions#list
    class WidgetSessionListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!attribute cursor
      #   Pagination cursor from previous response.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute include_info
      #   When true, the `info` field on each returned session is populated. Requests with
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
      #   Maximum number of results to return.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute sort_order
      #   Sort order for results (asc or desc by creation time).
      #
      #   @return [String, nil]
      optional :sort_order, String

      # @!attribute state
      #   Filter by state.
      #
      #   @return [Symbol, Cadenya::Models::WidgetSessionListParams::State, nil]
      optional :state, enum: -> { Cadenya::WidgetSessionListParams::State }

      # @!attribute subject_id
      #   Filter to sessions asserted for a subject. Accepts the canonical `subj_…` form
      #   or the `external_id:<value>` form; the external_id form is scoped within a
      #   tenant and requires `tenant_id` to also be set.
      #
      #   @return [String, nil]
      optional :subject_id, String

      # @!attribute tenant_id
      #   Filter to sessions belonging to a tenant. Accepts the canonical `tenant_…` form
      #   or the `external_id:<value>` form.
      #
      #   @return [String, nil]
      optional :tenant_id, String

      # @!attribute widget_id
      #   Filter to sessions on a specific widget. Accepts the canonical `wgt_…` form or
      #   the `external_id:<value>` form.
      #
      #   @return [String, nil]
      optional :widget_id, String

      # @!method initialize(workspace_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, sort_order: nil, state: nil, subject_id: nil, tenant_id: nil, widget_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::WidgetSessionListParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param cursor [String] Pagination cursor from previous response.
      #
      #   @param include_info [Boolean] When true, the `info` field on each returned session is populated.
      #
      #   @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
      #
      #   @param limit [Integer] Maximum number of results to return.
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time).
      #
      #   @param state [Symbol, Cadenya::Models::WidgetSessionListParams::State] Filter by state.
      #
      #   @param subject_id [String] Filter to sessions asserted for a subject. Accepts the canonical
      #
      #   @param tenant_id [String] Filter to sessions belonging to a tenant. Accepts the canonical
      #
      #   @param widget_id [String] Filter to sessions on a specific widget. Accepts the canonical `wgt_…`
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      # Filter by state.
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_ACTIVE = :STATE_ACTIVE
        STATE_EXPIRED = :STATE_EXPIRED
        STATE_REVOKED = :STATE_REVOKED
        STATE_EXHAUSTED = :STATE_EXHAUSTED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
