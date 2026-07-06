# frozen_string_literal: true

module Cadenya
  module Models
    class ToolCalled < Cadenya::Internal::Type::BaseModel
      # @!attribute arguments
      #   The arguments passed to the tool.
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :arguments, Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]

      # @!attribute config
      #   Config defines the adapter to use for the tool. This is used to determine how
      #   the tool is called. For example, if the tool is an HTTP tool, the adapter will
      #   be Http. If the tool is an inline tool, the adapter will be Inline.
      #
      #   @return [Cadenya::Models::ToolSets::ToolSpecConfig, nil]
      optional :config, -> { Cadenya::ToolSets::ToolSpecConfig }

      # @!attribute tool
      #   CallableTool is a union that represents a tool that can be called by an agent.
      #   In Cadenya, a tool that is used within an agent objective might be a
      #   user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
      #   or a Cadenya Tool (one Cadenya provides).
      #
      #   @return [Cadenya::Models::CallableTool, nil]
      optional :tool, -> { Cadenya::CallableTool }

      # @!attribute tool_call_id
      #   The ID of the objective tool call record that was executed.
      #
      #   @return [String, nil]
      optional :tool_call_id, String, api_name: :toolCallId

      # @!method initialize(arguments: nil, config: nil, tool: nil, tool_call_id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ToolCalled} for more details.
      #
      #   @param arguments [Hash{Symbol=>Object}] The arguments passed to the tool.
      #
      #   @param config [Cadenya::Models::ToolSets::ToolSpecConfig] Config defines the adapter to use for the tool.
      #
      #   @param tool [Cadenya::Models::CallableTool] CallableTool is a union that represents a tool that can be called by an agent. I
      #
      #   @param tool_call_id [String] The ID of the objective tool call record that was executed.
    end
  end
end
