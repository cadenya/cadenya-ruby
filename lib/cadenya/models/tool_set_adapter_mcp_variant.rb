# frozen_string_literal: true

module Cadenya
  module Models
    class ToolSetAdapterMCPVariant < Cadenya::Internal::Type::BaseModel
      # @!attribute mcp
      #
      #   @return [Cadenya::Models::ToolSetAdapterMCP]
      required :mcp, -> { Cadenya::ToolSetAdapterMCP }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ToolSetAdapterMCPVariant::Type]
      required :type, enum: -> { Cadenya::ToolSetAdapterMCPVariant::Type }

      # @!method initialize(mcp:, type:)
      #   @param mcp [Cadenya::Models::ToolSetAdapterMCP]
      #   @param type [Symbol, Cadenya::Models::ToolSetAdapterMCPVariant::Type]

      # @see Cadenya::Models::ToolSetAdapterMCPVariant#type
      module Type
        extend Cadenya::Internal::Type::Enum

        MCP = :mcp

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
