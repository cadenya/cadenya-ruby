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

      # Lifecycle status of the workspace. Archived workspaces reject all requests
      # scoped to them. Server-populated.
      sig { returns(T.nilable(Cadenya::Workspace::Status::TaggedSymbol)) }
      attr_reader :status

      sig { params(status: Cadenya::Workspace::Status::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          metadata: Cadenya::AccountResourceMetadata::OrHash,
          spec: Cadenya::WorkspaceSpec::OrHash,
          status: Cadenya::Workspace::Status::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # AccountResourceMetadata is used to represent a resource that is associated to an
        # account but not to a workspace.
        metadata:,
        spec:,
        # Lifecycle status of the workspace. Archived workspaces reject all requests
        # scoped to them. Server-populated.
        status: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::AccountResourceMetadata,
            spec: Cadenya::WorkspaceSpec,
            status: Cadenya::Workspace::Status::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Lifecycle status of the workspace. Archived workspaces reject all requests
      # scoped to them. Server-populated.
      module Status
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Cadenya::Workspace::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STATUS_ENABLED =
          T.let(:STATUS_ENABLED, Cadenya::Workspace::Status::TaggedSymbol)
        STATUS_DISABLED =
          T.let(:STATUS_DISABLED, Cadenya::Workspace::Status::TaggedSymbol)
        STATUS_ARCHIVED =
          T.let(:STATUS_ARCHIVED, Cadenya::Workspace::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Cadenya::Workspace::Status::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
