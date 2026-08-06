# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetAdapterMCP < Cadenya::Internal::Type::BaseModel
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

      # @!attribute just_in_time
      #   Defines behavior for just-in-time capable tool set adapters (IE: MCP).
      #
      #   @return [Cadenya::Models::ToolSetAdapterMCP::JustInTime, nil]
      optional :just_in_time, -> { Cadenya::ToolSetAdapterMCP::JustInTime }, api_name: :justInTime

      # @!attribute tool_approvals
      #   Approval filters that will automatically set the approval requirement on tools
      #   synced from an external source
      #
      #   @return [Cadenya::Models::ApprovalRequirementFilterAlways, Cadenya::Models::ApprovalRequirementFilterOnly, nil]
      optional :tool_approvals, union: -> { Cadenya::ApprovalRequirementFilter }, api_name: :toolApprovals

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(exclude_tools: nil, headers: nil, include_tools: nil, just_in_time: nil, tool_approvals: nil, url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetAdapterMCP} for more details.
      #
      #   @param exclude_tools [Cadenya::Models::ToolFilter] Top-level filter with simple boolean logic (no nesting)
      #
      #   @param headers [Hash{Symbol=>String}]
      #
      #   @param include_tools [Cadenya::Models::ToolFilter] Top-level filter with simple boolean logic (no nesting)
      #
      #   @param just_in_time [Cadenya::Models::ToolSetAdapterMCP::JustInTime] Defines behavior for just-in-time capable tool set adapters (IE: MCP).
      #
      #   @param tool_approvals [Cadenya::Models::ApprovalRequirementFilterAlways, Cadenya::Models::ApprovalRequirementFilterOnly] Approval filters that will automatically set the approval requirement on tools s
      #
      #   @param url [String]

      # @see Cadenya::Models::ToolSetAdapterMCP#just_in_time
      class JustInTime < Cadenya::Internal::Type::BaseModel
        # @!attribute enabled
        #
        #   @return [Boolean, nil]
        optional :enabled, Cadenya::Internal::Type::Boolean

        # @!attribute fail_objective_on_tool_list_error
        #   If set, an objective will automatically be failed if tools cannot be loaded in
        #   the initial stages of an objective being created. Tools are loaded
        #   asynchronously, so this setting is useful for ensuring that an objective
        #   continued any further if tools are not available.
        #
        #   @return [Boolean, nil]
        optional :fail_objective_on_tool_list_error,
                 Cadenya::Internal::Type::Boolean,
                 api_name: :failObjectiveOnToolListError

        # @!method initialize(enabled: nil, fail_objective_on_tool_list_error: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSetAdapterMCP::JustInTime} for more details.
        #
        #   Defines behavior for just-in-time capable tool set adapters (IE: MCP).
        #
        #   @param enabled [Boolean]
        #
        #   @param fail_objective_on_tool_list_error [Boolean] If set, an objective will automatically be failed if tools cannot be loaded
      end
    end
  end
end
