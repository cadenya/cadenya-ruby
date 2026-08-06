# frozen_string_literal: true

module Cadenya
  module Resources
    class Objectives
      # @return [Cadenya::Resources::Objectives::Tools]
      attr_reader :tools

      # @return [Cadenya::Resources::Objectives::ToolCalls]
      attr_reader :tool_calls

      # @return [Cadenya::Resources::Objectives::Tasks]
      attr_reader :tasks

      # @return [Cadenya::Resources::Objectives::Feedback]
      attr_reader :feedback

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ObjectiveCreateParams} for more details.
      #
      # Creates a new objective in the workspace
      #
      # @overload create(agent_id:, system_prompt_data:, workspace_id: nil, episodic_memory: nil, first_user_message: nil, first_user_message_data: nil, memory_cascade: nil, metadata: nil, pinned_parameters: nil, secrets: nil, subject: nil, tenant: nil, variation_id: nil, request_options: {})
      #
      # @param agent_id [String] Body param
      #
      # @param system_prompt_data [Hash{Symbol=>Object}] Body param: Arbitrary data rendered into the selected variation's system*prompt*
      #
      # @param workspace_id [String] Path param
      #
      # @param episodic_memory [Cadenya::Models::ObjectiveCreateParams::EpisodicMemory] Body param: Episodic is used to configure the episodic memory for the objective
      #
      # @param first_user_message [String] Body param: Optional explicit first user message for the LLM chat history. When
      #
      # @param first_user_message_data [Hash{Symbol=>Object}] Body param: Arbitrary data rendered into the selected variation's first_user_mes
      #
      # @param memory_cascade [Array<Cadenya::Models::MemoryReference>] Body param: Memory layers/entries layered over the baseline cascade inherited
      #
      # @param metadata [Cadenya::Models::CreateOperationMetadata] Body param: CreateOperationMetadata contains the user-provided fields for creati
      #
      # @param pinned_parameters [Hash{Symbol=>String}] Body param: Parameters forced onto this objective's tool calls. A pinned paramet
      #
      # @param secrets [Array<Cadenya::Models::ObjectiveCreateParams::Secret>] Body param: Secrets that can be used in the headers for tool calls using the sec
      #
      # @param subject [Cadenya::Models::SubjectAssertion] Body param: SubjectAssertion identifies a person within a tenant in the customer
      #
      # @param tenant [Cadenya::Models::TenantAssertion] Body param: TenantAssertion identifies a tenant in the customer's own namespace
      #
      # @param variation_id [String] Body param: Optional explicit variation selection. Overrides the agent's variati
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Objective]
      #
      # @see Cadenya::Models::ObjectiveCreateParams
      def create(params)
        parsed, options = Cadenya::ObjectiveCreateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/objectives", workspace_id],
          body: parsed,
          model: Cadenya::Objective,
          options: options
        )
      end

      # Retrieves an objective by ID from the workspace
      #
      # @overload retrieve(id, workspace_id: nil, request_options: {})
      #
      # @param id [String]
      # @param workspace_id [String]
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Objective]
      #
      # @see Cadenya::Models::ObjectiveRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Cadenya::ObjectiveRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/objectives/%2$s", workspace_id, id],
          model: Cadenya::Objective,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ObjectiveListParams} for more details.
      #
      # Lists all objectives in the workspace
      #
      # @overload list(workspace_id: nil, agent_id: nil, agent_schedule_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, parent_objective_id: nil, profile_id: nil, sort_order: nil, state: nil, subject_id: nil, tenant_id: nil, widget_id: nil, widget_session_id: nil, request_options: {})
      #
      # @param workspace_id [String] Path param
      #
      # @param agent_id [String] Query param: Agent ID for filtering
      #
      # @param agent_schedule_id [String] Query param: Filter to objectives produced by a specific AgentSchedule. Accepts
      #
      # @param cursor [String] Query param: Pagination cursor from previous response
      #
      # @param include_info [Boolean] Query param: When set to true you may use more of your alloted API rate-limit
      #
      # @param labels [String] Query param: Filters by metadata labels. Comma-separated key=value pairs,
      #
      # @param limit [Integer] Query param: Maximum number of results to return
      #
      # @param parent_objective_id [String] Query param: Optional filters
      #
      # @param profile_id [String] Query param
      #
      # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time)
      #
      # @param state [Symbol, Cadenya::Models::ObjectiveListParams::State] Query param: Filter by state
      #
      # @param subject_id [String] Query param: Filter to objectives associated with a subject. Accepts the canonic
      #
      # @param tenant_id [String] Query param: Filter to objectives associated with a tenant. Accepts the canonica
      #
      # @param widget_id [String] Query param: Filter to objectives whose conversation ran through a widget. Accep
      #
      # @param widget_session_id [String] Query param: Filter to objectives created by a specific widget session.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Objective>]
      #
      # @see Cadenya::Models::ObjectiveListParams
      def list(params = {})
        parsed, options = Cadenya::ObjectiveListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/objectives", workspace_id],
          query: query.transform_keys(
            agent_id: "agentId",
            agent_schedule_id: "agentScheduleId",
            include_info: "includeInfo",
            parent_objective_id: "parentObjectiveId",
            profile_id: "profileId",
            sort_order: "sortOrder",
            subject_id: "subjectId",
            tenant_id: "tenantId",
            widget_id: "widgetId",
            widget_session_id: "widgetSessionId"
          ),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::Objective,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ObjectiveCancelParams} for more details.
      #
      # Cancels a running or pending objective. The objective's state will be set to
      # STATE_CANCELLED.
      #
      # @overload cancel(objective_id, workspace_id: nil, reason: nil, request_options: {})
      #
      # @param objective_id [String] Path param: The ID of the objective. Supports "external_id:" prefix for external
      #
      # @param workspace_id [String] Path param
      #
      # @param reason [String] Body param: Optional reason for cancellation
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Objective]
      #
      # @see Cadenya::Models::ObjectiveCancelParams
      def cancel(objective_id, params = {})
        parsed, options = Cadenya::ObjectiveCancelParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/objectives/%2$s:cancel", workspace_id, objective_id],
          body: parsed,
          model: Cadenya::Objective,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ObjectiveCompactParams} for more details.
      #
      # Triggers compaction on a running objective. Optionally override the variation's
      # compaction config.
      #
      # @overload compact(objective_id, workspace_id: nil, compaction_config: nil, request_options: {})
      #
      # @param objective_id [String] Path param: The ID of the objective. Supports "external_id:" prefix for external
      #
      # @param workspace_id [String] Path param
      #
      # @param compaction_config [Cadenya::Models::Agents::AgentVariationSpecCompactionConfig] Body param: CompactionConfig defines how context window compaction behaves for o
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::ObjectiveCompactResponse]
      #
      # @see Cadenya::Models::ObjectiveCompactParams
      def compact(objective_id, params = {})
        parsed, options = Cadenya::ObjectiveCompactParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/objectives/%2$s:compact", workspace_id, objective_id],
          body: parsed,
          model: Cadenya::Models::ObjectiveCompactResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ObjectiveContinueParams} for more details.
      #
      # Continues an objective that has completed
      #
      # @overload continue(objective_id, message:, workspace_id: nil, enqueue: nil, request_options: {})
      #
      # @param objective_id [String] Path param: The ID of the objective. If you have assigned an external ID to the
      #
      # @param message [String] Body param: The message to continue an objective that has completed (or you are
      #
      # @param workspace_id [String] Path param
      #
      # @param enqueue [Boolean] Body param: When set to true, the message will be enqueued for when the agent lo
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::ObjectiveEvent]
      #
      # @see Cadenya::Models::ObjectiveContinueParams
      def continue(objective_id, params)
        parsed, options = Cadenya::ObjectiveContinueParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/objectives/%2$s:continue", workspace_id, objective_id],
          body: parsed,
          model: Cadenya::ObjectiveEvent,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ObjectiveListContextWindowsParams} for more details.
      #
      # Read-only list of the last five windows of execution for this objective, ordered
      # by most recent first
      #
      # @overload list_context_windows(objective_id, workspace_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, request_options: {})
      #
      # @param objective_id [String] Path param: The objective ID to return windows for
      #
      # @param workspace_id [String] Path param
      #
      # @param cursor [String] Query param: Pagination cursor from previous response
      #
      # @param include_info [Boolean] Query param: When set to true you may use more of your alloted API rate-limit
      #
      # @param labels [String] Query param: Filters by metadata labels. Comma-separated key=value pairs,
      #
      # @param limit [Integer] Query param: Maximum number of results to return
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::ObjectiveContextWindow>]
      #
      # @see Cadenya::Models::ObjectiveListContextWindowsParams
      def list_context_windows(objective_id, params = {})
        parsed, options = Cadenya::ObjectiveListContextWindowsParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/objectives/%2$s/context_windows", workspace_id, objective_id],
          query: query.transform_keys(include_info: "includeInfo"),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::ObjectiveContextWindow,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::ObjectiveListEventsParams} for more details.
      #
      # Lists all events for an objective
      #
      # @overload list_events(objective_id, workspace_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, since_event_id: nil, sort_order: nil, window_id: nil, request_options: {})
      #
      # @param objective_id [String] Path param: Objective ID for filtering
      #
      # @param workspace_id [String] Path param
      #
      # @param cursor [String] Query param: Pagination cursor from previous response
      #
      # @param include_info [Boolean] Query param: When set to true you may use more of your alloted API rate-limit
      #
      # @param labels [String] Query param: Filters by metadata labels. Comma-separated key=value pairs,
      #
      # @param limit [Integer] Query param: Maximum number of results to return
      #
      # @param since_event_id [String] Query param: Optional string to fetch events since an ID
      #
      # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time)
      #
      # @param window_id [String] Query param: Optional context window ID to filter events by
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::ObjectiveEvent>]
      #
      # @see Cadenya::Models::ObjectiveListEventsParams
      def list_events(objective_id, params = {})
        parsed, options = Cadenya::ObjectiveListEventsParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/objectives/%2$s/events", workspace_id, objective_id],
          query: query.transform_keys(
            include_info: "includeInfo",
            since_event_id: "sinceEventId",
            sort_order: "sortOrder",
            window_id: "windowId"
          ),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::ObjectiveEvent,
          options: options
        )
      end

      # Returns the context-usage breakdown measured for the objective's most recent
      # iteration: character lengths per context component (system prompt, memory
      # appendices, tool definitions, messages by role) alongside the iteration's input
      # token counts.
      #
      # @overload retrieve_diagnostics(objective_id, workspace_id: nil, request_options: {})
      #
      # @param objective_id [String] The ID of the objective. Supports "external_id:" prefix for external IDs.
      #
      # @param workspace_id [String]
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::ObjectiveRetrieveDiagnosticsResponse]
      #
      # @see Cadenya::Models::ObjectiveRetrieveDiagnosticsParams
      def retrieve_diagnostics(objective_id, params = {})
        parsed, options = Cadenya::ObjectiveRetrieveDiagnosticsParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/objectives/%2$s/diagnostics", workspace_id, objective_id],
          model: Cadenya::Models::ObjectiveRetrieveDiagnosticsResponse,
          options: options
        )
      end

      # Streams events for an objective in real-time using server-sent events (SSE)
      #
      # @overload stream_events_streaming(objective_id, workspace_id: nil, request_options: {})
      #
      # @param objective_id [String]
      # @param workspace_id [String]
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::Stream<Cadenya::Models::ObjectiveEvent>]
      #
      # @see Cadenya::Models::ObjectiveStreamEventsParams
      def stream_events_streaming(objective_id, params = {})
        parsed, options = Cadenya::ObjectiveStreamEventsParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            @client.workspace_id
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/objectives/%2$s/events:stream", workspace_id, objective_id],
          headers: {"accept" => "text/event-stream", "accept-encoding" => "identity"},
          stream: Cadenya::Internal::Stream,
          model: Cadenya::ObjectiveEvent,
          options: options
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
        @tools = Cadenya::Resources::Objectives::Tools.new(client: client)
        @tool_calls = Cadenya::Resources::Objectives::ToolCalls.new(client: client)
        @tasks = Cadenya::Resources::Objectives::Tasks.new(client: client)
        @feedback = Cadenya::Resources::Objectives::Feedback.new(client: client)
      end
    end
  end
end
