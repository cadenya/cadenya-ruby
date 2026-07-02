# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class ConfigMcp < Cadenya::Internal::Type::BaseModel
        # @!attribute annotations
        #   Behavior hints synced from the MCP server's tool definition (ToolAnnotations in
        #   the MCP specification). All hints are advisory: servers are not required to send
        #   them, and clients should not rely on them for security decisions. Absent hints
        #   keep the MCP spec defaults (destructiveHint and openWorldHint default to true;
        #   readOnlyHint and idempotentHint default to false).
        #
        #   @return [Cadenya::Models::ToolSets::McpAnnotations, nil]
        optional :annotations, -> { Cadenya::ToolSets::McpAnnotations }

        # @!method initialize(annotations: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::ConfigMcp} for more details.
        #
        #   @param annotations [Cadenya::Models::ToolSets::McpAnnotations] Behavior hints synced from the MCP server's tool definition
      end
    end
  end
end
