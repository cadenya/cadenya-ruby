# frozen_string_literal: true

module Cadenya
  module Models
    class ToolCalled < Cadenya::Internal::Type::BaseModel
      # @!attribute tool_call_id
      #   The ID of the objective tool call record that was executed.
      #
      #   @return [String, nil]
      optional :tool_call_id, String, api_name: :toolCallId

      # @!method initialize(tool_call_id: nil)
      #   @param tool_call_id [String] The ID of the objective tool call record that was executed.
    end
  end
end
