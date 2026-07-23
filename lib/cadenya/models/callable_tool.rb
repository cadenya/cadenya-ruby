# frozen_string_literal: true

module Cadenya
  module Models
    # CallableTool is a union that represents a tool that can be called by an agent.
    # In Cadenya, a tool that is used within an agent objective might be a
    # user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
    # or a Cadenya Tool (one Cadenya provides).
    module CallableTool
      extend Cadenya::Internal::Type::Union

      discriminator :type

      variant :tool, -> { Cadenya::CallableToolTool }

      variant :agent, -> { Cadenya::CallableToolAgent }

      variant :cadenyaProvidedTool, -> { Cadenya::CallableToolCadenyaProvidedTool }

      # @!method self.variants
      #   @return [Array(Cadenya::Models::CallableToolTool, Cadenya::Models::CallableToolAgent, Cadenya::Models::CallableToolCadenyaProvidedTool)]
    end
  end
end
