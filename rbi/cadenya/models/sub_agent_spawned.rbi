# typed: strong

module Cadenya
  module Models
    class SubAgentSpawned < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::SubAgentSpawned, Cadenya::Internal::AnyHash)
        end

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_accessor :agent

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(Cadenya::OperationMetadata) }
      attr_accessor :objective

      sig { returns(String) }
      attr_accessor :task

      sig do
        params(
          agent: Cadenya::ResourceMetadata::OrHash,
          objective: Cadenya::OperationMetadata::OrHash,
          task: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        agent:,
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        objective:,
        task:
      )
      end

      sig do
        override.returns(
          {
            agent: Cadenya::ResourceMetadata,
            objective: Cadenya::OperationMetadata,
            task: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
