# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetAdapterMcp < Cadenya::Internal::Type::BaseModel
      # @!attribute exclude_tools
      #   Top-level filter with simple boolean logic (no nesting)
      #
      #   @return [Cadenya::Models::McpToolFilter, nil]
      optional :exclude_tools, -> { Cadenya::McpToolFilter }, api_name: :excludeTools

      # @!attribute headers
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, Cadenya::Internal::Type::HashOf[String]

      # @!attribute include_tools
      #   Top-level filter with simple boolean logic (no nesting)
      #
      #   @return [Cadenya::Models::McpToolFilter, nil]
      optional :include_tools, -> { Cadenya::McpToolFilter }, api_name: :includeTools

      # @!attribute tool_approvals
      #   Approval filters that will automatically set the approval requirement on the
      #   tools synced from the MCP server
      #
      #   @return [Cadenya::Models::ToolSetAdapterMcp::ToolApprovals, nil]
      optional :tool_approvals, -> { Cadenya::ToolSetAdapterMcp::ToolApprovals }, api_name: :toolApprovals

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(exclude_tools: nil, headers: nil, include_tools: nil, tool_approvals: nil, url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolSetAdapterMcp} for more details.
      #
      #   @param exclude_tools [Cadenya::Models::McpToolFilter] Top-level filter with simple boolean logic (no nesting)
      #
      #   @param headers [Hash{Symbol=>String}]
      #
      #   @param include_tools [Cadenya::Models::McpToolFilter] Top-level filter with simple boolean logic (no nesting)
      #
      #   @param tool_approvals [Cadenya::Models::ToolSetAdapterMcp::ToolApprovals] Approval filters that will automatically set the approval requirement on the too
      #
      #   @param url [String]

      # @see Cadenya::Models::ToolSetAdapterMcp#tool_approvals
      class ToolApprovals < Cadenya::Internal::Type::BaseModel
        # @!attribute always
        #
        #   @return [Boolean, nil]
        optional :always, Cadenya::Internal::Type::Boolean

        # @!attribute only
        #   Top-level filter with simple boolean logic (no nesting)
        #
        #   @return [Cadenya::Models::McpToolFilter, nil]
        optional :only, -> { Cadenya::McpToolFilter }

        # @!method initialize(always: nil, only: nil)
        #   Approval filters that will automatically set the approval requirement on the
        #   tools synced from the MCP server
        #
        #   @param always [Boolean]
        #
        #   @param only [Cadenya::Models::McpToolFilter] Top-level filter with simple boolean logic (no nesting)
      end
    end
  end
end
