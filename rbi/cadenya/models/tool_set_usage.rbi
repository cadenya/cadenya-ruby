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
      sig { returns(T.nilable(Cadenya::ResourceMetadata)) }
      attr_reader :agent

      sig { params(agent: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :agent

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(T.nilable(Cadenya::ResourceMetadata)) }
      attr_reader :agent_variation

      sig { params(agent_variation: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :agent_variation

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(T.nilable(Cadenya::ResourceMetadata)) }
      attr_reader :model

      sig { params(model: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :model

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
        agent: nil,
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        agent_variation: nil,
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        model: nil
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
