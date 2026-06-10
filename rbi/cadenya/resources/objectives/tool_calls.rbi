# typed: strong

module Cadenya
  module Resources
    class Objectives
      class ToolCalls
        # Retrieves a single tool call, including the content the tool returned. Media
        # content (images, audio) is served as short-lived signed URLs.
        sig do
          params(
            tool_call_id: String,
            workspace_id: String,
            objective_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Objectives::ObjectiveToolCallWithResult)
        end
        def retrieve(
          # The ID of the tool call to retrieve
          tool_call_id,
          workspace_id:,
          # The ID of the objective. Supports "external_id:" prefix for external IDs.
          objective_id:,
          request_options: {}
        )
        end

        # Lists all tool calls for an objective
        sig do
          params(
            objective_id: String,
            workspace_id: String,
            cursor: String,
            include_info: T::Boolean,
            limit: Integer,
            status: Cadenya::Objectives::ToolCallListParams::Status::OrSymbol,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[
              Cadenya::Objectives::ObjectiveToolCall
            ]
          )
        end
        def list(
          # Path param: The objective ID to return tool calls for
          objective_id,
          # Path param
          workspace_id:,
          # Query param: Pagination cursor from previous response
          cursor: nil,
          # Query param: When set to true you may use more of your alloted API rate-limit
          include_info: nil,
          # Query param: Maximum number of results to return
          limit: nil,
          # Query param: Filter by tool call status
          status: nil,
          request_options: {}
        )
        end

        # When an agent attempts to use a tool that requires approval, use this endpoint
        # to mark it as approved.
        sig do
          params(
            tool_call_id: String,
            workspace_id: String,
            objective_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Objectives::ObjectiveToolCall)
        end
        def approve(
          # The ID of the tool call to approve
          tool_call_id,
          workspace_id:,
          # The ID of the objective. Supports "external_id:" prefix for external IDs.
          objective_id:,
          request_options: {}
        )
        end

        # When an agent attempts to use a tool that requires approval, use this endpoint
        # to mark it as denied. Use a memo to steer the LLM to a different decision or
        # usage of the tool.
        sig do
          params(
            tool_call_id: String,
            workspace_id: String,
            objective_id: String,
            memo: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Objectives::ObjectiveToolCall)
        end
        def deny(
          # Path param: The ID of the tool call to deny
          tool_call_id,
          # Path param
          workspace_id:,
          # Path param: The ID of the objective. Supports "external_id:" prefix for external
          # IDs.
          objective_id:,
          # Body param: A memo to associate to the tool call denial. Use a memo to steer the
          # LLM to a different decision or usage of the tool.
          memo: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Cadenya::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
