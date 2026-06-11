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
          workspace_id: String,
          agent_id: String,
          data: T::Hash[Symbol, T.anything],
          episodic_memory:
            Cadenya::ObjectiveCreateParams::EpisodicMemory::OrHash,
          initial_message: String,
          memory_stack: T::Array[Cadenya::MemoryReference::OrHash],
          metadata: Cadenya::CreateOperationMetadata::OrHash,
          secrets: T::Array[Cadenya::ObjectiveCreateParams::Secret::OrHash],
          user_data: T::Hash[Symbol, T.anything],
          variation_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Objective)
      end
      def create(
        workspace_id,
        agent_id:,
        # Arbitrary data for the objective. May be used in liquid templates for prompts
        # configured on the agent variation
        data:,
        # Episodic is used to configure the episodic memory for the objective
        episodic_memory: nil,
        # Optional override for the initial message sent to the agent. This becomes the
        # first user message in the LLM chat history. When not set, the selected
        # variation's user_message_template is rendered with user_data instead. If neither
        # this field nor a user_message_template is present, the request is rejected with
        # InvalidArgument.
        initial_message: nil,
        # Memory layers/entries to push onto this objective's memory stack on top of the
        # baseline stack inherited from the selected variation.
        #
        # Array order is push order: the first element sits lower in the objective's
        # contribution to the stack; the LAST element ends up on top of the effective
        # stack. Entries pinned via memory_entry_id behave as single-entry layers at their
        # position.
        #
        # System-managed layers (e.g., episodic) cannot be referenced here; they attach
        # themselves automatically based on episodic_key.
        #
        # Stack size cap: the TOTAL effective stack (variation's memory layers
        #
        # - this field) must not exceed 10 entries. A request that would produce an
        #   effective stack larger than 10 is rejected with InvalidArgument.
        memory_stack: nil,
        # CreateOperationMetadata contains the user-provided fields for creating an
        # operation. Read-only fields (id, account_id, workspace_id, created_at,
        # profile_id) are excluded since they are set by the server.
        metadata: nil,
        # Secrets that can be used in the headers for tool calls using the secret
        # interpolation format.
        secrets: nil,
        # Arbitrary data rendered into the selected variation's user_message_template
        # (liquid) to produce the initial user message. Separate from `data`, which
        # renders the system prompt template.
        user_data: nil,
        # Optional explicit variation selection. Overrides the agent's
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
      def retrieve(id, workspace_id:, request_options: {})
      end

      # Lists all objectives in the workspace
      sig do
        params(
          workspace_id: String,
          agent_id: String,
          agent_schedule_id: String,
          cursor: String,
          include_info: T::Boolean,
          limit: Integer,
          parent_objective_id: String,
          profile_id: String,
          sort_order: String,
          state: Cadenya::ObjectiveListParams::State::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::Objective])
      end
      def list(
        workspace_id,
        # Agent ID for filtering
        agent_id: nil,
        # Filter to objectives produced by a specific AgentSchedule. Accepts canonical
        # as\_… form or external_id:<value> form.
        agent_schedule_id: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # When set to true you may use more of your alloted API rate-limit
        include_info: nil,
        # Maximum number of results to return
        limit: nil,
        # Optional filters
        parent_objective_id: nil,
        profile_id: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Filter by state
        state: nil,
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
        workspace_id:,
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
        workspace_id:,
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
          workspace_id: String,
          enqueue: T::Boolean,
          message: String,
          secrets: T::Array[Cadenya::ObjectiveContinueParams::Secret::OrHash],
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Models::ObjectiveContinueResponse)
      end
      def continue(
        # Path param: The ID of the objective. If you have assigned an external ID to the
        # objective, you can prefix the ID with "external_id:". For example,
        # "external_id:1234567890". Otherwise, the ID assigned by Cadenya should be used.
        objective_id,
        # Path param
        workspace_id:,
        # Body param: When set to true, the message will be enqueued for when the agent
        # loop is available to process it.
        enqueue: nil,
        # Body param: The message to continue an objective that has completed (or you are
        # enqueing)
        message: nil,
        # Body param: Secrets that should be included with the message. Helpful for when
        # you need to update secrets on the objective (IE: A secret expires and needs to
        # be refreshed)
        secrets: nil,
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
        workspace_id:,
        # Query param: Pagination cursor from previous response
        cursor: nil,
        # Query param: When set to true you may use more of your alloted API rate-limit
        include_info: nil,
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
          limit: Integer,
          since_event_id: String,
          sort_order: String,
          window_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(
          Cadenya::Internal::CursorPagination[
            Cadenya::Models::ObjectiveListEventsResponse
          ]
        )
      end
      def list_events(
        # Path param: Objective ID for filtering
        objective_id,
        # Path param
        workspace_id:,
        # Query param: Pagination cursor from previous response
        cursor: nil,
        # Query param: When set to true you may use more of your alloted API rate-limit
        include_info: nil,
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

      # @api private
      sig { params(client: Cadenya::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
