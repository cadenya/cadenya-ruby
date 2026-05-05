# frozen_string_literal: true

module Cadenya
  module Models
    class ToolError < Cadenya::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute tool_call_id
      #   The ID of the objective tool call record that encountered an error during
      #   execution.
      #
      #   @return [String, nil]
      optional :tool_call_id, String, api_name: :toolCallId

      # @!method initialize(message: nil, tool_call_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolError} for more details.
      #
      #   @param message [String]
      #
      #   @param tool_call_id [String] The ID of the objective tool call record that encountered an error during execut
    end
  end
end
