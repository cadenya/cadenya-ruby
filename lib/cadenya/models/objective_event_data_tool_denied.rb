# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataToolDenied < Cadenya::Internal::Type::BaseModel
      # @!attribute tool_denied
      #
      #   @return [Cadenya::Models::ToolDenied]
      required :tool_denied, -> { Cadenya::ToolDenied }, api_name: :toolDenied

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataToolDenied::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataToolDenied::Type }

      # @!method initialize(tool_denied:, type:)
      #   @param tool_denied [Cadenya::Models::ToolDenied]
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataToolDenied::Type]

      # @see Cadenya::Models::ObjectiveEventDataToolDenied#type
      module Type
        extend Cadenya::Internal::Type::Enum

        TOOL_DENIED = :toolDenied

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
