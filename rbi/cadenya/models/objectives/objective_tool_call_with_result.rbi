# typed: strong

module Cadenya
  module Models
    ObjectiveToolCallWithResult = Objectives::ObjectiveToolCallWithResult

    module Objectives
      class ObjectiveToolCallWithResult < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCallWithResult,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(Cadenya::Objectives::ObjectiveToolCallData) }
        attr_reader :data

        sig do
          params(data: Cadenya::Objectives::ObjectiveToolCallData::OrHash).void
        end
        attr_writer :data

        sig { returns(Cadenya::Objectives::ObjectiveToolCallInfo) }
        attr_reader :info

        sig do
          params(info: Cadenya::Objectives::ObjectiveToolCallInfo::OrHash).void
        end
        attr_writer :info

        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        sig { returns(Cadenya::OperationMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
        attr_writer :metadata

        # Current status of the tool call
        sig do
          returns(
            Cadenya::Objectives::ObjectiveToolCallWithResult::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus::TaggedSymbol
          )
        end
        attr_accessor :execution_status

        # List of resolved secrets used by the tool call
        sig { returns(T::Array[Cadenya::Objectives::ResolvedSecret]) }
        attr_accessor :resolved_secrets

        # ObjectiveToolCallResult is the content a tool returned after execution. Tools
        # can return multiple content blocks, and blocks can be multi-modal (text, image,
        # audio). Media blocks are stored by Cadenya and served as short-lived signed URLs
        # rather than inline bytes.
        sig { returns(T.nilable(Cadenya::Objectives::ObjectiveToolCallResult)) }
        attr_reader :result

        sig do
          params(
            result: Cadenya::Objectives::ObjectiveToolCallResult::OrHash
          ).void
        end
        attr_writer :result

        # ObjectiveToolCallWithResult is an ObjectiveToolCall plus the content the tool
        # returned. Returned by GetObjectiveToolCall.
        sig do
          params(
            data: Cadenya::Objectives::ObjectiveToolCallData::OrHash,
            execution_status:
              Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus::OrSymbol,
            info: Cadenya::Objectives::ObjectiveToolCallInfo::OrHash,
            metadata: Cadenya::OperationMetadata::OrHash,
            status:
              Cadenya::Objectives::ObjectiveToolCallWithResult::Status::OrSymbol,
            resolved_secrets:
              T::Array[Cadenya::Objectives::ResolvedSecret::OrHash],
            result: Cadenya::Objectives::ObjectiveToolCallResult::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          execution_status:,
          info:,
          # Metadata for ephemeral operations and activities (e.g., objectives, executions,
          # runs)
          metadata:,
          # Current status of the tool call
          status:,
          # List of resolved secrets used by the tool call
          resolved_secrets:,
          # ObjectiveToolCallResult is the content a tool returned after execution. Tools
          # can return multiple content blocks, and blocks can be multi-modal (text, image,
          # audio). Media blocks are stored by Cadenya and served as short-lived signed URLs
          # rather than inline bytes.
          result: nil
        )
        end

        sig do
          override.returns(
            {
              data: Cadenya::Objectives::ObjectiveToolCallData,
              execution_status:
                Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus::TaggedSymbol,
              info: Cadenya::Objectives::ObjectiveToolCallInfo,
              metadata: Cadenya::OperationMetadata,
              status:
                Cadenya::Objectives::ObjectiveToolCallWithResult::Status::TaggedSymbol,
              resolved_secrets: T::Array[Cadenya::Objectives::ResolvedSecret],
              result: Cadenya::Objectives::ObjectiveToolCallResult
            }
          )
        end
        def to_hash
        end

        module ExecutionStatus
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOOL_CALL_EXECUTION_STATUS_UNSPECIFIED =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_UNSPECIFIED,
              Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_PENDING =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_PENDING,
              Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_RUNNING =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_RUNNING,
              Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_COMPLETED =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_COMPLETED,
              Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_ERRORED =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_ERRORED,
              Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_WAITING_FOR_CONTENT =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_WAITING_FOR_CONTENT,
              Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::ObjectiveToolCallWithResult::ExecutionStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Current status of the tool call
        module Status
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Cadenya::Objectives::ObjectiveToolCallWithResult::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOOL_CALL_STATUS_UNSPECIFIED =
            T.let(
              :TOOL_CALL_STATUS_UNSPECIFIED,
              Cadenya::Objectives::ObjectiveToolCallWithResult::Status::TaggedSymbol
            )
          TOOL_CALL_STATUS_AUTO_APPROVED =
            T.let(
              :TOOL_CALL_STATUS_AUTO_APPROVED,
              Cadenya::Objectives::ObjectiveToolCallWithResult::Status::TaggedSymbol
            )
          TOOL_CALL_STATUS_WAITING_FOR_APPROVAL =
            T.let(
              :TOOL_CALL_STATUS_WAITING_FOR_APPROVAL,
              Cadenya::Objectives::ObjectiveToolCallWithResult::Status::TaggedSymbol
            )
          TOOL_CALL_STATUS_APPROVED =
            T.let(
              :TOOL_CALL_STATUS_APPROVED,
              Cadenya::Objectives::ObjectiveToolCallWithResult::Status::TaggedSymbol
            )
          TOOL_CALL_STATUS_DENIED =
            T.let(
              :TOOL_CALL_STATUS_DENIED,
              Cadenya::Objectives::ObjectiveToolCallWithResult::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::ObjectiveToolCallWithResult::Status::TaggedSymbol
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
