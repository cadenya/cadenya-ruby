# typed: strong

module Cadenya
  module Models
    # CallableTool is a union that represents a tool that can be called by an agent.
    # In Cadenya, a tool that is used within an agent objective might be a
    # user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
    # or a Cadenya Tool (one Cadenya provides).
    module CallableTool
      extend Cadenya::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Cadenya::CallableToolTool,
            Cadenya::CallableToolAgent,
            Cadenya::CallableToolCadenyaProvidedTool
          )
        end

      sig { override.returns(T::Array[Cadenya::CallableTool::Variants]) }
      def self.variants
      end
    end
  end
end
