# frozen_string_literal: true

module Cadenya
  module Models
    class ToolResult < Cadenya::Internal::Type::BaseModel
      # @!attribute result
      #   ObjectiveToolCallResult is the content a tool returned after execution. Tools
      #   can return multiple content blocks, and blocks can be multi-modal (text, image,
      #   audio). Media blocks are stored by Cadenya and served as short-lived signed URLs
      #   rather than inline bytes.
      #
      #   @return [Cadenya::Models::Objectives::ObjectiveToolCallResult]
      required :result, -> { Cadenya::Objectives::ObjectiveToolCallResult }

      # @!attribute tool_call_id
      #
      #   @return [String]
      required :tool_call_id, String, api_name: :toolCallId

      # @!method initialize(result:, tool_call_id:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolResult} for more details.
      #
      #   @param result [Cadenya::Models::Objectives::ObjectiveToolCallResult] ObjectiveToolCallResult is the content a tool returned after execution.
      #
      #   @param tool_call_id [String]
    end
  end
end
