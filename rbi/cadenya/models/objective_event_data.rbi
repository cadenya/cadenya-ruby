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

      # ObjectiveFinalized is the terminal event written when an objective is finalized.
      # After this event, the objective is super-terminal: no further iterations,
      # compaction, or continuation are permitted.
      sig { returns(T.nilable(Cadenya::ObjectiveEventData::Finalized)) }
      attr_reader :finalized

      sig do
        params(finalized: Cadenya::ObjectiveEventData::Finalized::OrHash).void
      end
      attr_writer :finalized

      # MemoryRead is emitted each time the agent resolves a key against the memory
      # cascade and loads an entry. Lookups that miss (key not found in any layer) do
      # not emit this event.
      sig { returns(T.nilable(Cadenya::MemoryRead)) }
      attr_reader :memory_read

      sig { params(memory_read: Cadenya::MemoryRead::OrHash).void }
      attr_writer :memory_read

      # Notice is a non-terminal diagnostic emitted by the runtime when something
      # noteworthy but non-fatal happens during an objective — for example a
      # just-in-time tool set failing to load, or a previously loaded tool being dropped
      # because it was archived. Notices carry no structured payload; they exist to make
      # the objective timeline self-explanatory.
      sig { returns(T.nilable(Cadenya::ObjectiveEventData::Notice)) }
      attr_reader :notice

      sig { params(notice: Cadenya::ObjectiveEventData::Notice::OrHash).void }
      attr_writer :notice

      sig { returns(T.nilable(Cadenya::SubAgentSpawned)) }
      attr_reader :sub_agent_spawned

      sig { params(sub_agent_spawned: Cadenya::SubAgentSpawned::OrHash).void }
      attr_writer :sub_agent_spawned

      sig { returns(T.nilable(Cadenya::SubAgentUpdated)) }
      attr_reader :sub_agent_updated

      sig { params(sub_agent_updated: Cadenya::SubAgentUpdated::OrHash).void }
      attr_writer :sub_agent_updated

      # ObjectiveTimedOut is the terminal event written when an objective is finalized
      # by the inactivity sweep because it saw no activity (no user messages, no LLM
      # calls) within its variation's inactivity timeout — or the system-wide 24 hour
      # maximum when no timeout is configured. The objective produces no output. After
      # this event, the objective is super-terminal: no further iterations, compaction,
      # or continuation are permitted.
      sig { returns(T.nilable(Cadenya::ObjectiveEventData::TimedOut)) }
      attr_reader :timed_out

      sig do
        params(timed_out: Cadenya::ObjectiveEventData::TimedOut::OrHash).void
      end
      attr_writer :timed_out

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
          finalized: Cadenya::ObjectiveEventData::Finalized::OrHash,
          memory_read: Cadenya::MemoryRead::OrHash,
          notice: Cadenya::ObjectiveEventData::Notice::OrHash,
          sub_agent_spawned: Cadenya::SubAgentSpawned::OrHash,
          sub_agent_updated: Cadenya::SubAgentUpdated::OrHash,
          timed_out: Cadenya::ObjectiveEventData::TimedOut::OrHash,
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
        # ObjectiveFinalized is the terminal event written when an objective is finalized.
        # After this event, the objective is super-terminal: no further iterations,
        # compaction, or continuation are permitted.
        finalized: nil,
        # MemoryRead is emitted each time the agent resolves a key against the memory
        # cascade and loads an entry. Lookups that miss (key not found in any layer) do
        # not emit this event.
        memory_read: nil,
        # Notice is a non-terminal diagnostic emitted by the runtime when something
        # noteworthy but non-fatal happens during an objective — for example a
        # just-in-time tool set failing to load, or a previously loaded tool being dropped
        # because it was archived. Notices carry no structured payload; they exist to make
        # the objective timeline self-explanatory.
        notice: nil,
        sub_agent_spawned: nil,
        sub_agent_updated: nil,
        # ObjectiveTimedOut is the terminal event written when an objective is finalized
        # by the inactivity sweep because it saw no activity (no user messages, no LLM
        # calls) within its variation's inactivity timeout — or the system-wide 24 hour
        # maximum when no timeout is configured. The objective produces no output. After
        # this event, the objective is super-terminal: no further iterations, compaction,
        # or continuation are permitted.
        timed_out: nil,
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
            finalized: Cadenya::ObjectiveEventData::Finalized,
            memory_read: Cadenya::MemoryRead,
            notice: Cadenya::ObjectiveEventData::Notice,
            sub_agent_spawned: Cadenya::SubAgentSpawned,
            sub_agent_updated: Cadenya::SubAgentUpdated,
            timed_out: Cadenya::ObjectiveEventData::TimedOut,
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

      class Finalized < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ObjectiveEventData::Finalized,
              Cadenya::Internal::AnyHash
            )
          end

        # If the objective was created with an output schema, and the agent successfully
        # completed the objective, this field will contain the structured output of the
        # objective.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :output

        sig { params(output: T.anything).void }
        attr_writer :output

        # ObjectiveFinalized is the terminal event written when an objective is finalized.
        # After this event, the objective is super-terminal: no further iterations,
        # compaction, or continuation are permitted.
        sig { params(output: T.anything).returns(T.attached_class) }
        def self.new(
          # If the objective was created with an output schema, and the agent successfully
          # completed the objective, this field will contain the structured output of the
          # objective.
          output: nil
        )
        end

        sig { override.returns({ output: T.anything }) }
        def to_hash
        end
      end

      class Notice < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ObjectiveEventData::Notice,
              Cadenya::Internal::AnyHash
            )
          end

        # Stable machine-readable identifier for the notice kind (for example
        # "tool_set_load_failed", "tool_archived"). Clients can switch on it or use it as
        # an i18n key; the message is the English fallback.
        sig { returns(T.nilable(String)) }
        attr_reader :key

        sig { params(key: String).void }
        attr_writer :key

        sig do
          returns(
            T.nilable(Cadenya::ObjectiveEventData::Notice::Level::TaggedSymbol)
          )
        end
        attr_reader :level

        sig do
          params(
            level: Cadenya::ObjectiveEventData::Notice::Level::OrSymbol
          ).void
        end
        attr_writer :level

        # Human-readable description of what happened.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Notice is a non-terminal diagnostic emitted by the runtime when something
        # noteworthy but non-fatal happens during an objective — for example a
        # just-in-time tool set failing to load, or a previously loaded tool being dropped
        # because it was archived. Notices carry no structured payload; they exist to make
        # the objective timeline self-explanatory.
        sig do
          params(
            key: String,
            level: Cadenya::ObjectiveEventData::Notice::Level::OrSymbol,
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable machine-readable identifier for the notice kind (for example
          # "tool_set_load_failed", "tool_archived"). Clients can switch on it or use it as
          # an i18n key; the message is the English fallback.
          key: nil,
          level: nil,
          # Human-readable description of what happened.
          message: nil
        )
        end

        sig do
          override.returns(
            {
              key: String,
              level: Cadenya::ObjectiveEventData::Notice::Level::TaggedSymbol,
              message: String
            }
          )
        end
        def to_hash
        end

        module Level
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::ObjectiveEventData::Notice::Level)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LEVEL_UNSPECIFIED =
            T.let(
              :LEVEL_UNSPECIFIED,
              Cadenya::ObjectiveEventData::Notice::Level::TaggedSymbol
            )
          LEVEL_INFO =
            T.let(
              :LEVEL_INFO,
              Cadenya::ObjectiveEventData::Notice::Level::TaggedSymbol
            )
          LEVEL_WARN =
            T.let(
              :LEVEL_WARN,
              Cadenya::ObjectiveEventData::Notice::Level::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Cadenya::ObjectiveEventData::Notice::Level::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      class TimedOut < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ObjectiveEventData::TimedOut,
              Cadenya::Internal::AnyHash
            )
          end

        # Human-readable note recorded at timeout time (e.g. "Timed out after 2h of
        # inactivity").
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # ObjectiveTimedOut is the terminal event written when an objective is finalized
        # by the inactivity sweep because it saw no activity (no user messages, no LLM
        # calls) within its variation's inactivity timeout — or the system-wide 24 hour
        # maximum when no timeout is configured. The objective produces no output. After
        # this event, the objective is super-terminal: no further iterations, compaction,
        # or continuation are permitted.
        sig { params(message: String).returns(T.attached_class) }
        def self.new(
          # Human-readable note recorded at timeout time (e.g. "Timed out after 2h of
          # inactivity").
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
