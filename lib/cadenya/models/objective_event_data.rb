# frozen_string_literal: true

module Cadenya
  module Models
    module ObjectiveEventData
      extend Cadenya::Internal::Type::Union

      discriminator :type

      variant :userMessage, -> { Cadenya::ObjectiveEventDataUserMessage }

      variant :toolApprovalRequested, -> { Cadenya::ObjectiveEventDataToolApprovalRequested }

      variant :toolApproved, -> { Cadenya::ObjectiveEventDataToolApproved }

      variant :toolDenied, -> { Cadenya::ObjectiveEventDataToolDenied }

      variant :toolCalled, -> { Cadenya::ObjectiveEventDataToolCalled }

      variant :error, -> { Cadenya::ObjectiveEventDataError }

      variant :assistantMessage, -> { Cadenya::ObjectiveEventDataAssistantMessage }

      variant :toolResult, -> { Cadenya::ObjectiveEventDataToolResult }

      variant :toolError, -> { Cadenya::ObjectiveEventDataToolError }

      variant :contextWindowCompacted, -> { Cadenya::ObjectiveEventDataContextWindowCompacted }

      variant :memoryRead, -> { Cadenya::ObjectiveEventDataMemoryRead }

      variant :cancelled, -> { Cadenya::ObjectiveEventDataCancelled }

      variant :subAgentSpawned, -> { Cadenya::ObjectiveEventDataSubAgentSpawned }

      variant :subAgentUpdated, -> { Cadenya::ObjectiveEventDataSubAgentUpdated }

      variant :finalized, -> { Cadenya::ObjectiveEventDataFinalized }

      variant :notice, -> { Cadenya::ObjectiveEventDataNotice }

      variant :timedOut, -> { Cadenya::ObjectiveEventDataTimedOut }

      # @!method self.variants
      #   @return [Array(Cadenya::Models::ObjectiveEventDataUserMessage, Cadenya::Models::ObjectiveEventDataToolApprovalRequested, Cadenya::Models::ObjectiveEventDataToolApproved, Cadenya::Models::ObjectiveEventDataToolDenied, Cadenya::Models::ObjectiveEventDataToolCalled, Cadenya::Models::ObjectiveEventDataError, Cadenya::Models::ObjectiveEventDataAssistantMessage, Cadenya::Models::ObjectiveEventDataToolResult, Cadenya::Models::ObjectiveEventDataToolError, Cadenya::Models::ObjectiveEventDataContextWindowCompacted, Cadenya::Models::ObjectiveEventDataMemoryRead, Cadenya::Models::ObjectiveEventDataCancelled, Cadenya::Models::ObjectiveEventDataSubAgentSpawned, Cadenya::Models::ObjectiveEventDataSubAgentUpdated, Cadenya::Models::ObjectiveEventDataFinalized, Cadenya::Models::ObjectiveEventDataNotice, Cadenya::Models::ObjectiveEventDataTimedOut)]
    end
  end
end
