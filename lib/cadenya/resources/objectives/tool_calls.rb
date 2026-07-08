# frozen_string_literal: true

module Cadenya
  module Resources
    class Objectives
      class ToolCalls
        # Retrieves a single tool call, including the content the tool returned. Media
        # content (images, audio) is served as short-lived signed URLs.
        #
        # @overload retrieve(tool_call_id, workspace_id:, objective_id:, request_options: {})
        #
        # @param tool_call_id [String] The ID of the tool call to retrieve
        #
        # @param workspace_id [String]
        #
        # @param objective_id [String] The ID of the objective. Supports "external_id:" prefix for external IDs.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Objectives::ObjectiveToolCallWithResult]
        #
        # @see Cadenya::Models::Objectives::ToolCallRetrieveParams
        def retrieve(tool_call_id, params)
          parsed, options = Cadenya::Objectives::ToolCallRetrieveParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          objective_id =
            parsed.delete(:objective_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: [
              "v1/workspaces/%1$s/objectives/%2$s/tool_calls/%3$s",
              workspace_id,
              objective_id,
              tool_call_id
            ],
            model: Cadenya::Objectives::ObjectiveToolCallWithResult,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Objectives::ToolCallListParams} for more details.
        #
        # Lists all tool calls for an objective
        #
        # @overload list(objective_id, workspace_id:, cursor: nil, execution_status: nil, include_info: nil, labels: nil, limit: nil, status: nil, request_options: {})
        #
        # @param objective_id [String] Path param: The objective ID to return tool calls for
        #
        # @param workspace_id [String] Path param
        #
        # @param cursor [String] Query param: Pagination cursor from previous response
        #
        # @param execution_status [Symbol, Cadenya::Models::Objectives::ToolCallListParams::ExecutionStatus] Query param: Filter by tool call execution status. Useful for reverse-harness
        #
        # @param include_info [Boolean] Query param: When set to true you may use more of your alloted API rate-limit
        #
        # @param labels [String] Query param: Filters by metadata labels. Comma-separated key=value pairs,
        #
        # @param limit [Integer] Query param: Maximum number of results to return
        #
        # @param status [Symbol, Cadenya::Models::Objectives::ToolCallListParams::Status] Query param: Filter by tool call status
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Objectives::ObjectiveToolCall>]
        #
        # @see Cadenya::Models::Objectives::ToolCallListParams
        def list(objective_id, params)
          parsed, options = Cadenya::Objectives::ToolCallListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/objectives/%2$s/tool_calls", workspace_id, objective_id],
            query: query.transform_keys(execution_status: "executionStatus", include_info: "includeInfo"),
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::Objectives::ObjectiveToolCall,
            options: options
          )
        end

        # When an agent attempts to use a tool that requires approval, use this endpoint
        # to mark it as approved.
        #
        # @overload approve(tool_call_id, workspace_id:, objective_id:, request_options: {})
        #
        # @param tool_call_id [String] The ID of the tool call to approve
        #
        # @param workspace_id [String]
        #
        # @param objective_id [String] The ID of the objective. Supports "external_id:" prefix for external IDs.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Objectives::ObjectiveToolCall]
        #
        # @see Cadenya::Models::Objectives::ToolCallApproveParams
        def approve(tool_call_id, params)
          parsed, options = Cadenya::Objectives::ToolCallApproveParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          objective_id =
            parsed.delete(:objective_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: [
              "v1/workspaces/%1$s/objectives/%2$s/tool_calls/%3$s:approve",
              workspace_id,
              objective_id,
              tool_call_id
            ],
            model: Cadenya::Objectives::ObjectiveToolCall,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Objectives::ToolCallDenyParams} for more details.
        #
        # When an agent attempts to use a tool that requires approval, use this endpoint
        # to mark it as denied. Use a memo to steer the LLM to a different decision or
        # usage of the tool.
        #
        # @overload deny(tool_call_id, workspace_id:, objective_id:, memo: nil, request_options: {})
        #
        # @param tool_call_id [String] Path param: The ID of the tool call to deny
        #
        # @param workspace_id [String] Path param
        #
        # @param objective_id [String] Path param: The ID of the objective. Supports "external_id:" prefix for external
        #
        # @param memo [String] Body param: A memo to associate to the tool call denial. Use a memo to steer the
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Objectives::ObjectiveToolCall]
        #
        # @see Cadenya::Models::Objectives::ToolCallDenyParams
        def deny(tool_call_id, params)
          parsed, options = Cadenya::Objectives::ToolCallDenyParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          objective_id =
            parsed.delete(:objective_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: [
              "v1/workspaces/%1$s/objectives/%2$s/tool_calls/%3$s:deny",
              workspace_id,
              objective_id,
              tool_call_id
            ],
            body: parsed,
            model: Cadenya::Objectives::ObjectiveToolCall,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Objectives::ToolCallSetContentParams} for more details.
        #
        # For bare tool calls (tool sets with no execution adapter), sets the content an
        # external API consumer supplies for the call — used for human-in-the-loop tools
        # and reverse harnesses that execute tools locally and report results back.
        #
        # @overload set_content(tool_call_id, workspace_id:, objective_id:, content:, request_options: {})
        #
        # @param tool_call_id [String] Path param: The ID of the tool call to set content for
        #
        # @param workspace_id [String] Path param
        #
        # @param objective_id [String] Path param: The ID of the objective. Supports "external_id:" prefix for external
        #
        # @param content [Array<Cadenya::Models::Objectives::SetToolCallContentRequestContentBlock>] Body param: The content to set on the tool call. Mirrors
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Objectives::ObjectiveToolCall]
        #
        # @see Cadenya::Models::Objectives::ToolCallSetContentParams
        def set_content(tool_call_id, params)
          parsed, options = Cadenya::Objectives::ToolCallSetContentParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          objective_id =
            parsed.delete(:objective_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: [
              "v1/workspaces/%1$s/objectives/%2$s/tool_calls/%3$s:setContent",
              workspace_id,
              objective_id,
              tool_call_id
            ],
            body: parsed,
            model: Cadenya::Objectives::ObjectiveToolCall,
            options: options
          )
        end

        # @api private
        #
        # @param client [Cadenya::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
