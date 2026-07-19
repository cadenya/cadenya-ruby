# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      class MCPAnnotations < Cadenya::Internal::Type::BaseModel
        # @!attribute destructive_hint
        #   If true, the tool may perform destructive updates to its environment. Only
        #   meaningful when read_only_hint is false.
        #
        #   @return [Boolean, nil]
        optional :destructive_hint, Cadenya::Internal::Type::Boolean, api_name: :destructiveHint

        # @!attribute idempotent_hint
        #   If true, calling the tool repeatedly with the same arguments has no additional
        #   effect. Only meaningful when read_only_hint is false.
        #
        #   @return [Boolean, nil]
        optional :idempotent_hint, Cadenya::Internal::Type::Boolean, api_name: :idempotentHint

        # @!attribute open_world_hint
        #   If true, the tool may interact with an "open world" of external entities (e.g.
        #   web search); if false, its domain is closed.
        #
        #   @return [Boolean, nil]
        optional :open_world_hint, Cadenya::Internal::Type::Boolean, api_name: :openWorldHint

        # @!attribute read_only_hint
        #   If true, the tool does not modify its environment.
        #
        #   @return [Boolean, nil]
        optional :read_only_hint, Cadenya::Internal::Type::Boolean, api_name: :readOnlyHint

        # @!attribute title
        #   A human-readable title for the tool.
        #
        #   @return [String, nil]
        optional :title, String

        # @!method initialize(destructive_hint: nil, idempotent_hint: nil, open_world_hint: nil, read_only_hint: nil, title: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::MCPAnnotations} for more details.
        #
        #   Behavior hints synced from the MCP server's tool definition (ToolAnnotations in
        #   the MCP specification). All hints are advisory: servers are not required to send
        #   them, and clients should not rely on them for security decisions. Absent hints
        #   keep the MCP spec defaults (destructiveHint and openWorldHint default to true;
        #   readOnlyHint and idempotentHint default to false).
        #
        #   @param destructive_hint [Boolean] If true, the tool may perform destructive updates to its environment.
        #
        #   @param idempotent_hint [Boolean] If true, calling the tool repeatedly with the same arguments has no
        #
        #   @param open_world_hint [Boolean] If true, the tool may interact with an "open world" of external
        #
        #   @param read_only_hint [Boolean] If true, the tool does not modify its environment.
        #
        #   @param title [String] A human-readable title for the tool.
      end
    end
  end
end
