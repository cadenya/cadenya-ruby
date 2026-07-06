# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # @see Cadenya::Resources::Objectives::ToolCalls#list
      class ObjectiveToolCall < Cadenya::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveToolCallData]
        required :data, -> { Cadenya::Objectives::ObjectiveToolCallData }

        # @!attribute metadata
        #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
        #   runs)
        #
        #   @return [Cadenya::Models::OperationMetadata]
        required :metadata, -> { Cadenya::OperationMetadata }

        # @!attribute status
        #   Current status of the tool call
        #
        #   @return [Symbol, Cadenya::Models::Objectives::ObjectiveToolCall::Status]
        required :status, enum: -> { Cadenya::Objectives::ObjectiveToolCall::Status }

        # @!attribute info
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveToolCallInfo, nil]
        optional :info, -> { Cadenya::Objectives::ObjectiveToolCallInfo }

        response_only do
          # @!attribute execution_status
          #
          #   @return [Symbol, Cadenya::Models::Objectives::ObjectiveToolCall::ExecutionStatus]
          required :execution_status,
                   enum: -> { Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus },
                   api_name: :executionStatus
        end

        # @!method initialize(data:, execution_status:, metadata:, status:, info: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ObjectiveToolCall} for more details.
        #
        #   ObjectiveToolCall is a record of a tool call made during an objective's
        #   execution. Tool calls are mutable — their status changes as they are approved,
        #   denied, or executed.
        #
        #   @param data [Cadenya::Models::Objectives::ObjectiveToolCallData]
        #
        #   @param execution_status [Symbol, Cadenya::Models::Objectives::ObjectiveToolCall::ExecutionStatus]
        #
        #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
        #
        #   @param status [Symbol, Cadenya::Models::Objectives::ObjectiveToolCall::Status] Current status of the tool call
        #
        #   @param info [Cadenya::Models::Objectives::ObjectiveToolCallInfo]

        # @see Cadenya::Models::Objectives::ObjectiveToolCall#execution_status
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
        # @see Cadenya::Models::Objectives::ObjectiveToolCall#status
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

    ObjectiveToolCall = Objectives::ObjectiveToolCall
  end
end
