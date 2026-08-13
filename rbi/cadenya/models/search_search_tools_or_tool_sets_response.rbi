# typed: strong

module Cadenya
  module Models
    class SearchSearchToolsOrToolSetsResponse < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::Models::SearchSearchToolsOrToolSetsResponse,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(T::Array[Cadenya::Agent]) }
      attr_accessor :agents

      sig { returns(T::Array[Cadenya::ToolSets::Tool]) }
      attr_accessor :tools

      sig { returns(T::Array[Cadenya::ToolSet]) }
      attr_accessor :tool_sets

      sig do
        params(
          agents: T::Array[Cadenya::Agent::OrHash],
          tools: T::Array[Cadenya::ToolSets::Tool::OrHash],
          tool_sets: T::Array[Cadenya::ToolSet::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(agents: nil, tools: nil, tool_sets: nil)
      end

      sig do
        override.returns(
          {
            agents: T::Array[Cadenya::Agent],
            tools: T::Array[Cadenya::ToolSets::Tool],
            tool_sets: T::Array[Cadenya::ToolSet]
          }
        )
      end
      def to_hash
      end
    end
  end
end
