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

      # @!attribute memory_read
      #   MemoryRead is emitted each time the agent resolves a key against the memory
      #   stack and loads an entry. Lookups that miss (key not found in any layer) do not
      #   emit this event.
      #
      #   @return [Cadenya::Models::MemoryRead, nil]
      optional :memory_read, -> { Cadenya::MemoryRead }, api_name: :memoryRead

      # @!attribute sub_agent_spawned
      #
      #   @return [Cadenya::Models::SubAgentSpawned, nil]
      optional :sub_agent_spawned, -> { Cadenya::SubAgentSpawned }, api_name: :subAgentSpawned

      # @!attribute sub_agent_updated
      #
      #   @return [Cadenya::Models::SubAgentUpdated, nil]
      optional :sub_agent_updated, -> { Cadenya::SubAgentUpdated }, api_name: :subAgentUpdated

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
      #
      #   @return [String, nil]
      optional :type, String

      # @!attribute user_message
      #
      #   @return [Cadenya::Models::UserMessage, nil]
      optional :user_message, -> { Cadenya::UserMessage }, api_name: :userMessage

      # @!method initialize(assistant_message: nil, cancelled: nil, context_window_compacted: nil, error: nil, memory_read: nil, sub_agent_spawned: nil, sub_agent_updated: nil, tool_approval_requested: nil, tool_approved: nil, tool_called: nil, tool_denied: nil, tool_error: nil, tool_result: nil, type: nil, user_message: nil)
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
      #   @param memory_read [Cadenya::Models::MemoryRead] MemoryRead is emitted each time the agent resolves a key against the
      #
      #   @param sub_agent_spawned [Cadenya::Models::SubAgentSpawned]
      #
      #   @param sub_agent_updated [Cadenya::Models::SubAgentUpdated]
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
      #   @param type [String]
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
    end
  end
end
