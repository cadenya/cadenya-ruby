# typed: strong

module Cadenya
  module Models
    class ObjectiveEvent < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveEvent, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::ObjectiveEventData::Variants) }
      attr_accessor :data

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(Cadenya::OperationMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(T.nilable(String)) }
      attr_reader :context_window_id

      sig { params(context_window_id: String).void }
      attr_writer :context_window_id

      sig { returns(T.nilable(Cadenya::ObjectiveEventInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::ObjectiveEventInfo::OrHash).void }
      attr_writer :info

      # Elapsed time of the work this event records, when it is known at write time
      # (e.g. assistant message generation, tool execution for result/error events).
      # Unset means the event is instantaneous or the duration is not measurable.
      # Serialized as a canonical duration string (e.g. "4.1s"). Always set together
      # with started_at.
      sig { returns(T.nilable(String)) }
      attr_reader :duration

      sig { params(duration: String).void }
      attr_writer :duration

      # When the work this event records began. Set together with duration, so the work
      # interval is [started_at, started_at + duration]. The event's created_at remains
      # the time the event was persisted.
      sig { returns(T.nilable(Time)) }
      attr_reader :started_at

      sig { params(started_at: Time).void }
      attr_writer :started_at

      sig do
        params(
          data:
            T.any(
              Cadenya::ObjectiveEventDataUserMessage::OrHash,
              Cadenya::ObjectiveEventDataToolApprovalRequested::OrHash,
              Cadenya::ObjectiveEventDataToolApproved::OrHash,
              Cadenya::ObjectiveEventDataToolDenied::OrHash,
              Cadenya::ObjectiveEventDataToolCalled::OrHash,
              Cadenya::ObjectiveEventDataError::OrHash,
              Cadenya::ObjectiveEventDataAssistantMessage::OrHash,
              Cadenya::ObjectiveEventDataToolResult::OrHash,
              Cadenya::ObjectiveEventDataToolError::OrHash,
              Cadenya::ObjectiveEventDataContextWindowCompacted::OrHash,
              Cadenya::ObjectiveEventDataMemoryRead::OrHash,
              Cadenya::ObjectiveEventDataCancelled::OrHash,
              Cadenya::ObjectiveEventDataSubAgentSpawned::OrHash,
              Cadenya::ObjectiveEventDataSubAgentUpdated::OrHash,
              Cadenya::ObjectiveEventDataFinalized::OrHash,
              Cadenya::ObjectiveEventDataNotice::OrHash,
              Cadenya::ObjectiveEventDataTimedOut::OrHash
            ),
          metadata: Cadenya::OperationMetadata::OrHash,
          context_window_id: String,
          duration: String,
          info: Cadenya::ObjectiveEventInfo::OrHash,
          started_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        metadata:,
        context_window_id: nil,
        # Elapsed time of the work this event records, when it is known at write time
        # (e.g. assistant message generation, tool execution for result/error events).
        # Unset means the event is instantaneous or the duration is not measurable.
        # Serialized as a canonical duration string (e.g. "4.1s"). Always set together
        # with started_at.
        duration: nil,
        info: nil,
        # When the work this event records began. Set together with duration, so the work
        # interval is [started_at, started_at + duration]. The event's created_at remains
        # the time the event was persisted.
        started_at: nil
      )
      end

      sig do
        override.returns(
          {
            data: Cadenya::ObjectiveEventData::Variants,
            metadata: Cadenya::OperationMetadata,
            context_window_id: String,
            duration: String,
            info: Cadenya::ObjectiveEventInfo,
            started_at: Time
          }
        )
      end
      def to_hash
      end
    end
  end
end
