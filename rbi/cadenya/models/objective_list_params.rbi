# typed: strong

module Cadenya
  module Models
    class ObjectiveListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveListParams, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      # Agent ID for filtering
      sig { returns(T.nilable(String)) }
      attr_reader :agent_id

      sig { params(agent_id: String).void }
      attr_writer :agent_id

      # Filter to objectives produced by a specific AgentSchedule. Accepts canonical
      # as\_… form or external_id:<value> form.
      sig { returns(T.nilable(String)) }
      attr_reader :agent_schedule_id

      sig { params(agent_schedule_id: String).void }
      attr_writer :agent_schedule_id

      # Pagination cursor from previous response
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # When set to true you may use more of your alloted API rate-limit
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_info

      sig { params(include_info: T::Boolean).void }
      attr_writer :include_info

      # Filters by metadata labels. Comma-separated key=value pairs, e.g.
      # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
      # semantics).
      sig { returns(T.nilable(String)) }
      attr_reader :labels

      sig { params(labels: String).void }
      attr_writer :labels

      # Maximum number of results to return
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Optional filters
      sig { returns(T.nilable(String)) }
      attr_reader :parent_objective_id

      sig { params(parent_objective_id: String).void }
      attr_writer :parent_objective_id

      sig { returns(T.nilable(String)) }
      attr_reader :profile_id

      sig { params(profile_id: String).void }
      attr_writer :profile_id

      # Sort order for results (asc or desc by creation time)
      sig { returns(T.nilable(String)) }
      attr_reader :sort_order

      sig { params(sort_order: String).void }
      attr_writer :sort_order

      # Filter by state
      sig { returns(T.nilable(Cadenya::ObjectiveListParams::State::OrSymbol)) }
      attr_reader :state

      sig { params(state: Cadenya::ObjectiveListParams::State::OrSymbol).void }
      attr_writer :state

      # Filter to objectives associated with a subject. Accepts the canonical `subj_…`
      # form or the `external_id:<value>` form; the external_id form is scoped within a
      # tenant and requires `tenant_id` to also be set.
      sig { returns(T.nilable(String)) }
      attr_reader :subject_id

      sig { params(subject_id: String).void }
      attr_writer :subject_id

      # Filter to objectives associated with a tenant. Accepts the canonical `tenant_…`
      # form or the `external_id:<value>` form.
      sig { returns(T.nilable(String)) }
      attr_reader :tenant_id

      sig { params(tenant_id: String).void }
      attr_writer :tenant_id

      # Filter to objectives whose conversation ran through a widget. Accepts the
      # canonical `wgt_…` form or the `external_id:<value>` form.
      sig { returns(T.nilable(String)) }
      attr_reader :widget_id

      sig { params(widget_id: String).void }
      attr_writer :widget_id

      # Filter to objectives created by a specific widget session.
      sig { returns(T.nilable(String)) }
      attr_reader :widget_session_id

      sig { params(widget_session_id: String).void }
      attr_writer :widget_session_id

      sig do
        params(
          workspace_id: String,
          agent_id: String,
          agent_schedule_id: String,
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          parent_objective_id: String,
          profile_id: String,
          sort_order: String,
          state: Cadenya::ObjectiveListParams::State::OrSymbol,
          subject_id: String,
          tenant_id: String,
          widget_id: String,
          widget_session_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        workspace_id: nil,
        # Agent ID for filtering
        agent_id: nil,
        # Filter to objectives produced by a specific AgentSchedule. Accepts canonical
        # as\_… form or external_id:<value> form.
        agent_schedule_id: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # When set to true you may use more of your alloted API rate-limit
        include_info: nil,
        # Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Maximum number of results to return
        limit: nil,
        # Optional filters
        parent_objective_id: nil,
        profile_id: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Filter by state
        state: nil,
        # Filter to objectives associated with a subject. Accepts the canonical `subj_…`
        # form or the `external_id:<value>` form; the external_id form is scoped within a
        # tenant and requires `tenant_id` to also be set.
        subject_id: nil,
        # Filter to objectives associated with a tenant. Accepts the canonical `tenant_…`
        # form or the `external_id:<value>` form.
        tenant_id: nil,
        # Filter to objectives whose conversation ran through a widget. Accepts the
        # canonical `wgt_…` form or the `external_id:<value>` form.
        widget_id: nil,
        # Filter to objectives created by a specific widget session.
        widget_session_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            workspace_id: String,
            agent_id: String,
            agent_schedule_id: String,
            cursor: String,
            include_info: T::Boolean,
            labels: String,
            limit: Integer,
            parent_objective_id: String,
            profile_id: String,
            sort_order: String,
            state: Cadenya::ObjectiveListParams::State::OrSymbol,
            subject_id: String,
            tenant_id: String,
            widget_id: String,
            widget_session_id: String,
            request_options: Cadenya::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by state
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::ObjectiveListParams::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(
            :STATE_UNSPECIFIED,
            Cadenya::ObjectiveListParams::State::TaggedSymbol
          )
        STATE_PENDING =
          T.let(
            :STATE_PENDING,
            Cadenya::ObjectiveListParams::State::TaggedSymbol
          )
        STATE_RUNNING =
          T.let(
            :STATE_RUNNING,
            Cadenya::ObjectiveListParams::State::TaggedSymbol
          )
        STATE_WAITING =
          T.let(
            :STATE_WAITING,
            Cadenya::ObjectiveListParams::State::TaggedSymbol
          )
        STATE_FAILED =
          T.let(
            :STATE_FAILED,
            Cadenya::ObjectiveListParams::State::TaggedSymbol
          )
        STATE_CANCELLED =
          T.let(
            :STATE_CANCELLED,
            Cadenya::ObjectiveListParams::State::TaggedSymbol
          )
        STATE_FINALIZED =
          T.let(
            :STATE_FINALIZED,
            Cadenya::ObjectiveListParams::State::TaggedSymbol
          )
        STATE_TIMED_OUT =
          T.let(
            :STATE_TIMED_OUT,
            Cadenya::ObjectiveListParams::State::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveListParams::State::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
