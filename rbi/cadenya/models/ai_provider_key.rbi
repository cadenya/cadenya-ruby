# typed: strong

module Cadenya
  module Models
    class AIProviderKey < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::AIProviderKey, Cadenya::Internal::AnyHash)
        end

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(Cadenya::AIProviderKeySpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::AIProviderKeySpec::OrHash).void }
      attr_writer :spec

      # AIProviderKey is a customer-provided (BYOK) credential for an AI provider,
      # scoped to a workspace. The secret value is never returned in responses.
      sig do
        params(
          metadata: Cadenya::ResourceMetadata::OrHash,
          spec: Cadenya::AIProviderKeySpec::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        spec:
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::ResourceMetadata,
            spec: Cadenya::AIProviderKeySpec
          }
        )
      end
      def to_hash
      end
    end
  end
end
