# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataToolResult < Cadenya::Internal::Type::BaseModel
      # @!attribute tool_result
      #
      #   @return [Cadenya::Models::ToolResult]
      required :tool_result, -> { Cadenya::ToolResult }, api_name: :toolResult

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataToolResult::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataToolResult::Type }

      # @!method initialize(tool_result:, type:)
      #   @param tool_result [Cadenya::Models::ToolResult]
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataToolResult::Type]

      # @see Cadenya::Models::ObjectiveEventDataToolResult#type
      module Type
        extend Cadenya::Internal::Type::Enum

        TOOL_RESULT = :toolResult

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
