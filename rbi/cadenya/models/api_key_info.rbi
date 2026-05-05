# typed: strong

module Cadenya
  module Models
    class APIKeyInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::APIKeyInfo, Cadenya::Internal::AnyHash) }

      # A profile identifies a user or non-human principal (such as an API key) at the
      # account level. Profiles are account-scoped and can be granted access to multiple
      # workspaces.
      sig { returns(T.nilable(Cadenya::Profile)) }
      attr_reader :created_by

      sig { params(created_by: Cadenya::Profile::OrHash).void }
      attr_writer :created_by

      # Up to a small number of workspaces this key has access to, intended for display
      # ("Workspace 1, Workspace 2, and 4 more"). Use ListAPIKeyWorkspaces for the full
      # paginated list.
      sig { returns(T.nilable(T::Array[Cadenya::BareMetadata])) }
      attr_reader :workspaces_preview

      sig do
        params(workspaces_preview: T::Array[Cadenya::BareMetadata::OrHash]).void
      end
      attr_writer :workspaces_preview

      # Total number of workspaces this key has access to.
      sig { returns(T.nilable(Integer)) }
      attr_reader :workspaces_total

      sig { params(workspaces_total: Integer).void }
      attr_writer :workspaces_total

      sig do
        params(
          created_by: Cadenya::Profile::OrHash,
          workspaces_preview: T::Array[Cadenya::BareMetadata::OrHash],
          workspaces_total: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        created_by: nil,
        # Up to a small number of workspaces this key has access to, intended for display
        # ("Workspace 1, Workspace 2, and 4 more"). Use ListAPIKeyWorkspaces for the full
        # paginated list.
        workspaces_preview: nil,
        # Total number of workspaces this key has access to.
        workspaces_total: nil
      )
      end

      sig do
        override.returns(
          {
            created_by: Cadenya::Profile,
            workspaces_preview: T::Array[Cadenya::BareMetadata],
            workspaces_total: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
