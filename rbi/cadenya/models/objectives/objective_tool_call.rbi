# typed: strong

module Cadenya
  module Models
    ObjectiveToolCall = Objectives::ObjectiveToolCall

    module Objectives
      class ObjectiveToolCall < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCall,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(Cadenya::Objectives::ObjectiveToolCallData) }
        attr_reader :data

        sig do
          params(data: Cadenya::Objectives::ObjectiveToolCallData::OrHash).void
        end
        attr_writer :data

        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        sig { returns(Cadenya::OperationMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
        attr_writer :metadata

        # Current status of the tool call
        sig do
          returns(Cadenya::Objectives::ObjectiveToolCall::Status::TaggedSymbol)
        end
        attr_accessor :status

        sig { returns(T.nilable(Cadenya::Objectives::ObjectiveToolCallInfo)) }
        attr_reader :info

        sig do
          params(info: Cadenya::Objectives::ObjectiveToolCallInfo::OrHash).void
        end
        attr_writer :info

        sig do
          returns(
            T.nilable(
              Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus::TaggedSymbol
            )
          )
        end
        attr_reader :execution_status

        sig do
          params(
            execution_status:
              Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus::OrSymbol
          ).void
        end
        attr_writer :execution_status

        # ObjectiveToolCall is a record of a tool call made during an objective's
        # execution. Tool calls are mutable — their status changes as they are approved,
        # denied, or executed.
        sig do
          params(
            data: Cadenya::Objectives::ObjectiveToolCallData::OrHash,
            metadata: Cadenya::OperationMetadata::OrHash,
            status: Cadenya::Objectives::ObjectiveToolCall::Status::OrSymbol,
            execution_status:
              Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus::OrSymbol,
            info: Cadenya::Objectives::ObjectiveToolCallInfo::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # Metadata for ephemeral operations and activities (e.g., objectives, executions,
          # runs)
          metadata:,
          # Current status of the tool call
          status:,
          execution_status: nil,
          info: nil
        )
        end

        sig do
          override.returns(
            {
              data: Cadenya::Objectives::ObjectiveToolCallData,
              metadata: Cadenya::OperationMetadata,
              status:
                Cadenya::Objectives::ObjectiveToolCall::Status::TaggedSymbol,
              execution_status:
                Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus::TaggedSymbol,
              info: Cadenya::Objectives::ObjectiveToolCallInfo
            }
          )
        end
        def to_hash
        end

        # Current status of the tool call
        module Status
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::Objectives::ObjectiveToolCall::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOOL_CALL_STATUS_UNSPECIFIED =
            T.let(
              :TOOL_CALL_STATUS_UNSPECIFIED,
              Cadenya::Objectives::ObjectiveToolCall::Status::TaggedSymbol
            )
          TOOL_CALL_STATUS_AUTO_APPROVED =
            T.let(
              :TOOL_CALL_STATUS_AUTO_APPROVED,
              Cadenya::Objectives::ObjectiveToolCall::Status::TaggedSymbol
            )
          TOOL_CALL_STATUS_WAITING_FOR_APPROVAL =
            T.let(
              :TOOL_CALL_STATUS_WAITING_FOR_APPROVAL,
              Cadenya::Objectives::ObjectiveToolCall::Status::TaggedSymbol
            )
          TOOL_CALL_STATUS_APPROVED =
            T.let(
              :TOOL_CALL_STATUS_APPROVED,
              Cadenya::Objectives::ObjectiveToolCall::Status::TaggedSymbol
            )
          TOOL_CALL_STATUS_DENIED =
            T.let(
              :TOOL_CALL_STATUS_DENIED,
              Cadenya::Objectives::ObjectiveToolCall::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::ObjectiveToolCall::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module ExecutionStatus
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOOL_CALL_EXECUTION_STATUS_UNSPECIFIED =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_UNSPECIFIED,
              Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_PENDING =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_PENDING,
              Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_RUNNING =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_RUNNING,
              Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_COMPLETED =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_COMPLETED,
              Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_ERRORED =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_ERRORED,
              Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::ObjectiveToolCall::ExecutionStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
