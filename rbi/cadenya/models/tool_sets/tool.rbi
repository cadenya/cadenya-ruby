# typed: strong

module Cadenya
  module Models
    module ToolSets
      class Tool < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::Tool, Cadenya::Internal::AnyHash)
          end

        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        sig { returns(Cadenya::ResourceMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
        attr_writer :metadata

        sig { returns(Cadenya::ToolSets::ToolSpec) }
        attr_reader :spec

        sig { params(spec: Cadenya::ToolSets::ToolSpec::OrHash).void }
        attr_writer :spec

        sig { returns(T.nilable(Cadenya::ToolSets::ToolInfo)) }
        attr_reader :info

        sig { params(info: Cadenya::ToolSets::ToolInfo::OrHash).void }
        attr_writer :info

        # The current lifecycle state of the tool. Output only. Use the :omit and :restore
        # actions to transition; tool set syncs may also update it.
        sig { returns(Cadenya::ToolSets::Tool::State::TaggedSymbol) }
        attr_accessor :state

        sig do
          params(
            metadata: Cadenya::ResourceMetadata::OrHash,
            spec: Cadenya::ToolSets::ToolSpec::OrHash,
            state: Cadenya::ToolSets::Tool::State::OrSymbol,
            info: Cadenya::ToolSets::ToolInfo::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          metadata:,
          spec:,
          # The current lifecycle state of the tool. Output only. Use the :omit and :restore
          # actions to transition; tool set syncs may also update it.
          state:,
          info: nil
        )
        end

        sig do
          override.returns(
            {
              metadata: Cadenya::ResourceMetadata,
              spec: Cadenya::ToolSets::ToolSpec,
              state: Cadenya::ToolSets::Tool::State::TaggedSymbol,
              info: Cadenya::ToolSets::ToolInfo
            }
          )
        end
        def to_hash
        end

        # The current lifecycle state of the tool. Output only. Use the :omit and :restore
        # actions to transition; tool set syncs may also update it.
        module State
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Cadenya::ToolSets::Tool::State) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STATE_UNSPECIFIED =
            T.let(
              :STATE_UNSPECIFIED,
              Cadenya::ToolSets::Tool::State::TaggedSymbol
            )
          STATE_AVAILABLE =
            T.let(
              :STATE_AVAILABLE,
              Cadenya::ToolSets::Tool::State::TaggedSymbol
            )
          STATE_OMITTED =
            T.let(:STATE_OMITTED, Cadenya::ToolSets::Tool::State::TaggedSymbol)
          STATE_ARCHIVED =
            T.let(:STATE_ARCHIVED, Cadenya::ToolSets::Tool::State::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Cadenya::ToolSets::Tool::State::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
