# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventData < Cadenya::Internal::Type::BaseModel
      # @!attribute assistant_message
      #
      #   @return [Cadenya::Models::AssistantMessage, nil]
      optional :assistant_message, -> { Cadenya::AssistantMessage }, api_name: :assistantMessage

      # @!attribute cancelled
      #   ObjectiveCancelled is the terminal event written when an objective is cancelled.
      #   After this event, the objective is super-terminal: no further iterations,
      #   compaction, or continuation are permitted.
      #
      #   @return [Cadenya::Models::ObjectiveEventData::Cancelled, nil]
      optional :cancelled, -> { Cadenya::ObjectiveEventData::Cancelled }

      # @!attribute context_window_compacted
      #
      #   @return [Cadenya::Models::ContextWindowCompacted, nil]
      optional :context_window_compacted,
               -> { Cadenya::ContextWindowCompacted },
               api_name: :contextWindowCompacted

      # @!attribute error
      #
      #   @return [Cadenya::Models::ObjectiveError, nil]
      optional :error, -> { Cadenya::ObjectiveError }

      # @!attribute finalized
      #   ObjectiveFinalized is the terminal event written when an objective is finalized.
      #   After this event, the objective is super-terminal: no further iterations,
      #   compaction, or continuation are permitted.
      #
      #   @return [Cadenya::Models::ObjectiveEventData::Finalized, nil]
      optional :finalized, -> { Cadenya::ObjectiveEventData::Finalized }

      # @!attribute memory_read
      #   MemoryRead is emitted each time the agent resolves a key against the memory
      #   cascade and loads an entry. Lookups that miss (key not found in any layer) do
      #   not emit this event.
      #
      #   @return [Cadenya::Models::MemoryRead, nil]
      optional :memory_read, -> { Cadenya::MemoryRead }, api_name: :memoryRead

      # @!attribute notice
      #   Notice is a non-terminal diagnostic emitted by the runtime when something
      #   noteworthy but non-fatal happens during an objective — for example a
      #   just-in-time tool set failing to load, or a previously loaded tool being dropped
      #   because it was archived. Notices carry no structured payload; they exist to make
      #   the objective timeline self-explanatory.
      #
      #   @return [Cadenya::Models::ObjectiveEventData::Notice, nil]
      optional :notice, -> { Cadenya::ObjectiveEventData::Notice }

      # @!attribute reasoning
      #   Reasoning carries the human-readable reasoning text a model produced while
      #   working on an iteration — extended thinking (Anthropic, Gemini) or reasoning
      #   summaries (OpenAI). It is emitted alongside the assistant message from the same
      #   model response and is purely informational: the text shown here is never sent
      #   back to the model.
      #
      #   @return [Cadenya::Models::Reasoning, nil]
      optional :reasoning, -> { Cadenya::Reasoning }

      # @!attribute sub_agent_spawned
      #
      #   @return [Cadenya::Models::SubAgentSpawned, nil]
      optional :sub_agent_spawned, -> { Cadenya::SubAgentSpawned }, api_name: :subAgentSpawned

      # @!attribute sub_agent_updated
      #
      #   @return [Cadenya::Models::SubAgentUpdated, nil]
      optional :sub_agent_updated, -> { Cadenya::SubAgentUpdated }, api_name: :subAgentUpdated

      # @!attribute timed_out
      #   ObjectiveTimedOut is the terminal event written when an objective is finalized
      #   by the inactivity sweep because it saw no activity (no user messages, no LLM
      #   calls) within its variation's inactivity timeout — or the system-wide 24 hour
      #   maximum when no timeout is configured. The objective produces no output. After
      #   this event, the objective is super-terminal: no further iterations, compaction,
      #   or continuation are permitted.
      #
      #   @return [Cadenya::Models::ObjectiveEventData::TimedOut, nil]
      optional :timed_out, -> { Cadenya::ObjectiveEventData::TimedOut }, api_name: :timedOut

      # @!attribute tool_approval_requested
      #
      #   @return [Cadenya::Models::ToolApprovalRequested, nil]
      optional :tool_approval_requested,
               -> {
                 Cadenya::ToolApprovalRequested
               },
               api_name: :toolApprovalRequested

      # @!attribute tool_approved
      #
      #   @return [Cadenya::Models::ToolApproved, nil]
      optional :tool_approved, -> { Cadenya::ToolApproved }, api_name: :toolApproved

      # @!attribute tool_called
      #
      #   @return [Cadenya::Models::ToolCalled, nil]
      optional :tool_called, -> { Cadenya::ToolCalled }, api_name: :toolCalled

      # @!attribute tool_denied
      #
      #   @return [Cadenya::Models::ToolDenied, nil]
      optional :tool_denied, -> { Cadenya::ToolDenied }, api_name: :toolDenied

      # @!attribute tool_error
      #
      #   @return [Cadenya::Models::ToolError, nil]
      optional :tool_error, -> { Cadenya::ToolError }, api_name: :toolError

      # @!attribute tool_result
      #
      #   @return [Cadenya::Models::ToolResult, nil]
      optional :tool_result, -> { Cadenya::ToolResult }, api_name: :toolResult

      # @!attribute type
      #   The JSON name of the variant set in `data` (e.g. "userMessage"). Filled by the
      #   server; drives the discriminated union in the generated OpenAPI.
      #
      #   @return [String, nil]
      optional :type, String

      # @!attribute user_message
      #
      #   @return [Cadenya::Models::UserMessage, nil]
      optional :user_message, -> { Cadenya::UserMessage }, api_name: :userMessage

      # @!method initialize(assistant_message: nil, cancelled: nil, context_window_compacted: nil, error: nil, finalized: nil, memory_read: nil, notice: nil, reasoning: nil, sub_agent_spawned: nil, sub_agent_updated: nil, timed_out: nil, tool_approval_requested: nil, tool_approved: nil, tool_called: nil, tool_denied: nil, tool_error: nil, tool_result: nil, type: nil, user_message: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveEventData} for more details.
      #
      #   @param assistant_message [Cadenya::Models::AssistantMessage]
      #
      #   @param cancelled [Cadenya::Models::ObjectiveEventData::Cancelled] ObjectiveCancelled is the terminal event written when an objective is
      #
      #   @param context_window_compacted [Cadenya::Models::ContextWindowCompacted]
      #
      #   @param error [Cadenya::Models::ObjectiveError]
      #
      #   @param finalized [Cadenya::Models::ObjectiveEventData::Finalized] ObjectiveFinalized is the terminal event written when an objective is
      #
      #   @param memory_read [Cadenya::Models::MemoryRead] MemoryRead is emitted each time the agent resolves a key against the
      #
      #   @param notice [Cadenya::Models::ObjectiveEventData::Notice] Notice is a non-terminal diagnostic emitted by the runtime when something
      #
      #   @param reasoning [Cadenya::Models::Reasoning] Reasoning carries the human-readable reasoning text a model produced while
      #
      #   @param sub_agent_spawned [Cadenya::Models::SubAgentSpawned]
      #
      #   @param sub_agent_updated [Cadenya::Models::SubAgentUpdated]
      #
      #   @param timed_out [Cadenya::Models::ObjectiveEventData::TimedOut] ObjectiveTimedOut is the terminal event written when an objective is
      #
      #   @param tool_approval_requested [Cadenya::Models::ToolApprovalRequested]
      #
      #   @param tool_approved [Cadenya::Models::ToolApproved]
      #
      #   @param tool_called [Cadenya::Models::ToolCalled]
      #
      #   @param tool_denied [Cadenya::Models::ToolDenied]
      #
      #   @param tool_error [Cadenya::Models::ToolError]
      #
      #   @param tool_result [Cadenya::Models::ToolResult]
      #
      #   @param type [String] The JSON name of the variant set in `data` (e.g. "userMessage"). Filled by
      #
      #   @param user_message [Cadenya::Models::UserMessage]

      # @see Cadenya::Models::ObjectiveEventData#cancelled
      class Cancelled < Cadenya::Internal::Type::BaseModel
        # @!attribute message
        #   Optional human-readable note recorded at cancel time. Today the workflow sets
        #   "Cancelled" but this field leaves room for richer reasons (e.g. "Cancelled by
        #   user", "Cancelled by schedule sweep", "Credit balance exhausted").
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(message: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ObjectiveEventData::Cancelled} for more details.
        #
        #   ObjectiveCancelled is the terminal event written when an objective is cancelled.
        #   After this event, the objective is super-terminal: no further iterations,
        #   compaction, or continuation are permitted.
        #
        #   @param message [String] Optional human-readable note recorded at cancel time. Today the workflow
      end

      # @see Cadenya::Models::ObjectiveEventData#finalized
      class Finalized < Cadenya::Internal::Type::BaseModel
        # @!attribute output
        #   If the objective was created with an output schema, and the agent successfully
        #   completed the objective, this field will contain the structured output of the
        #   objective.
        #
        #   @return [Object, nil]
        optional :output, Cadenya::Internal::Type::Unknown

        # @!method initialize(output: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ObjectiveEventData::Finalized} for more details.
        #
        #   ObjectiveFinalized is the terminal event written when an objective is finalized.
        #   After this event, the objective is super-terminal: no further iterations,
        #   compaction, or continuation are permitted.
        #
        #   @param output [Object] If the objective was created with an output schema, and the agent
      end

      # @see Cadenya::Models::ObjectiveEventData#notice
      class Notice < Cadenya::Internal::Type::BaseModel
        # @!attribute key
        #   Stable machine-readable identifier for the notice kind (for example
        #   "tool_set_load_failed", "tool_archived"). Clients can switch on it or use it as
        #   an i18n key; the message is the English fallback.
        #
        #   @return [String, nil]
        optional :key, String

        # @!attribute level
        #
        #   @return [Symbol, Cadenya::Models::ObjectiveEventData::Notice::Level, nil]
        optional :level, enum: -> { Cadenya::ObjectiveEventData::Notice::Level }

        # @!attribute message
        #   Human-readable description of what happened.
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(key: nil, level: nil, message: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ObjectiveEventData::Notice} for more details.
        #
        #   Notice is a non-terminal diagnostic emitted by the runtime when something
        #   noteworthy but non-fatal happens during an objective — for example a
        #   just-in-time tool set failing to load, or a previously loaded tool being dropped
        #   because it was archived. Notices carry no structured payload; they exist to make
        #   the objective timeline self-explanatory.
        #
        #   @param key [String] Stable machine-readable identifier for the notice kind (for example
        #
        #   @param level [Symbol, Cadenya::Models::ObjectiveEventData::Notice::Level]
        #
        #   @param message [String] Human-readable description of what happened.

        # @see Cadenya::Models::ObjectiveEventData::Notice#level
        module Level
          extend Cadenya::Internal::Type::Enum

          LEVEL_UNSPECIFIED = :LEVEL_UNSPECIFIED
          LEVEL_INFO = :LEVEL_INFO
          LEVEL_WARN = :LEVEL_WARN

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Cadenya::Models::ObjectiveEventData#timed_out
      class TimedOut < Cadenya::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable note recorded at timeout time (e.g. "Timed out after 2h of
        #   inactivity").
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(message: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ObjectiveEventData::TimedOut} for more details.
        #
        #   ObjectiveTimedOut is the terminal event written when an objective is finalized
        #   by the inactivity sweep because it saw no activity (no user messages, no LLM
        #   calls) within its variation's inactivity timeout — or the system-wide 24 hour
        #   maximum when no timeout is configured. The objective produces no output. After
        #   this event, the objective is super-terminal: no further iterations, compaction,
        #   or continuation are permitted.
        #
        #   @param message [String] Human-readable note recorded at timeout time (e.g. "Timed out after 2h
      end
    end
  end
end
