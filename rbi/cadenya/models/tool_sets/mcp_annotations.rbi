# typed: strong

module Cadenya
  module Models
    module ToolSets
      class MCPAnnotations < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::MCPAnnotations, Cadenya::Internal::AnyHash)
          end

        # If true, the tool may perform destructive updates to its environment. Only
        # meaningful when read_only_hint is false.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :destructive_hint

        sig { params(destructive_hint: T::Boolean).void }
        attr_writer :destructive_hint

        # If true, calling the tool repeatedly with the same arguments has no additional
        # effect. Only meaningful when read_only_hint is false.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :idempotent_hint

        sig { params(idempotent_hint: T::Boolean).void }
        attr_writer :idempotent_hint

        # If true, the tool may interact with an "open world" of external entities (e.g.
        # web search); if false, its domain is closed.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :open_world_hint

        sig { params(open_world_hint: T::Boolean).void }
        attr_writer :open_world_hint

        # If true, the tool does not modify its environment.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :read_only_hint

        sig { params(read_only_hint: T::Boolean).void }
        attr_writer :read_only_hint

        # A human-readable title for the tool.
        sig { returns(T.nilable(String)) }
        attr_reader :title

        sig { params(title: String).void }
        attr_writer :title

        # Behavior hints synced from the MCP server's tool definition (ToolAnnotations in
        # the MCP specification). All hints are advisory: servers are not required to send
        # them, and clients should not rely on them for security decisions. Absent hints
        # keep the MCP spec defaults (destructiveHint and openWorldHint default to true;
        # readOnlyHint and idempotentHint default to false).
        sig do
          params(
            destructive_hint: T::Boolean,
            idempotent_hint: T::Boolean,
            open_world_hint: T::Boolean,
            read_only_hint: T::Boolean,
            title: String
          ).returns(T.attached_class)
        end
        def self.new(
          # If true, the tool may perform destructive updates to its environment. Only
          # meaningful when read_only_hint is false.
          destructive_hint: nil,
          # If true, calling the tool repeatedly with the same arguments has no additional
          # effect. Only meaningful when read_only_hint is false.
          idempotent_hint: nil,
          # If true, the tool may interact with an "open world" of external entities (e.g.
          # web search); if false, its domain is closed.
          open_world_hint: nil,
          # If true, the tool does not modify its environment.
          read_only_hint: nil,
          # A human-readable title for the tool.
          title: nil
        )
        end

        sig do
          override.returns(
            {
              destructive_hint: T::Boolean,
              idempotent_hint: T::Boolean,
              open_world_hint: T::Boolean,
              read_only_hint: T::Boolean,
              title: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
