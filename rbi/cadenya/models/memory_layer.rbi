# typed: strong

module Cadenya
  module Models
    class MemoryLayer < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::MemoryLayer, Cadenya::Internal::AnyHash) }

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(Cadenya::MemoryLayerSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::MemoryLayerSpec::OrHash).void }
      attr_writer :spec

      sig { returns(T.nilable(Cadenya::MemoryLayerInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::MemoryLayerInfo::OrHash).void }
      attr_writer :info

      # MemoryLayer is a named container of memory entries that can be composed into an
      # objective's memory cascade. Layers are workspace-scoped resources. The layer
      # type controls how its entries participate in the agent loop — see
      # MemoryLayerType for details.
      #
      # See "Memory cascade composition" above for how layers compose at lookup time.
      sig do
        params(
          metadata: Cadenya::ResourceMetadata::OrHash,
          spec: Cadenya::MemoryLayerSpec::OrHash,
          info: Cadenya::MemoryLayerInfo::OrHash
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
            spec: Cadenya::MemoryLayerSpec,
            info: Cadenya::MemoryLayerInfo
          }
        )
      end
      def to_hash
      end
    end
  end
end
