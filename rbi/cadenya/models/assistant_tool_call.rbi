# typed: strong

module Cadenya
  module Models
    class AssistantToolCall < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AssistantToolCall, Cadenya::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :arguments

      sig { params(arguments: String).void }
      attr_writer :arguments

      sig { returns(T.nilable(String)) }
      attr_reader :function_name

      sig { params(function_name: String).void }
      attr_writer :function_name

      # CallableTool is a union that represents a tool that can be called by an agent.
      # In Cadenya, a tool that is used within an agent objective might be a
      # user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
      # or a Cadenya Tool (one Cadenya provides).
      sig { returns(T.nilable(Cadenya::CallableTool)) }
      attr_reader :tool

      sig { params(tool: Cadenya::CallableTool::OrHash).void }
      attr_writer :tool

      sig do
        params(
          arguments: String,
          function_name: String,
          tool: Cadenya::CallableTool::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        arguments: nil,
        function_name: nil,
        # CallableTool is a union that represents a tool that can be called by an agent.
        # In Cadenya, a tool that is used within an agent objective might be a
        # user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
        # or a Cadenya Tool (one Cadenya provides).
        tool: nil
      )
      end

      sig do
        override.returns(
          {
            arguments: String,
            function_name: String,
            tool: Cadenya::CallableTool
          }
        )
      end
      def to_hash
      end
    end
  end
end
