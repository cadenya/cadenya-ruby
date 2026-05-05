# frozen_string_literal: true

module Cadenya
  module Models
    class ToolApproved < Cadenya::Internal::Type::BaseModel
      # @!attribute tool_call_id
      #   The ID of the objective tool call record that was approved via the
      #   ApproveToolCall RPC.
      #
      #   @return [String, nil]
      optional :tool_call_id, String, api_name: :toolCallId

      # @!method initialize(tool_call_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolApproved} for more details.
      #
      #   @param tool_call_id [String] The ID of the objective tool call record that was approved via the ApproveToolCa
    end
  end
end
