# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataToolCalled < Cadenya::Internal::Type::BaseModel
      # @!attribute tool_called
      #
      #   @return [Cadenya::Models::ToolCalled]
      required :tool_called, -> { Cadenya::ToolCalled }, api_name: :toolCalled

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataToolCalled::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataToolCalled::Type }

      # @!method initialize(tool_called:, type:)
      #   @param tool_called [Cadenya::Models::ToolCalled]
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataToolCalled::Type]

      # @see Cadenya::Models::ObjectiveEventDataToolCalled#type
      module Type
        extend Cadenya::Internal::Type::Enum

        TOOL_CALLED = :toolCalled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
