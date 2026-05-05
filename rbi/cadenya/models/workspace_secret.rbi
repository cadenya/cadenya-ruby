# typed: strong

module Cadenya
  module Models
    class WorkspaceSecret < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::WorkspaceSecret, Cadenya::Internal::AnyHash)
        end

      # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
      sig { returns(Cadenya::ResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(Cadenya::WorkspaceSecretSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::WorkspaceSecretSpec::OrHash).void }
      attr_writer :spec

      # Workspace secret information
      sig { returns(T.nilable(Cadenya::WorkspaceSecretInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::WorkspaceSecretInfo::OrHash).void }
      attr_writer :info

      sig do
        params(
          metadata: Cadenya::ResourceMetadata::OrHash,
          spec: Cadenya::WorkspaceSecretSpec::OrHash,
          info: Cadenya::WorkspaceSecretInfo::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        metadata:,
        spec:,
        # Workspace secret information
        info: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::ResourceMetadata,
            spec: Cadenya::WorkspaceSecretSpec,
            info: Cadenya::WorkspaceSecretInfo
          }
        )
      end
      def to_hash
      end
    end
  end
end
