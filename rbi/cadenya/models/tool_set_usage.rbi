# typed: strong

module Cadenya
  module Models
    class ToolSetUsage < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ToolSetUsage, Cadenya::Internal::AnyHash)
        end

      # When the assignment was created.
      sig { returns(Time) }
      attr_accessor :assigned_at

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_accessor :agent

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_accessor :agent_variation

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_accessor :model

      # ToolSetUsage describes one agent variation that uses the tool set (or, when
      # filtering by tool, an individual tool within it).
      sig do
        params(
          assigned_at: Time,
          agent: Cadenya::ResourceMetadata::OrHash,
          agent_variation: Cadenya::ResourceMetadata::OrHash,
          model: Cadenya::ResourceMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # When the assignment was created.
        assigned_at:,
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        agent:,
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        agent_variation:,
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        model:
      )
      end

      sig do
        override.returns(
          {
            assigned_at: Time,
            agent: Cadenya::ResourceMetadata,
            agent_variation: Cadenya::ResourceMetadata,
            model: Cadenya::ResourceMetadata
          }
        )
      end
      def to_hash
      end
    end
  end
end
