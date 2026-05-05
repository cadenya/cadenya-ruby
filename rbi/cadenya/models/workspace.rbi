# typed: strong

module Cadenya
  module Models
    class Workspace < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Workspace, Cadenya::Internal::AnyHash) }

      # AccountResourceMetadata is used to represent a resource that is associated to an
      # account but not to a workspace.
      sig { returns(Cadenya::AccountResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::AccountResourceMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(Cadenya::WorkspaceSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::WorkspaceSpec::OrHash).void }
      attr_writer :spec

      sig do
        params(
          metadata: Cadenya::AccountResourceMetadata::OrHash,
          spec: Cadenya::WorkspaceSpec::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # AccountResourceMetadata is used to represent a resource that is associated to an
        # account but not to a workspace.
        metadata:,
        spec:
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::AccountResourceMetadata,
            spec: Cadenya::WorkspaceSpec
          }
        )
      end
      def to_hash
      end
    end
  end
end
