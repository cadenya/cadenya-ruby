# typed: strong

module Cadenya
  module Models
    class APIKey < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::APIKey, Cadenya::Internal::AnyHash) }

      # AccountResourceMetadata is used to represent a resource that is associated to an
      # account but not to a workspace.
      sig { returns(Cadenya::AccountResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::AccountResourceMetadata::OrHash).void }
      attr_writer :metadata

      # Configuration for an API key.
      sig { returns(Cadenya::APIKeySpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::APIKeySpec::OrHash).void }
      attr_writer :spec

      sig { returns(T.nilable(Cadenya::APIKeyInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::APIKeyInfo::OrHash).void }
      attr_writer :info

      # An API key for the account. Use workspace-association RPCs to grant the key
      # access to specific workspaces; a key with zero workspaces is valid but cannot
      # access workspace-scoped resources.
      sig do
        params(
          metadata: Cadenya::AccountResourceMetadata::OrHash,
          spec: Cadenya::APIKeySpec::OrHash,
          info: Cadenya::APIKeyInfo::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # AccountResourceMetadata is used to represent a resource that is associated to an
        # account but not to a workspace.
        metadata:,
        # Configuration for an API key.
        spec:,
        info: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::AccountResourceMetadata,
            spec: Cadenya::APIKeySpec,
            info: Cadenya::APIKeyInfo
          }
        )
      end
      def to_hash
      end
    end
  end
end
