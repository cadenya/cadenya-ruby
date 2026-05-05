# frozen_string_literal: true

module Cadenya
  module Models
    class ToolApprovalRequested < Cadenya::Internal::Type::BaseModel
      # @!attribute tool_call_id
      #   The ID of the objective tool call record. Use this ID with the ApproveToolCall
      #   or DenyToolCall RPCs to approve or deny the tool call.
      #
      #   @return [String, nil]
      optional :tool_call_id, String, api_name: :toolCallId

      # @!method initialize(tool_call_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolApprovalRequested} for more details.
      #
      #   @param tool_call_id [String] The ID of the objective tool call record. Use this ID with the ApproveToolCall o
    end
  end
end
