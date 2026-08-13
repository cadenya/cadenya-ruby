# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#continue
    class ObjectiveEvent < Cadenya::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Cadenya::Models::ObjectiveEventDataUserMessage, Cadenya::Models::ObjectiveEventDataToolApprovalRequested, Cadenya::Models::ObjectiveEventDataToolApproved, Cadenya::Models::ObjectiveEventDataToolDenied, Cadenya::Models::ObjectiveEventDataToolCalled, Cadenya::Models::ObjectiveEventDataError, Cadenya::Models::ObjectiveEventDataAssistantMessage, Cadenya::Models::ObjectiveEventDataToolResult, Cadenya::Models::ObjectiveEventDataToolError, Cadenya::Models::ObjectiveEventDataContextWindowCompacted, Cadenya::Models::ObjectiveEventDataMemoryRead, Cadenya::Models::ObjectiveEventDataCancelled, Cadenya::Models::ObjectiveEventDataSubAgentSpawned, Cadenya::Models::ObjectiveEventDataSubAgentUpdated, Cadenya::Models::ObjectiveEventDataFinalized, Cadenya::Models::ObjectiveEventDataNotice, Cadenya::Models::ObjectiveEventDataTimedOut, Cadenya::Models::ObjectiveEventDataReasoning]
      required :data, union: -> { Cadenya::ObjectiveEventData }

      # @!attribute metadata
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @return [Cadenya::Models::OperationMetadata]
      required :metadata, -> { Cadenya::OperationMetadata }

      # @!attribute context_window_id
      #
      #   @return [String]
      required :context_window_id, String, api_name: :contextWindowId

      # @!attribute info
      #
      #   @return [Cadenya::Models::ObjectiveEventInfo, nil]
      optional :info, -> { Cadenya::ObjectiveEventInfo }

      response_only do
        # @!attribute duration
        #   Elapsed time of the work this event records, when it is known at write time
        #   (e.g. assistant message generation, tool execution for result/error events).
        #   Unset means the event is instantaneous or the duration is not measurable.
        #   Serialized as a canonical duration string (e.g. "4.1s"). Always set together
        #   with started_at.
        #
        #   @return [String, nil]
        optional :duration, String

        # @!attribute started_at
        #   When the work this event records began. Set together with duration, so the work
        #   interval is [started_at, started_at + duration]. The event's created_at remains
        #   the time the event was persisted.
        #
        #   @return [Time, nil]
        optional :started_at, Time, api_name: :startedAt
      end

      # @!method initialize(data:, metadata:, context_window_id:, duration: nil, info: nil, started_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveEvent} for more details.
      #
      #   @param data [Cadenya::Models::ObjectiveEventDataUserMessage, Cadenya::Models::ObjectiveEventDataToolApprovalRequested, Cadenya::Models::ObjectiveEventDataToolApproved, Cadenya::Models::ObjectiveEventDataToolDenied, Cadenya::Models::ObjectiveEventDataToolCalled, Cadenya::Models::ObjectiveEventDataError, Cadenya::Models::ObjectiveEventDataAssistantMessage, Cadenya::Models::ObjectiveEventDataToolResult, Cadenya::Models::ObjectiveEventDataToolError, Cadenya::Models::ObjectiveEventDataContextWindowCompacted, Cadenya::Models::ObjectiveEventDataMemoryRead, Cadenya::Models::ObjectiveEventDataCancelled, Cadenya::Models::ObjectiveEventDataSubAgentSpawned, Cadenya::Models::ObjectiveEventDataSubAgentUpdated, Cadenya::Models::ObjectiveEventDataFinalized, Cadenya::Models::ObjectiveEventDataNotice, Cadenya::Models::ObjectiveEventDataTimedOut, Cadenya::Models::ObjectiveEventDataReasoning]
      #
      #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #
      #   @param context_window_id [String]
      #
      #   @param duration [String] Elapsed time of the work this event records, when it is known at
      #
      #   @param info [Cadenya::Models::ObjectiveEventInfo]
      #
      #   @param started_at [Time] When the work this event records began. Set together with duration,
    end
  end
end
