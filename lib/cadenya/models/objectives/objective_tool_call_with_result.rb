# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # @see Cadenya::Resources::Objectives::ToolCalls#retrieve
      class ObjectiveToolCallWithResult < Cadenya::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveToolCallData]
        required :data, -> { Cadenya::Objectives::ObjectiveToolCallData }

        # @!attribute info
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveToolCallInfo]
        required :info, -> { Cadenya::Objectives::ObjectiveToolCallInfo }

        # @!attribute metadata
        #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
        #   runs)
        #
        #   @return [Cadenya::Models::OperationMetadata]
        required :metadata, -> { Cadenya::OperationMetadata }

        # @!attribute status
        #   Current status of the tool call
        #
        #   @return [Symbol, Cadenya::Models::Objectives::ObjectiveToolCallWithResult::Status]
        required :status, enum: -> { Cadenya::Objectives::ObjectiveToolCallWithResult::Status }

        response_only do
          # @!attribute execution_status
          #
          #   @return [Symbol, Cadenya::Models::Objectives::ObjectiveToolCallWithResult::ExecutionStatus]
          required :execution_status,
                   enum: -> { Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus },
                   api_name: :executionStatus

          # @!attribute resolved_secrets
          #   List of resolved secrets used by the tool call
          #
          #   @return [Array<Cadenya::Models::Objectives::ResolvedSecret>]
          required :resolved_secrets,
                   -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Objectives::ResolvedSecret] },
                   api_name: :resolvedSecrets

          # @!attribute result
          #   ObjectiveToolCallResult is the content a tool returned after execution. Tools
          #   can return multiple content blocks, and blocks can be multi-modal (text, image,
          #   audio). Media blocks are stored by Cadenya and served as short-lived signed URLs
          #   rather than inline bytes.
          #
          #   @return [Cadenya::Models::Objectives::ObjectiveToolCallResult, nil]
          optional :result, -> { Cadenya::Objectives::ObjectiveToolCallResult }
        end

        # @!method initialize(data:, execution_status:, info:, metadata:, status:, resolved_secrets:, result: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ObjectiveToolCallWithResult} for more details.
        #
        #   ObjectiveToolCallWithResult is an ObjectiveToolCall plus the content the tool
        #   returned. Returned by GetObjectiveToolCall.
        #
        #   @param data [Cadenya::Models::Objectives::ObjectiveToolCallData]
        #
        #   @param execution_status [Symbol, Cadenya::Models::Objectives::ObjectiveToolCallWithResult::ExecutionStatus]
        #
        #   @param info [Cadenya::Models::Objectives::ObjectiveToolCallInfo]
        #
        #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
        #
        #   @param status [Symbol, Cadenya::Models::Objectives::ObjectiveToolCallWithResult::Status] Current status of the tool call
        #
        #   @param resolved_secrets [Array<Cadenya::Models::Objectives::ResolvedSecret>] List of resolved secrets used by the tool call
        #
        #   @param result [Cadenya::Models::Objectives::ObjectiveToolCallResult] ObjectiveToolCallResult is the content a tool returned after execution.

        # @see Cadenya::Models::Objectives::ObjectiveToolCallWithResult#execution_status
        module ExecutionStatus
          extend Cadenya::Internal::Type::Enum

          TOOL_CALL_EXECUTION_STATUS_UNSPECIFIED = :TOOL_CALL_EXECUTION_STATUS_UNSPECIFIED
          TOOL_CALL_EXECUTION_STATUS_PENDING = :TOOL_CALL_EXECUTION_STATUS_PENDING
          TOOL_CALL_EXECUTION_STATUS_RUNNING = :TOOL_CALL_EXECUTION_STATUS_RUNNING
          TOOL_CALL_EXECUTION_STATUS_COMPLETED = :TOOL_CALL_EXECUTION_STATUS_COMPLETED
          TOOL_CALL_EXECUTION_STATUS_ERRORED = :TOOL_CALL_EXECUTION_STATUS_ERRORED
          TOOL_CALL_EXECUTION_STATUS_WAITING_FOR_CONTENT = :TOOL_CALL_EXECUTION_STATUS_WAITING_FOR_CONTENT

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Current status of the tool call
        #
        # @see Cadenya::Models::Objectives::ObjectiveToolCallWithResult#status
        module Status
          extend Cadenya::Internal::Type::Enum

          TOOL_CALL_STATUS_UNSPECIFIED = :TOOL_CALL_STATUS_UNSPECIFIED
          TOOL_CALL_STATUS_AUTO_APPROVED = :TOOL_CALL_STATUS_AUTO_APPROVED
          TOOL_CALL_STATUS_WAITING_FOR_APPROVAL = :TOOL_CALL_STATUS_WAITING_FOR_APPROVAL
          TOOL_CALL_STATUS_APPROVED = :TOOL_CALL_STATUS_APPROVED
          TOOL_CALL_STATUS_DENIED = :TOOL_CALL_STATUS_DENIED

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    ObjectiveToolCallWithResult = Objectives::ObjectiveToolCallWithResult
  end
end
