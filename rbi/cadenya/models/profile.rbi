# typed: strong

module Cadenya
  module Models
    class Profile < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Profile, Cadenya::Internal::AnyHash) }

      # AccountResourceMetadata is used to represent a resource that is associated to an
      # account but not to a workspace.
      sig { returns(Cadenya::AccountResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::AccountResourceMetadata::OrHash).void }
      attr_writer :metadata

      # Configuration for a profile.
      sig { returns(Cadenya::ProfileSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::ProfileSpec::OrHash).void }
      attr_writer :spec

      # A profile identifies a user or non-human principal (such as an API key) at the
      # account level. Profiles are account-scoped and can be granted access to multiple
      # workspaces.
      sig do
        params(
          metadata: Cadenya::AccountResourceMetadata::OrHash,
          spec: Cadenya::ProfileSpec::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # AccountResourceMetadata is used to represent a resource that is associated to an
        # account but not to a workspace.
        metadata:,
        # Configuration for a profile.
        spec:
      )
      end

      sig do
        override.returns(
          {
            metadata: Cadenya::AccountResourceMetadata,
            spec: Cadenya::ProfileSpec
          }
        )
      end
      def to_hash
      end
    end
  end
end
