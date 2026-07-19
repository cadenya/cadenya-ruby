# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ToolSpecConfigMCP < Cadenya::Internal::Type::BaseModel
        # @!attribute mcp
        #
        #   @return [Cadenya::Models::ToolSets::ConfigMCP]
        required :mcp, -> { Cadenya::ToolSets::ConfigMCP }

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::ToolSets::ToolSpecConfigMCP::Type]
        required :type, enum: -> { Cadenya::ToolSets::ToolSpecConfigMCP::Type }

        # @!method initialize(mcp:, type:)
        #   @param mcp [Cadenya::Models::ToolSets::ConfigMCP]
        #   @param type [Symbol, Cadenya::Models::ToolSets::ToolSpecConfigMCP::Type]

        # @see Cadenya::Models::ToolSets::ToolSpecConfigMCP#type
        module Type
          extend Cadenya::Internal::Type::Enum

          MCP = :mcp

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
