# typed: strong

module Cadenya
  module Models
    class AccountAPI < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::AccountAPI, Cadenya::Internal::AnyHash) }

      # Server-populated information about the account.
      sig { returns(Cadenya::AccountInfo) }
      attr_reader :info

      sig { params(info: Cadenya::AccountInfo::OrHash).void }
      attr_writer :info

      # AccountResourceMetadata is used to represent a resource that is associated to an
      # account but not to a workspace.
      sig { returns(Cadenya::AccountResourceMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::AccountResourceMetadata::OrHash).void }
      attr_writer :metadata

      # Configuration for an account.
      sig { returns(Cadenya::AccountSpec) }
      attr_reader :spec

      sig { params(spec: Cadenya::AccountSpec::OrHash).void }
      attr_writer :spec

      # An account, the top-level organizational unit. Contains workspaces and
      # account-wide settings such as the webhook signing secret.
      sig do
        params(
          info: Cadenya::AccountInfo::OrHash,
          metadata: Cadenya::AccountResourceMetadata::OrHash,
          spec: Cadenya::AccountSpec::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Server-populated information about the account.
        info:,
        # AccountResourceMetadata is used to represent a resource that is associated to an
        # account but not to a workspace.
        metadata:,
        # Configuration for an account.
        spec:
      )
      end

      sig do
        override.returns(
          {
            info: Cadenya::AccountInfo,
            metadata: Cadenya::AccountResourceMetadata,
            spec: Cadenya::AccountSpec
          }
        )
      end
      def to_hash
      end
    end
  end
end
