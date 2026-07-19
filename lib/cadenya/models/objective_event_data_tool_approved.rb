# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataToolApproved < Cadenya::Internal::Type::BaseModel
      # @!attribute tool_approved
      #
      #   @return [Cadenya::Models::ToolApproved]
      required :tool_approved, -> { Cadenya::ToolApproved }, api_name: :toolApproved

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataToolApproved::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataToolApproved::Type }

      # @!method initialize(tool_approved:, type:)
      #   @param tool_approved [Cadenya::Models::ToolApproved]
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataToolApproved::Type]

      # @see Cadenya::Models::ObjectiveEventDataToolApproved#type
      module Type
        extend Cadenya::Internal::Type::Enum

        TOOL_APPROVED = :toolApproved

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
