# frozen_string_literal: true

module Cadenya
  module Models
    class AssistantToolCall < Cadenya::Internal::Type::BaseModel
      # @!attribute arguments
      #
      #   @return [String]
      required :arguments, String

      # @!attribute function_name
      #
      #   @return [String]
      required :function_name, String, api_name: :functionName

      # @!attribute tool
      #   CallableTool is a union that represents a tool that can be called by an agent.
      #   In Cadenya, a tool that is used within an agent objective might be a
      #   user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
      #   or a Cadenya Tool (one Cadenya provides).
      #
      #   @return [Cadenya::Models::CallableToolTool, Cadenya::Models::CallableToolAgent, Cadenya::Models::CallableToolCadenyaProvidedTool, nil]
      optional :tool, union: -> { Cadenya::CallableTool }

      # @!method initialize(arguments:, function_name:, tool: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AssistantToolCall} for more details.
      #
      #   @param arguments [String]
      #
      #   @param function_name [String]
      #
      #   @param tool [Cadenya::Models::CallableToolTool, Cadenya::Models::CallableToolAgent, Cadenya::Models::CallableToolCadenyaProvidedTool] CallableTool is a union that represents a tool that can be called by an agent. I
    end
  end
end
