# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataToolApprovalRequested < Cadenya::Internal::Type::BaseModel
      # @!attribute tool_approval_requested
      #
      #   @return [Cadenya::Models::ToolApprovalRequested]
      required :tool_approval_requested,
               -> {
                 Cadenya::ToolApprovalRequested
               },
               api_name: :toolApprovalRequested

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataToolApprovalRequested::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataToolApprovalRequested::Type }

      # @!method initialize(tool_approval_requested:, type:)
      #   @param tool_approval_requested [Cadenya::Models::ToolApprovalRequested]
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataToolApprovalRequested::Type]

      # @see Cadenya::Models::ObjectiveEventDataToolApprovalRequested#type
      module Type
        extend Cadenya::Internal::Type::Enum

        TOOL_APPROVAL_REQUESTED = :toolApprovalRequested

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
