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
      # @overload create(workspace_id, agent_id:, data:, episodic_memory: nil, initial_message: nil, memory_stack: nil, metadata: nil, secrets: nil, user_data: nil, variation_id: nil, request_options: {})
      #
      # @param workspace_id [String]
      #
      # @param agent_id [String]
      #
      # @param data [Hash{Symbol=>Object}] Arbitrary data for the objective. May be used in liquid templates for prompts co
      #
      # @param episodic_memory [Cadenya::Models::ObjectiveCreateParams::EpisodicMemory] Episodic is used to configure the episodic memory for the objective
      #
      # @param initial_message [String] Optional override for the initial message sent to the agent. This becomes the fi
      #
      # @param memory_stack [Array<Cadenya::Models::MemoryReference>] Memory layers/entries to push onto this objective's memory stack on
      #
      # @param metadata [Cadenya::Models::CreateOperationMetadata] CreateOperationMetadata contains the user-provided fields for creating
      #
      # @param secrets [Array<Cadenya::Models::ObjectiveCreateParams::Secret>] Secrets that can be used in the headers for tool calls using the secret interpol
      #
      # @param user_data [Hash{Symbol=>Object}] Arbitrary data rendered into the selected variation's user_message_template
      #
      # @param variation_id [String] Optional explicit variation selection. Overrides the agent's variation_selection
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Objective]
      #
      # @see Cadenya::Models::ObjectiveCreateParams
      def create(workspace_id, params)
        parsed, options = Cadenya::ObjectiveCreateParams.dump_request(params)
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
      # @overload retrieve(id, workspace_id:, request_options: {})
      #
      # @param id [String]
      # @param workspace_id [String]
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Objective]
      #
      # @see Cadenya::Models::ObjectiveRetrieveParams
      def retrieve(id, params)
        parsed, options = Cadenya::ObjectiveRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
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
      # @overload list(workspace_id, agent_id: nil, agent_schedule_id: nil, cursor: nil, include_info: nil, limit: nil, parent_objective_id: nil, profile_id: nil, sort_order: nil, state: nil, request_options: {})
      #
      # @param workspace_id [String]
      #
      # @param agent_id [String] Agent ID for filtering
      #
      # @param agent_schedule_id [String] Filter to objectives produced by a specific AgentSchedule. Accepts
      #
      # @param cursor [String] Pagination cursor from previous response
      #
      # @param include_info [Boolean] When set to true you may use more of your alloted API rate-limit
      #
      # @param limit [Integer] Maximum number of results to return
      #
      # @param parent_objective_id [String] Optional filters
      #
      # @param profile_id [String]
      #
      # @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      # @param state [Symbol, Cadenya::Models::ObjectiveListParams::State] Filter by state
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Objective>]
      #
      # @see Cadenya::Models::ObjectiveListParams
      def list(workspace_id, params = {})
        parsed, options = Cadenya::ObjectiveListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/objectives", workspace_id],
          query: query.transform_keys(
            agent_id: "agentId",
            agent_schedule_id: "agentScheduleId",
            include_info: "includeInfo",
            parent_objective_id: "parentObjectiveId",
            profile_id: "profileId",
            sort_order: "sortOrder"
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
      # @overload cancel(objective_id, workspace_id:, reason: nil, request_options: {})
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
      def cancel(objective_id, params)
        parsed, options = Cadenya::ObjectiveCancelParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
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
      # @overload compact(objective_id, workspace_id:, compaction_config: nil, request_options: {})
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
      def compact(objective_id, params)
        parsed, options = Cadenya::ObjectiveCompactParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
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
      # @overload continue(objective_id, workspace_id:, enqueue: nil, message: nil, secrets: nil, request_options: {})
      #
      # @param objective_id [String] Path param: The ID of the objective. If you have assigned an external ID to the
      #
      # @param workspace_id [String] Path param
      #
      # @param enqueue [Boolean] Body param: When set to true, the message will be enqueued for when the agent lo
      #
      # @param message [String] Body param: The message to continue an objective that has completed (or you are
      #
      # @param secrets [Array<Cadenya::Models::ObjectiveContinueParams::Secret>] Body param: Secrets that should be included with the message. Helpful for when y
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::ObjectiveContinueResponse]
      #
      # @see Cadenya::Models::ObjectiveContinueParams
      def continue(objective_id, params)
        parsed, options = Cadenya::ObjectiveContinueParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/objectives/%2$s:continue", workspace_id, objective_id],
          body: parsed,
          model: Cadenya::Models::ObjectiveContinueResponse,
          options: options
        )
      end

      # Read-only list of the last five windows of execution for this objective, ordered
      # by most recent first
      #
      # @overload list_context_windows(objective_id, workspace_id:, cursor: nil, include_info: nil, limit: nil, request_options: {})
      #
      # @param objective_id [String] Path param: The objective ID to return windows for
      #
      # @param workspace_id [String] Path param
      #
      # @param cursor [String] Query param: Pagination cursor from previous response
      #
      # @param include_info [Boolean] Query param: When set to true you may use more of your alloted API rate-limit
      #
      # @param limit [Integer] Query param: Maximum number of results to return
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::ObjectiveContextWindow>]
      #
      # @see Cadenya::Models::ObjectiveListContextWindowsParams
      def list_context_windows(objective_id, params)
        parsed, options = Cadenya::ObjectiveListContextWindowsParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
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

      # Lists all events for an objective
      #
      # @overload list_events(objective_id, workspace_id:, cursor: nil, include_info: nil, limit: nil, since_event_id: nil, sort_order: nil, window_id: nil, request_options: {})
      #
      # @param objective_id [String] Path param: Objective ID for filtering
      #
      # @param workspace_id [String] Path param
      #
      # @param cursor [String] Query param: Pagination cursor from previous response
      #
      # @param include_info [Boolean] Query param: When set to true you may use more of your alloted API rate-limit
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
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::ObjectiveListEventsResponse>]
      #
      # @see Cadenya::Models::ObjectiveListEventsParams
      def list_events(objective_id, params)
        parsed, options = Cadenya::ObjectiveListEventsParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
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
          model: Cadenya::Models::ObjectiveListEventsResponse,
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
