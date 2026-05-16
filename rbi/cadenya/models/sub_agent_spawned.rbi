# typed: strong

module Cadenya
  module Models
    class SubAgentSpawned < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::SubAgentSpawned, Cadenya::Internal::AnyHash)
        end

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(T.nilable(Cadenya::ResourceMetadata)) }
      attr_reader :agent

      sig { params(agent: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :agent

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(T.nilable(Cadenya::OperationMetadata)) }
      attr_reader :objective

      sig { params(objective: Cadenya::OperationMetadata::OrHash).void }
      attr_writer :objective

      sig { returns(T.nilable(String)) }
      attr_reader :task

      sig { params(task: String).void }
      attr_writer :task

      sig do
        params(
          agent: Cadenya::ResourceMetadata::OrHash,
          objective: Cadenya::OperationMetadata::OrHash,
          task: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        agent: nil,
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        objective: nil,
        task: nil
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
