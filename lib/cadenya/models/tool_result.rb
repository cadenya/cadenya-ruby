# frozen_string_literal: true

module Cadenya
  module Models
    class ToolResult < Cadenya::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String, nil]
      optional :content, String

      # @!attribute tool_call_id
      #
      #   @return [String, nil]
      optional :tool_call_id, String, api_name: :toolCallId

      # @!method initialize(content: nil, tool_call_id: nil)
      #   @param content [String]
      #   @param tool_call_id [String]
    end
  end
end
