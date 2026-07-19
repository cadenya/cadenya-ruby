# typed: strong

module Cadenya
  module Models
    module ToolSets
      class ConfigMCP < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::ConfigMCP, Cadenya::Internal::AnyHash)
          end

        # Behavior hints synced from the MCP server's tool definition (ToolAnnotations in
        # the MCP specification). All hints are advisory: servers are not required to send
        # them, and clients should not rely on them for security decisions. Absent hints
        # keep the MCP spec defaults (destructiveHint and openWorldHint default to true;
        # readOnlyHint and idempotentHint default to false).
        sig { returns(T.nilable(Cadenya::ToolSets::MCPAnnotations)) }
        attr_reader :annotations

        sig do
          params(annotations: Cadenya::ToolSets::MCPAnnotations::OrHash).void
        end
        attr_writer :annotations

        sig do
          params(
            annotations: Cadenya::ToolSets::MCPAnnotations::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Behavior hints synced from the MCP server's tool definition (ToolAnnotations in
          # the MCP specification). All hints are advisory: servers are not required to send
          # them, and clients should not rely on them for security decisions. Absent hints
          # keep the MCP spec defaults (destructiveHint and openWorldHint default to true;
          # readOnlyHint and idempotentHint default to false).
          annotations: nil
        )
        end

        sig do
          override.returns({ annotations: Cadenya::ToolSets::MCPAnnotations })
        end
        def to_hash
        end
      end
    end
  end
end
