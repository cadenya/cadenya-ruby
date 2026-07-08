# typed: strong

module Cadenya
  module Models
    module Objectives
      class ToolCallListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ToolCallListParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :objective_id

        # Pagination cursor from previous response
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Filter by tool call execution status. Useful for reverse-harness polling of bare
        # tool calls waiting for externally supplied content
        # (TOOL_CALL_EXECUTION_STATUS_WAITING_FOR_CONTENT).
        sig do
          returns(
            T.nilable(
              Cadenya::Objectives::ToolCallListParams::ExecutionStatus::OrSymbol
            )
          )
        end
        attr_reader :execution_status

        sig do
          params(
            execution_status:
              Cadenya::Objectives::ToolCallListParams::ExecutionStatus::OrSymbol
          ).void
        end
        attr_writer :execution_status

        # When set to true you may use more of your alloted API rate-limit
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_info

        sig { params(include_info: T::Boolean).void }
        attr_writer :include_info

        # Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        sig { returns(T.nilable(String)) }
        attr_reader :labels

        sig { params(labels: String).void }
        attr_writer :labels

        # Maximum number of results to return
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Filter by tool call status
        sig do
          returns(
            T.nilable(Cadenya::Objectives::ToolCallListParams::Status::OrSymbol)
          )
        end
        attr_reader :status

        sig do
          params(
            status: Cadenya::Objectives::ToolCallListParams::Status::OrSymbol
          ).void
        end
        attr_writer :status

        sig do
          params(
            workspace_id: String,
            objective_id: String,
            cursor: String,
            execution_status:
              Cadenya::Objectives::ToolCallListParams::ExecutionStatus::OrSymbol,
            include_info: T::Boolean,
            labels: String,
            limit: Integer,
            status: Cadenya::Objectives::ToolCallListParams::Status::OrSymbol,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          objective_id:,
          # Pagination cursor from previous response
          cursor: nil,
          # Filter by tool call execution status. Useful for reverse-harness polling of bare
          # tool calls waiting for externally supplied content
          # (TOOL_CALL_EXECUTION_STATUS_WAITING_FOR_CONTENT).
          execution_status: nil,
          # When set to true you may use more of your alloted API rate-limit
          include_info: nil,
          # Filters by metadata labels. Comma-separated key=value pairs, e.g.
          # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
          # semantics).
          labels: nil,
          # Maximum number of results to return
          limit: nil,
          # Filter by tool call status
          status: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              objective_id: String,
              cursor: String,
              execution_status:
                Cadenya::Objectives::ToolCallListParams::ExecutionStatus::OrSymbol,
              include_info: T::Boolean,
              labels: String,
              limit: Integer,
              status: Cadenya::Objectives::ToolCallListParams::Status::OrSymbol,
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Filter by tool call execution status. Useful for reverse-harness polling of bare
        # tool calls waiting for externally supplied content
        # (TOOL_CALL_EXECUTION_STATUS_WAITING_FOR_CONTENT).
        module ExecutionStatus
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Cadenya::Objectives::ToolCallListParams::ExecutionStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOOL_CALL_EXECUTION_STATUS_UNSPECIFIED =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_UNSPECIFIED,
              Cadenya::Objectives::ToolCallListParams::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_PENDING =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_PENDING,
              Cadenya::Objectives::ToolCallListParams::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_RUNNING =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_RUNNING,
              Cadenya::Objectives::ToolCallListParams::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_COMPLETED =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_COMPLETED,
              Cadenya::Objectives::ToolCallListParams::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_ERRORED =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_ERRORED,
              Cadenya::Objectives::ToolCallListParams::ExecutionStatus::TaggedSymbol
            )
          TOOL_CALL_EXECUTION_STATUS_WAITING_FOR_CONTENT =
            T.let(
              :TOOL_CALL_EXECUTION_STATUS_WAITING_FOR_CONTENT,
              Cadenya::Objectives::ToolCallListParams::ExecutionStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::ToolCallListParams::ExecutionStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Filter by tool call status
        module Status
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::Objectives::ToolCallListParams::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOOL_CALL_STATUS_UNSPECIFIED =
            T.let(
              :TOOL_CALL_STATUS_UNSPECIFIED,
              Cadenya::Objectives::ToolCallListParams::Status::TaggedSymbol
            )
          TOOL_CALL_STATUS_AUTO_APPROVED =
            T.let(
              :TOOL_CALL_STATUS_AUTO_APPROVED,
              Cadenya::Objectives::ToolCallListParams::Status::TaggedSymbol
            )
          TOOL_CALL_STATUS_WAITING_FOR_APPROVAL =
            T.let(
              :TOOL_CALL_STATUS_WAITING_FOR_APPROVAL,
              Cadenya::Objectives::ToolCallListParams::Status::TaggedSymbol
            )
          TOOL_CALL_STATUS_APPROVED =
            T.let(
              :TOOL_CALL_STATUS_APPROVED,
              Cadenya::Objectives::ToolCallListParams::Status::TaggedSymbol
            )
          TOOL_CALL_STATUS_DENIED =
            T.let(
              :TOOL_CALL_STATUS_DENIED,
              Cadenya::Objectives::ToolCallListParams::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Objectives::ToolCallListParams::Status::TaggedSymbol
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
