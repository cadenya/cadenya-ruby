# typed: strong

module Cadenya
  module Models
    class ObjectiveEventData < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveEventData, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(Cadenya::AssistantMessage)) }
      attr_reader :assistant_message

      sig { params(assistant_message: Cadenya::AssistantMessage::OrHash).void }
      attr_writer :assistant_message

      # ObjectiveCancelled is the terminal event written when an objective is cancelled.
      # After this event, the objective is super-terminal: no further iterations,
      # compaction, or continuation are permitted.
      sig { returns(T.nilable(Cadenya::ObjectiveEventData::Cancelled)) }
      attr_reader :cancelled

      sig do
        params(cancelled: Cadenya::ObjectiveEventData::Cancelled::OrHash).void
      end
      attr_writer :cancelled

      sig { returns(T.nilable(Cadenya::ContextWindowCompacted)) }
      attr_reader :context_window_compacted

      sig do
        params(
          context_window_compacted: Cadenya::ContextWindowCompacted::OrHash
        ).void
      end
      attr_writer :context_window_compacted

      sig { returns(T.nilable(Cadenya::ObjectiveError)) }
      attr_reader :error

      sig { params(error: Cadenya::ObjectiveError::OrHash).void }
      attr_writer :error

      # MemoryRead is emitted each time the agent resolves a key against the memory
      # stack and loads an entry. Lookups that miss (key not found in any layer) do not
      # emit this event.
      sig { returns(T.nilable(Cadenya::MemoryRead)) }
      attr_reader :memory_read

      sig { params(memory_read: Cadenya::MemoryRead::OrHash).void }
      attr_writer :memory_read

      sig { returns(T.nilable(Cadenya::SubAgentSpawned)) }
      attr_reader :sub_agent_spawned

      sig { params(sub_agent_spawned: Cadenya::SubAgentSpawned::OrHash).void }
      attr_writer :sub_agent_spawned

      sig { returns(T.nilable(Cadenya::SubAgentUpdated)) }
      attr_reader :sub_agent_updated

      sig { params(sub_agent_updated: Cadenya::SubAgentUpdated::OrHash).void }
      attr_writer :sub_agent_updated

      sig { returns(T.nilable(Cadenya::ToolApprovalRequested)) }
      attr_reader :tool_approval_requested

      sig do
        params(
          tool_approval_requested: Cadenya::ToolApprovalRequested::OrHash
        ).void
      end
      attr_writer :tool_approval_requested

      sig { returns(T.nilable(Cadenya::ToolApproved)) }
      attr_reader :tool_approved

      sig { params(tool_approved: Cadenya::ToolApproved::OrHash).void }
      attr_writer :tool_approved

      sig { returns(T.nilable(Cadenya::ToolCalled)) }
      attr_reader :tool_called

      sig { params(tool_called: Cadenya::ToolCalled::OrHash).void }
      attr_writer :tool_called

      sig { returns(T.nilable(Cadenya::ToolDenied)) }
      attr_reader :tool_denied

      sig { params(tool_denied: Cadenya::ToolDenied::OrHash).void }
      attr_writer :tool_denied

      sig { returns(T.nilable(Cadenya::ToolError)) }
      attr_reader :tool_error

      sig { params(tool_error: Cadenya::ToolError::OrHash).void }
      attr_writer :tool_error

      sig { returns(T.nilable(Cadenya::ToolResult)) }
      attr_reader :tool_result

      sig { params(tool_result: Cadenya::ToolResult::OrHash).void }
      attr_writer :tool_result

      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      sig { returns(T.nilable(Cadenya::UserMessage)) }
      attr_reader :user_message

      sig { params(user_message: Cadenya::UserMessage::OrHash).void }
      attr_writer :user_message

      sig do
        params(
          assistant_message: Cadenya::AssistantMessage::OrHash,
          cancelled: Cadenya::ObjectiveEventData::Cancelled::OrHash,
          context_window_compacted: Cadenya::ContextWindowCompacted::OrHash,
          error: Cadenya::ObjectiveError::OrHash,
          memory_read: Cadenya::MemoryRead::OrHash,
          sub_agent_spawned: Cadenya::SubAgentSpawned::OrHash,
          sub_agent_updated: Cadenya::SubAgentUpdated::OrHash,
          tool_approval_requested: Cadenya::ToolApprovalRequested::OrHash,
          tool_approved: Cadenya::ToolApproved::OrHash,
          tool_called: Cadenya::ToolCalled::OrHash,
          tool_denied: Cadenya::ToolDenied::OrHash,
          tool_error: Cadenya::ToolError::OrHash,
          tool_result: Cadenya::ToolResult::OrHash,
          type: String,
          user_message: Cadenya::UserMessage::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        assistant_message: nil,
        # ObjectiveCancelled is the terminal event written when an objective is cancelled.
        # After this event, the objective is super-terminal: no further iterations,
        # compaction, or continuation are permitted.
        cancelled: nil,
        context_window_compacted: nil,
        error: nil,
        # MemoryRead is emitted each time the agent resolves a key against the memory
        # stack and loads an entry. Lookups that miss (key not found in any layer) do not
        # emit this event.
        memory_read: nil,
        sub_agent_spawned: nil,
        sub_agent_updated: nil,
        tool_approval_requested: nil,
        tool_approved: nil,
        tool_called: nil,
        tool_denied: nil,
        tool_error: nil,
        tool_result: nil,
        type: nil,
        user_message: nil
      )
      end

      sig do
        override.returns(
          {
            assistant_message: Cadenya::AssistantMessage,
            cancelled: Cadenya::ObjectiveEventData::Cancelled,
            context_window_compacted: Cadenya::ContextWindowCompacted,
            error: Cadenya::ObjectiveError,
            memory_read: Cadenya::MemoryRead,
            sub_agent_spawned: Cadenya::SubAgentSpawned,
            sub_agent_updated: Cadenya::SubAgentUpdated,
            tool_approval_requested: Cadenya::ToolApprovalRequested,
            tool_approved: Cadenya::ToolApproved,
            tool_called: Cadenya::ToolCalled,
            tool_denied: Cadenya::ToolDenied,
            tool_error: Cadenya::ToolError,
            tool_result: Cadenya::ToolResult,
            type: String,
            user_message: Cadenya::UserMessage
          }
        )
      end
      def to_hash
      end

      class Cancelled < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ObjectiveEventData::Cancelled,
              Cadenya::Internal::AnyHash
            )
          end

        # Optional human-readable note recorded at cancel time. Today the workflow sets
        # "Cancelled" but this field leaves room for richer reasons (e.g. "Cancelled by
        # user", "Cancelled by schedule sweep", "Credit balance exhausted").
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # ObjectiveCancelled is the terminal event written when an objective is cancelled.
        # After this event, the objective is super-terminal: no further iterations,
        # compaction, or continuation are permitted.
        sig { params(message: String).returns(T.attached_class) }
        def self.new(
          # Optional human-readable note recorded at cancel time. Today the workflow sets
          # "Cancelled" but this field leaves room for richer reasons (e.g. "Cancelled by
          # user", "Cancelled by schedule sweep", "Credit balance exhausted").
          message: nil
        )
        end

        sig { override.returns({ message: String }) }
        def to_hash
        end
      end
    end
  end
end
