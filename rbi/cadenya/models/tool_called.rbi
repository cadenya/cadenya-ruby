# typed: strong

module Cadenya
  module Models
    class ToolCalled < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolCalled, Cadenya::Internal::AnyHash) }

      # The arguments passed to the tool.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :arguments

      sig { params(arguments: T::Hash[Symbol, T.anything]).void }
      attr_writer :arguments

      # Config defines the adapter to use for the tool. This is used to determine how
      # the tool is called. For example, if the tool is an HTTP tool, the adapter will
      # be Http. If the tool is an inline tool, the adapter will be Inline.
      sig { returns(T.nilable(Cadenya::ToolSets::ToolSpecConfig)) }
      attr_reader :config

      sig { params(config: Cadenya::ToolSets::ToolSpecConfig::OrHash).void }
      attr_writer :config

      # CallableTool is a union that represents a tool that can be called by an agent.
      # In Cadenya, a tool that is used within an agent objective might be a
      # user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
      # or a Cadenya Tool (one Cadenya provides).
      sig { returns(T.nilable(Cadenya::CallableTool)) }
      attr_reader :tool

      sig { params(tool: Cadenya::CallableTool::OrHash).void }
      attr_writer :tool

      # The ID of the objective tool call record that was executed.
      sig { returns(T.nilable(String)) }
      attr_reader :tool_call_id

      sig { params(tool_call_id: String).void }
      attr_writer :tool_call_id

      sig do
        params(
          arguments: T::Hash[Symbol, T.anything],
          config: Cadenya::ToolSets::ToolSpecConfig::OrHash,
          tool: Cadenya::CallableTool::OrHash,
          tool_call_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The arguments passed to the tool.
        arguments: nil,
        # Config defines the adapter to use for the tool. This is used to determine how
        # the tool is called. For example, if the tool is an HTTP tool, the adapter will
        # be Http. If the tool is an inline tool, the adapter will be Inline.
        config: nil,
        # CallableTool is a union that represents a tool that can be called by an agent.
        # In Cadenya, a tool that is used within an agent objective might be a
        # user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
        # or a Cadenya Tool (one Cadenya provides).
        tool: nil,
        # The ID of the objective tool call record that was executed.
        tool_call_id: nil
      )
      end

      sig do
        override.returns(
          {
            arguments: T::Hash[Symbol, T.anything],
            config: Cadenya::ToolSets::ToolSpecConfig,
            tool: Cadenya::CallableTool,
            tool_call_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
