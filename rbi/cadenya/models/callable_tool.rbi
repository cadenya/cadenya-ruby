# typed: strong

module Cadenya
  module Models
    class CallableTool < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::CallableTool, Cadenya::Internal::AnyHash)
        end

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(T.nilable(Cadenya::ResourceMetadata)) }
      attr_reader :agent

      sig { params(agent: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :agent

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(T.nilable(Cadenya::ResourceMetadata)) }
      attr_reader :cadenya_provided_tool

      sig do
        params(cadenya_provided_tool: Cadenya::ResourceMetadata::OrHash).void
      end
      attr_writer :cadenya_provided_tool

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(T.nilable(Cadenya::ResourceMetadata)) }
      attr_reader :tool

      sig { params(tool: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :tool

      # The JSON name of the variant set in `callable` (e.g. "tool"). Filled by the
      # server; drives the discriminated union in the generated OpenAPI.
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      # CallableTool is a union that represents a tool that can be called by an agent.
      # In Cadenya, a tool that is used within an agent objective might be a
      # user-defined tool (IE: MCP, HTTP), another Agent (useful to separate context),
      # or a Cadenya Tool (one Cadenya provides).
      sig do
        params(
          agent: Cadenya::ResourceMetadata::OrHash,
          cadenya_provided_tool: Cadenya::ResourceMetadata::OrHash,
          tool: Cadenya::ResourceMetadata::OrHash,
          type: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        agent: nil,
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        cadenya_provided_tool: nil,
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        tool: nil,
        # The JSON name of the variant set in `callable` (e.g. "tool"). Filled by the
        # server; drives the discriminated union in the generated OpenAPI.
        type: nil
      )
      end

      sig do
        override.returns(
          {
            agent: Cadenya::ResourceMetadata,
            cadenya_provided_tool: Cadenya::ResourceMetadata,
            tool: Cadenya::ResourceMetadata,
            type: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
