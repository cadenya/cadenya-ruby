# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ToolSpec < Cadenya::Internal::Type::BaseModel
        # @!attribute config
        #   Config defines the adapter to use for the tool. This is used to determine how
        #   the tool is called. For example, if the tool is an HTTP tool, the adapter will
        #   be Http. If the tool is an inline tool, the adapter will be Inline.
        #
        #   @return [Cadenya::Models::ToolSets::ToolSpecConfig]
        required :config, -> { Cadenya::ToolSets::ToolSpecConfig }

        # @!attribute description
        #
        #   @return [String]
        required :description, String

        # @!attribute parameters
        #   The tool's JSON Schema, as handed to the LLM. Required, but may be the empty
        #   object `{}` for a tool that takes no arguments. Requiring it rather than
        #   defaulting it means a misspelled field name (`inputSchema`, say) is a 400
        #   instead of a silently parameterless tool.
        #
        #   @return [Hash{Symbol=>Object}]
        required :parameters, Cadenya::Internal::Type::HashOf[Cadenya::Internal::Type::Unknown]

        # @!attribute requires_approval
        #
        #   @return [Boolean]
        required :requires_approval, Cadenya::Internal::Type::Boolean, api_name: :requiresApproval

        # @!attribute llm_tool_name
        #   The name provided to the LLM, which may differ from the metadata.name on the
        #   tool. LLMs have specific length and format requirements, and tool set sources
        #   may not comply with them, so Cadenya does its best to format names into a usable
        #   format.
        #
        #   @return [String, nil]
        optional :llm_tool_name, String, api_name: :llmToolName

        # @!method initialize(config:, description:, parameters:, requires_approval:, llm_tool_name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::ToolSpec} for more details.
        #
        #   @param config [Cadenya::Models::ToolSets::ToolSpecConfig] Config defines the adapter to use for the tool.
        #
        #   @param description [String]
        #
        #   @param parameters [Hash{Symbol=>Object}] The tool's JSON Schema, as handed to the LLM. Required, but may be the
        #
        #   @param requires_approval [Boolean]
        #
        #   @param llm_tool_name [String] The name provided to the LLM, which may differ from the metadata.name on the too
      end
    end
  end
end
