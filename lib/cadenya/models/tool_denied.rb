# frozen_string_literal: true

module Cadenya
  module Models
    class ToolDenied < Cadenya::Internal::Type::BaseModel
      # @!attribute memo
      #   The memo provided by the reviewer when denying the tool call. This is passed to
      #   the agent to provide further instructions.
      #
      #   @return [String]
      required :memo, String

      # @!attribute tool_call_id
      #   The ID of the objective tool call record that was denied via the DenyToolCall
      #   RPC.
      #
      #   @return [String]
      required :tool_call_id, String, api_name: :toolCallId

      # @!method initialize(memo:, tool_call_id:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolDenied} for more details.
      #
      #   @param memo [String] The memo provided by the reviewer when denying the tool call. This is passed to
      #
      #   @param tool_call_id [String] The ID of the objective tool call record that was denied via the DenyToolCall RP
    end
  end
end
