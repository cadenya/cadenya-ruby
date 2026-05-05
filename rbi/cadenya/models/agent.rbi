# typed: strong

module Cadenya
  module Models
    class Agent < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Agent, Cadenya::Internal::AnyHash) }

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :metadata

      # Agent specification (user-provided configuration)
      sig { returns(Cadenya::AgentSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::AgentSpec::OrHash).void }
      attr_writer :spec

      # AgentInfo contains simple information about an agent for display or quick
      # reference
      sig { returns(T.nilable(Cadenya::AgentInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::AgentInfo::OrHash).void }
      attr_writer :info

      # Agent resource
      sig do
        params(
          metadata: Cadenya::ResourceMetadata::OrHash,
          spec: Cadenya::AgentSpec::OrHash,
          info: Cadenya::AgentInfo::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        # Agent specification (user-provided configuration)
        spec:,
        # AgentInfo contains simple information about an agent for display or quick
        # reference
        info: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::ResourceMetadata,
            spec: Cadenya::AgentSpec,
            info: Cadenya::AgentInfo
          }
        )
      end
      def to_hash
      end
    end
  end
end
