# frozen_string_literal: true

module Cadenya
  module Models
    class CallableTool < Cadenya::Internal::Type::BaseModel
      # @!attribute agent
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata, nil]
      optional :agent, -> { Cadenya::ResourceMetadata }

      # @!attribute cadenya_provided_tool
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata, nil]
      optional :cadenya_provided_tool, -> { Cadenya::ResourceMetadata }, api_name: :cadenyaProvidedTool

      # @!attribute tool
      #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @return [Cadenya::Models::ResourceMetadata, nil]
      optional :tool, -> { Cadenya::ResourceMetadata }

      # @!attribute type
      #   The JSON name of the variant set in `callable` (e.g. "tool"). Filled by the
      #   server; drives the discriminated union in the generated OpenAPI.
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(agent: nil, cadenya_provided_tool: nil, tool: nil, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::CallableTool} for more details.
      #
      #   CallableTool is a union that represents a tool that can be called by an agent.
      #   In Cadenya, a tool that is used within an agent objective might be a
      #   user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
      #   or a Cadenya Tool (one Cadenya provides).
      #
      #   @param agent [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param cadenya_provided_tool [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param tool [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      #
      #   @param type [String] The JSON name of the variant set in `callable` (e.g. "tool"). Filled by the
    end
  end
end
