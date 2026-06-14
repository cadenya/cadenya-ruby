# typed: strong

module Cadenya
  module Models
    ToolSetSecret = ToolSets::ToolSetSecret

    module ToolSets
      class ToolSetSecret < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::ToolSets::ToolSetSecret, Cadenya::Internal::AnyHash)
          end

        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        sig { returns(Cadenya::ResourceMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
        attr_writer :metadata

        sig { returns(Cadenya::ToolSets::ToolSetSecretSpec) }
        attr_reader :spec

        sig { params(spec: Cadenya::ToolSets::ToolSetSecretSpec::OrHash).void }
        attr_writer :spec

        # Tool set secret information
        sig { returns(T.nilable(Cadenya::ToolSets::ToolSetSecretInfo)) }
        attr_reader :info

        sig { params(info: Cadenya::ToolSets::ToolSetSecretInfo::OrHash).void }
        attr_writer :info

        sig do
          params(
            metadata: Cadenya::ResourceMetadata::OrHash,
            spec: Cadenya::ToolSets::ToolSetSecretSpec::OrHash,
            info: Cadenya::ToolSets::ToolSetSecretInfo::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          metadata:,
          spec:,
          # Tool set secret information
          info: nil
        )
        end

        sig do
          override.returns(
            {
              metadata: Cadenya::ResourceMetadata,
              spec: Cadenya::ToolSets::ToolSetSecretSpec,
              info: Cadenya::ToolSets::ToolSetSecretInfo
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
