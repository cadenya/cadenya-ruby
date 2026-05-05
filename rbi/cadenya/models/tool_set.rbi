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

      # Tool set information
      sig { returns(T.nilable(Cadenya::ToolSetInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::ToolSetInfo::OrHash).void }
      attr_writer :info

      sig do
        params(
          metadata: Cadenya::ResourceMetadata::OrHash,
          spec: Cadenya::ToolSetSpec::OrHash,
          info: Cadenya::ToolSetInfo::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        spec:,
        # Tool set information
        info: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::ResourceMetadata,
            spec: Cadenya::ToolSetSpec,
            info: Cadenya::ToolSetInfo
          }
        )
      end
      def to_hash
      end
    end
  end
end
