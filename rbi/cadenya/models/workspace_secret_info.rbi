# typed: strong

module Cadenya
  module Models
    class WorkspaceSecretInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::WorkspaceSecretInfo, Cadenya::Internal::AnyHash)
        end

      # A profile identifies a user or non-human principal (such as an API key) at the
      # account level. Profiles are account-scoped and can be granted access to multiple
      # workspaces.
      sig { returns(T.nilable(Cadenya::Profile)) }
      attr_reader :created_by

      sig { params(created_by: Cadenya::Profile::OrHash).void }
      attr_writer :created_by

      sig { returns(T.nilable(Time)) }
      attr_reader :last_used_at

      sig { params(last_used_at: Time).void }
      attr_writer :last_used_at

      sig do
        params(
          created_by: Cadenya::Profile::OrHash,
          last_used_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        created_by: nil,
        last_used_at: nil
      )
      end

      sig do
        override.returns({ created_by: Cadenya::Profile, last_used_at: Time })
      end
      def to_hash
      end
    end
  end
end
