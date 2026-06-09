# typed: strong

module Cadenya
  module Models
    class ToolSet < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ToolSet, Cadenya::Internal::AnyHash) }

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(Cadenya::ToolSetSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::ToolSetSpec::OrHash).void }
      attr_writer :spec

      # The current lifecycle state of the tool set. Output only. Tool sets are created
      # STATE_ACTIVE; use the :archive and :unarchive actions to transition between
      # states.
      sig { returns(Cadenya::ToolSet::State::TaggedSymbol) }
      attr_accessor :state

      # Tool set information
      sig { returns(T.nilable(Cadenya::ToolSetInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::ToolSetInfo::OrHash).void }
      attr_writer :info

      sig do
        params(
          metadata: Cadenya::ResourceMetadata::OrHash,
          spec: Cadenya::ToolSetSpec::OrHash,
          state: Cadenya::ToolSet::State::OrSymbol,
          info: Cadenya::ToolSetInfo::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        spec:,
        # The current lifecycle state of the tool set. Output only. Tool sets are created
        # STATE_ACTIVE; use the :archive and :unarchive actions to transition between
        # states.
        state:,
        # Tool set information
        info: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::ResourceMetadata,
            spec: Cadenya::ToolSetSpec,
            state: Cadenya::ToolSet::State::TaggedSymbol,
            info: Cadenya::ToolSetInfo
          }
        )
      end
      def to_hash
      end

      # The current lifecycle state of the tool set. Output only. Tool sets are created
      # STATE_ACTIVE; use the :archive and :unarchive actions to transition between
      # states.
      module State
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Cadenya::ToolSet::State) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATE_UNSPECIFIED =
          T.let(:STATE_UNSPECIFIED, Cadenya::ToolSet::State::TaggedSymbol)
        STATE_ACTIVE =
          T.let(:STATE_ACTIVE, Cadenya::ToolSet::State::TaggedSymbol)
        STATE_ARCHIVED =
          T.let(:STATE_ARCHIVED, Cadenya::ToolSet::State::TaggedSymbol)

        sig do
          override.returns(T::Array[Cadenya::ToolSet::State::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
