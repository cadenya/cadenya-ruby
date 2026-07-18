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

      sig do
        params(created_by: Cadenya::Profile::OrHash).returns(T.attached_class)
      end
      def self.new(
        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        created_by: nil
      )
      end

      sig { override.returns({ created_by: Cadenya::Profile }) }
      def to_hash
      end
    end
  end
end
