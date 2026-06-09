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

      # The current lifecycle state of the agent. Output only. Agents are created in
      # STATE_DRAFT; use the :publish, :unpublish, :archive, and :unarchive actions to
      # transition between states.
      sig { returns(Cadenya::Agent::State::TaggedSymbol) }
      attr_accessor :state

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
          state: Cadenya::Agent::State::OrSymbol,
          info: Cadenya::AgentInfo::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        # Agent specification (user-provided configuration)
        spec:,
        # The current lifecycle state of the agent. Output only. Agents are created in
        # STATE_DRAFT; use the :publish, :unpublish, :archive, and :unarchive actions to
        # transition between states.
        state:,
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
            state: Cadenya::Agent::State::TaggedSymbol,
            info: Cadenya::AgentInfo
          }
        )
      end
      def to_hash
      end

      # The current lifecycle state of the agent. Output only. Agents are created in
      # STATE_DRAFT; use the :publish, :unpublish, :archive, and :unarchive actions to
      # transition between states.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Cadenya::Agent::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(:STATE_UNSPECIFIED, Cadenya::Agent::State::TaggedSymbol)
        STATE_DRAFT = T.let(:STATE_DRAFT, Cadenya::Agent::State::TaggedSymbol)
        STATE_PUBLISHED =
          T.let(:STATE_PUBLISHED, Cadenya::Agent::State::TaggedSymbol)
        STATE_ARCHIVED =
          T.let(:STATE_ARCHIVED, Cadenya::Agent::State::TaggedSymbol)

        sig { override.returns(T::Array[Cadenya::Agent::State::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
