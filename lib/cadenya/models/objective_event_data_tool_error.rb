# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataToolError < Cadenya::Internal::Type::BaseModel
      # @!attribute tool_error
      #
      #   @return [Cadenya::Models::ToolError]
      required :tool_error, -> { Cadenya::ToolError }, api_name: :toolError

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataToolError::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataToolError::Type }

      # @!method initialize(tool_error:, type:)
      #   @param tool_error [Cadenya::Models::ToolError]
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataToolError::Type]

      # @see Cadenya::Models::ObjectiveEventDataToolError#type
      module Type
        extend Cadenya::Internal::Type::Enum

        TOOL_ERROR = :toolError

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
