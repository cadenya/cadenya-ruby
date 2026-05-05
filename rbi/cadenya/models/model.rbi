# typed: strong

module Cadenya
  module Models
    class Model < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Model, Cadenya::Internal::AnyHash) }

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :metadata

      # Model specification
      sig { returns(Cadenya::ModelSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::ModelSpec::OrHash).void }
      attr_writer :spec

      sig do
        params(
          metadata: Cadenya::ResourceMetadata::OrHash,
          spec: Cadenya::ModelSpec::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        # Model specification
        spec:
      )
      end

      sig do
        override.returns(
          { metadata: Cadenya::ResourceMetadata, spec: Cadenya::ModelSpec }
        )
      end
      def to_hash
      end
    end
  end
end
