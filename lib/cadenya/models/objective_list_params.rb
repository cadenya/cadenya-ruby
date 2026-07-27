# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#list
    class ObjectiveListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!attribute agent_id
      #   Agent ID for filtering
      #
      #   @return [String, nil]
      optional :agent_id, String

      # @!attribute agent_schedule_id
      #   Filter to objectives produced by a specific AgentSchedule. Accepts canonical
      #   as\_… form or external_id:<value> form.
      #
      #   @return [String, nil]
      optional :agent_schedule_id, String

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

      # @!attribute parent_objective_id
      #   Optional filters
      #
      #   @return [String, nil]
      optional :parent_objective_id, String

      # @!attribute profile_id
      #
      #   @return [String, nil]
      optional :profile_id, String

      # @!attribute sort_order
      #   Sort order for results (asc or desc by creation time)
      #
      #   @return [String, nil]
      optional :sort_order, String

      # @!attribute state
      #   Filter by state
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveListParams::State, nil]
      optional :state, enum: -> { Cadenya::ObjectiveListParams::State }

      # @!attribute subject_id
      #   Filter to objectives associated with a subject. Accepts the canonical `subj_…`
      #   form or the `external_id:<value>` form; the external_id form is scoped within a
      #   tenant and requires `tenant_id` to also be set.
      #
      #   @return [String, nil]
      optional :subject_id, String

      # @!attribute tenant_id
      #   Filter to objectives associated with a tenant. Accepts the canonical `tenant_…`
      #   form or the `external_id:<value>` form.
      #
      #   @return [String, nil]
      optional :tenant_id, String

      # @!attribute widget_id
      #   Filter to objectives whose conversation ran through a widget. Accepts the
      #   canonical `wgt_…` form or the `external_id:<value>` form.
      #
      #   @return [String, nil]
      optional :widget_id, String

      # @!attribute widget_session_id
      #   Filter to objectives created by a specific widget session.
      #
      #   @return [String, nil]
      optional :widget_session_id, String

      # @!method initialize(workspace_id: nil, agent_id: nil, agent_schedule_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, parent_objective_id: nil, profile_id: nil, sort_order: nil, state: nil, subject_id: nil, tenant_id: nil, widget_id: nil, widget_session_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveListParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param agent_id [String] Agent ID for filtering
      #
      #   @param agent_schedule_id [String] Filter to objectives produced by a specific AgentSchedule. Accepts
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param include_info [Boolean] When set to true you may use more of your alloted API rate-limit
      #
      #   @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param parent_objective_id [String] Optional filters
      #
      #   @param profile_id [String]
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      #   @param state [Symbol, Cadenya::Models::ObjectiveListParams::State] Filter by state
      #
      #   @param subject_id [String] Filter to objectives associated with a subject. Accepts the canonical
      #
      #   @param tenant_id [String] Filter to objectives associated with a tenant. Accepts the canonical
      #
      #   @param widget_id [String] Filter to objectives whose conversation ran through a widget. Accepts
      #
      #   @param widget_session_id [String] Filter to objectives created by a specific widget session.
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      # Filter by state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_PENDING = :STATE_PENDING
        STATE_RUNNING = :STATE_RUNNING
        STATE_WAITING = :STATE_WAITING
        STATE_FAILED = :STATE_FAILED
        STATE_CANCELLED = :STATE_CANCELLED
        STATE_FINALIZED = :STATE_FINALIZED
        STATE_TIMED_OUT = :STATE_TIMED_OUT

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
