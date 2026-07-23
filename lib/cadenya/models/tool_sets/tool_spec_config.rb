# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      # Config defines the adapter to use for the tool. This is used to determine how
      # the tool is called. For example, if the tool is an HTTP tool, the adapter will
      # be Http. If the tool is an inline tool, the adapter will be Inline.
      module ToolSpecConfig
        extend Cadenya::Internal::Type::Union

        discriminator :type

        variant :http, -> { Cadenya::ToolSets::ToolSpecConfigHTTP }

        variant :mcp, -> { Cadenya::ToolSets::ToolSpecConfigMCP }

        variant :openapi, -> { Cadenya::ToolSets::ToolSpecConfigOpenAPI }

        variant :bare, -> { Cadenya::ToolSets::ToolSpecConfigBare }

        # @!method self.variants
        #   @return [Array(Cadenya::Models::ToolSets::ToolSpecConfigHTTP, Cadenya::Models::ToolSets::ToolSpecConfigMCP, Cadenya::Models::ToolSets::ToolSpecConfigOpenAPI, Cadenya::Models::ToolSets::ToolSpecConfigBare)]
      end
    end
  end
end
