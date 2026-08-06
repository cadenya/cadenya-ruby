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

      # @!attribute type
      #   The JSON name of the variant set in `requirement` (e.g. "always"). Required from
      #   clients on writes, filled by the server on reads; drives the discriminated union
      #   in the generated OpenAPI.
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(always: nil, only: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ApprovalRequirementFilter} for more details.
      #
      #   Approval filters that will automatically set the approval requirement on tools
      #   synced from an external source
      #
      #   @param always [Boolean]
      #
      #   @param only [Cadenya::Models::ToolFilter] Top-level filter with simple boolean logic (no nesting)
      #
      #   @param type [String] The JSON name of the variant set in `requirement` (e.g. "always").
    end
  end
end
