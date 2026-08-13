# frozen_string_literal: true

module Cadenya
  module Models
    class AssistantMessage < Cadenya::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String, nil]
      optional :content, String

      # @!attribute tool_calls
      #
      #   @return [Array<Cadenya::Models::AssistantToolCall>]
      required :tool_calls,
               -> { Cadenya::Internal::Type::ArrayOf[Cadenya::AssistantToolCall] },
               api_name: :toolCalls

      # @!method initialize(content: nil, tool_calls:)
      #   @param content [String]
      #   @param tool_calls [Array<Cadenya::Models::AssistantToolCall>]
    end
  end
end
