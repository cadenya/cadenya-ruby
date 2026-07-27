# typed: strong

module Cadenya
  module Resources
    class Objectives
      sig { returns(Cadenya::Resources::Objectives::Tools) }
      attr_reader :tools

      sig { returns(Cadenya::Resources::Objectives::ToolCalls) }
      attr_reader :tool_calls

      sig { returns(Cadenya::Resources::Objectives::Tasks) }
      attr_reader :tasks

      sig { returns(Cadenya::Resources::Objectives::Feedback) }
      attr_reader :feedback

      # Creates a new objective in the workspace
      sig do
        params(
          agent_id: String,
          system_prompt_data: T::Hash[Symbol, T.anything],
          workspace_id: String,
          episodic_memory:
            Cadenya::ObjectiveCreateParams::EpisodicMemory::OrHash,
          first_user_message: String,
          first_user_message_data: T::Hash[Symbol, T.anything],
          memory_cascade: T::Array[Cadenya::MemoryReference::OrHash],
          metadata: Cadenya::CreateOperationMetadata::OrHash,
          pinned_parameters: T::Hash[Symbol, String],
          secrets: T::Array[Cadenya::ObjectiveCreateParams::Secret::OrHash],
          subject: Cadenya::SubjectAssertion::OrHash,
          tenant: Cadenya::TenantAssertion::OrHash,
          variation_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Objective)
      end
      def create(
        # Body param
        agent_id:,
        # Body param: Arbitrary data rendered into the selected variation's
        # system_prompt_template (liquid) to produce the objective's system prompt. If the
        # agent has a system_prompt_data_schema, this must satisfy it.
        system_prompt_data:,
        # Path param
        workspace_id: nil,
        # Body param: Episodic is used to configure the episodic memory for the objective
        episodic_memory: nil,
        # Body param: Optional explicit first user message for the LLM chat history. When
        # not set, the selected variation's first_user_message_template is rendered with
        # first_user_message_data instead. If neither this field nor a
        # first_user_message_template is present, the request is rejected with
        # InvalidArgument.
        first_user_message: nil,
        # Body param: Arbitrary data rendered into the selected variation's
        # first_user_message_template (liquid) to produce the first user message. Separate
        # from `system_prompt_data`, which renders the system prompt template.
        first_user_message_data: nil,
        # Body param: Memory layers/entries layered over the baseline cascade inherited
        # from the selected variation — element-level rules over inherited styles, in CSS
        # terms.
        #
        # Array order is resolution order: EARLIER elements are more specific and are
        # consulted first. Entries pinned via memory_entry_id behave as single-entry
        # layers at their position.
        #
        # System-managed layers (e.g., episodic) cannot be referenced here; they attach
        # themselves automatically based on the episodic key.
        #
        # Size cap: the TOTAL effective cascade (this field + the variation's memory layer
        # assignments) must not exceed 10 entries. A request that would produce a larger
        # cascade is rejected with InvalidArgument.
        memory_cascade: nil,
        # Body param: CreateOperationMetadata contains the user-provided fields for
        # creating an operation. Read-only fields (id, account_id, workspace_id,
        # created_at, profile_id) are excluded since they are set by the server.
        metadata: nil,
        # Body param: Parameters forced onto this objective's tool calls. A pinned
        # parameter is an overlay on a tool's JSON schema: the parameter is removed from
        # what the LLM sees, and its value is always overwritten server-side with the
        # pinned value — the model cannot choose a different value for it.
        pinned_parameters: nil,
        # Body param: Secrets that can be used in the headers for tool calls using the
        # secret interpolation format.
        secrets: nil,
        # Body param: SubjectAssertion identifies a person within a tenant in the
        # customer's own namespace — typically their user id. Asserting a subject upserts
        # the subject record under the asserted tenant and associates the created resource
        # with it. A subject assertion is only valid alongside a tenant assertion: subject
        # identifiers are scoped to their tenant.
        subject: nil,
        # Body param: TenantAssertion identifies a tenant in the customer's own namespace
        # — their org, company, or team identifier for an end user. Asserting a tenant
        # upserts the tenant record in the workspace (keyed on `id` as the tenant's
        # external_id) and associates the created resource with it.
        tenant: nil,
        # Body param: Optional explicit variation selection. Overrides the agent's
        # variation_selection_mode.
        variation_id: nil,
        request_options: {}
      )
      end

      # Retrieves an objective by ID from the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Objective)
      end
      def retrieve(id, workspace_id: nil, request_options: {})
      end

      # Lists all objectives in the workspace
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
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::Objective])
      end
      def list(
        # Path param
        workspace_id: nil,
        # Query param: Agent ID for filtering
        agent_id: nil,
        # Query param: Filter to objectives produced by a specific AgentSchedule. Accepts
        # canonical as\_… form or external_id:<value> form.
        agent_schedule_id: nil,
        # Query param: Pagination cursor from previous response
        cursor: nil,
        # Query param: When set to true you may use more of your alloted API rate-limit
        include_info: nil,
        # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Query param: Maximum number of results to return
        limit: nil,
        # Query param: Optional filters
        parent_objective_id: nil,
        # Query param
        profile_id: nil,
        # Query param: Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Query param: Filter by state
        state: nil,
        # Query param: Filter to objectives associated with a subject. Accepts the
        # canonical `subj_…` form or the `external_id:<value>` form; the external_id form
        # is scoped within a tenant and requires `tenant_id` to also be set.
        subject_id: nil,
        # Query param: Filter to objectives associated with a tenant. Accepts the
        # canonical `tenant_…` form or the `external_id:<value>` form.
        tenant_id: nil,
        request_options: {}
      )
      end

      # Cancels a running or pending objective. The objective's state will be set to
      # STATE_CANCELLED.
      sig do
        params(
          objective_id: String,
          workspace_id: String,
          reason: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Objective)
      end
      def cancel(
        # Path param: The ID of the objective. Supports "external_id:" prefix for external
        # IDs.
        objective_id,
        # Path param
        workspace_id: nil,
        # Body param: Optional reason for cancellation
        reason: nil,
        request_options: {}
      )
      end

      # Triggers compaction on a running objective. Optionally override the variation's
      # compaction config.
      sig do
        params(
          objective_id: String,
          workspace_id: String,
          compaction_config:
            Cadenya::Agents::AgentVariationSpecCompactionConfig::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Models::ObjectiveCompactResponse)
      end
      def compact(
        # Path param: The ID of the objective. Supports "external_id:" prefix for external
        # IDs.
        objective_id,
        # Path param
        workspace_id: nil,
        # Body param: CompactionConfig defines how context window compaction behaves for
        # objectives using this variation.
        compaction_config: nil,
        request_options: {}
      )
      end

      # Continues an objective that has completed
      sig do
        params(
          objective_id: String,
          message: String,
          workspace_id: String,
          enqueue: T::Boolean,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::ObjectiveEvent)
      end
      def continue(
        # Path param: The ID of the objective. If you have assigned an external ID to the
        # objective, you can prefix the ID with "external_id:". For example,
        # "external_id:1234567890". Otherwise, the ID assigned by Cadenya should be used.
        objective_id,
        # Body param: The message to continue an objective that has completed (or you are
        # enqueing)
        message:,
        # Path param
        workspace_id: nil,
        # Body param: When set to true, the message will be enqueued for when the agent
        # loop is available to process it.
        enqueue: nil,
        request_options: {}
      )
      end

      # Read-only list of the last five windows of execution for this objective, ordered
      # by most recent first
      sig do
        params(
          objective_id: String,
          workspace_id: String,
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(
          Cadenya::Internal::CursorPagination[Cadenya::ObjectiveContextWindow]
        )
      end
      def list_context_windows(
        # Path param: The objective ID to return windows for
        objective_id,
        # Path param
        workspace_id: nil,
        # Query param: Pagination cursor from previous response
        cursor: nil,
        # Query param: When set to true you may use more of your alloted API rate-limit
        include_info: nil,
        # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Query param: Maximum number of results to return
        limit: nil,
        request_options: {}
      )
      end

      # Lists all events for an objective
      sig do
        params(
          objective_id: String,
          workspace_id: String,
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          since_event_id: String,
          sort_order: String,
          window_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::ObjectiveEvent])
      end
      def list_events(
        # Path param: Objective ID for filtering
        objective_id,
        # Path param
        workspace_id: nil,
        # Query param: Pagination cursor from previous response
        cursor: nil,
        # Query param: When set to true you may use more of your alloted API rate-limit
        include_info: nil,
        # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Query param: Maximum number of results to return
        limit: nil,
        # Query param: Optional string to fetch events since an ID
        since_event_id: nil,
        # Query param: Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Query param: Optional context window ID to filter events by
        window_id: nil,
        request_options: {}
      )
      end

      # Returns the context-usage breakdown measured for the objective's most recent
      # iteration: character lengths per context component (system prompt, memory
      # appendices, tool definitions, messages by role) alongside the iteration's input
      # token counts.
      sig do
        params(
          objective_id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Models::ObjectiveRetrieveDiagnosticsResponse)
      end
      def retrieve_diagnostics(
        # The ID of the objective. Supports "external_id:" prefix for external IDs.
        objective_id,
        workspace_id: nil,
        request_options: {}
      )
      end

      # Streams events for an objective in real-time using server-sent events (SSE)
      sig do
        params(
          objective_id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::Stream[Cadenya::ObjectiveEvent])
      end
      def stream_events_streaming(
        objective_id,
        workspace_id: nil,
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
