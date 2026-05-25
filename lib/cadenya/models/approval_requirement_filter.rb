# frozen_string_literal: true

module Cadenya
  module Models
    class ApprovalRequirementFilter < Cadenya::Internal::Type::BaseModel
      # @!attribute always
      #
      #   @return [Boolean, nil]
      optional :always, Cadenya::Internal::Type::Boolean

      # @!attribute only
      #   Top-level filter with simple boolean logic (no nesting)
      #
      #   @return [Cadenya::Models::ToolFilter, nil]
      optional :only, -> { Cadenya::ToolFilter }

      # @!method initialize(always: nil, only: nil)
      #   Approval filters that will automatically set the approval requirement on tools
      #   synced from an external source
      #
      #   @param always [Boolean]
      #
      #   @param only [Cadenya::Models::ToolFilter] Top-level filter with simple boolean logic (no nesting)
    end
  end
end
