# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetAdapterMcp < Cadenya::Internal::Type::BaseModel
      # @!attribute exclude_tools
      #   Top-level filter with simple boolean logic (no nesting)
      #
      #   @return [Cadenya::Models::ToolFilter, nil]
      optional :exclude_tools, -> { Cadenya::ToolFilter }, api_name: :excludeTools

      # @!attribute headers
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, Cadenya::Internal::Type::HashOf[String]

      # @!attribute include_tools
      #   Top-level filter with simple boolean logic (no nesting)
      #
      #   @return [Cadenya::Models::ToolFilter, nil]
      optional :include_tools, -> { Cadenya::ToolFilter }, api_name: :includeTools

      # @!attribute tool_approvals
      #   Approval filters that will automatically set the approval requirement on tools
      #   synced from an external source
      #
      #   @return [Cadenya::Models::ApprovalRequirementFilter, nil]
      optional :tool_approvals, -> { Cadenya::ApprovalRequirementFilter }, api_name: :toolApprovals

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(exclude_tools: nil, headers: nil, include_tools: nil, tool_approvals: nil, url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetAdapterMcp} for more details.
      #
      #   @param exclude_tools [Cadenya::Models::ToolFilter] Top-level filter with simple boolean logic (no nesting)
      #
      #   @param headers [Hash{Symbol=>String}]
      #
      #   @param include_tools [Cadenya::Models::ToolFilter] Top-level filter with simple boolean logic (no nesting)
      #
      #   @param tool_approvals [Cadenya::Models::ApprovalRequirementFilter] Approval filters that will automatically set the approval requirement on tools s
      #
      #   @param url [String]
    end
  end
end
