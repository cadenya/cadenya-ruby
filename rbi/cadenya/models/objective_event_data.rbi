# typed: strong

module Cadenya
  module Models
    module ObjectiveEventData
      extend Cadenya::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataUserMessage,
            Cadenya::ObjectiveEventDataToolApprovalRequested,
            Cadenya::ObjectiveEventDataToolApproved,
            Cadenya::ObjectiveEventDataToolDenied,
            Cadenya::ObjectiveEventDataToolCalled,
            Cadenya::ObjectiveEventDataError,
            Cadenya::ObjectiveEventDataAssistantMessage,
            Cadenya::ObjectiveEventDataToolResult,
            Cadenya::ObjectiveEventDataToolError,
            Cadenya::ObjectiveEventDataContextWindowCompacted,
            Cadenya::ObjectiveEventDataMemoryRead,
            Cadenya::ObjectiveEventDataCancelled,
            Cadenya::ObjectiveEventDataSubAgentSpawned,
            Cadenya::ObjectiveEventDataSubAgentUpdated,
            Cadenya::ObjectiveEventDataFinalized,
            Cadenya::ObjectiveEventDataNotice,
            Cadenya::ObjectiveEventDataTimedOut,
            Cadenya::ObjectiveEventDataReasoning
          )
        end

      sig { override.returns(T::Array[Cadenya::ObjectiveEventData::Variants]) }
      def self.variants
      end
    end
  end
end
