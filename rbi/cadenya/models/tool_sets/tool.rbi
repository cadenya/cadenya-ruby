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

        sig do
          params(
            metadata: Cadenya::ResourceMetadata::OrHash,
            spec: Cadenya::ToolSets::ToolSpec::OrHash,
            info: Cadenya::ToolSets::ToolInfo::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          metadata:,
          spec:,
          info: nil
        )
        end

        sig do
          override.returns(
            {
              metadata: Cadenya::ResourceMetadata,
              spec: Cadenya::ToolSets::ToolSpec,
              info: Cadenya::ToolSets::ToolInfo
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
