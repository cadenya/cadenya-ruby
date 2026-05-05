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

        # When set to true you may use more of your alloted API rate-limit
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_info

        sig { params(include_info: T::Boolean).void }
        attr_writer :include_info

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
            include_info: T::Boolean,
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
          # When set to true you may use more of your alloted API rate-limit
          include_info: nil,
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
              include_info: T::Boolean,
              limit: Integer,
              status: Cadenya::Objectives::ToolCallListParams::Status::OrSymbol,
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
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
