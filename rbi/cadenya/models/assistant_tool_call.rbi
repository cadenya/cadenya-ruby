# typed: strong

module Cadenya
  module Models
    class AssistantToolCall < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AssistantToolCall, Cadenya::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :arguments

      sig { returns(String) }
      attr_accessor :function_name

      # CallableTool is a union that represents a tool that can be called by an agent.
      # In Cadenya, a tool that is used within an agent objective might be a
      # user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
      # or a Cadenya Tool (one Cadenya provides).
      sig { returns(T.nilable(Cadenya::CallableTool::Variants)) }
      attr_reader :tool

      sig do
        params(
          tool:
            T.any(
              Cadenya::CallableToolTool::OrHash,
              Cadenya::CallableToolAgent::OrHash,
              Cadenya::CallableToolCadenyaProvidedTool::OrHash
            )
        ).void
      end
      attr_writer :tool

      sig do
        params(
          arguments: String,
          function_name: String,
          tool:
            T.any(
              Cadenya::CallableToolTool::OrHash,
              Cadenya::CallableToolAgent::OrHash,
              Cadenya::CallableToolCadenyaProvidedTool::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(
        arguments:,
        function_name:,
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
            tool: Cadenya::CallableTool::Variants
          }
        )
      end
      def to_hash
      end
    end
  end
end
