# typed: strong

module Cadenya
  module Models
    class APIKeySpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::APIKeySpec, Cadenya::Internal::AnyHash) }

      # Free-form description of what this API key is used for.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Permissions granted to this key. Each entry is a colon-separated verb:resource
      # string (e.g. "manage:agents"). Currently has no enforced effect; reserved for
      # future fine-grained authorization.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :permissions

      sig { params(permissions: T::Array[String]).void }
      attr_writer :permissions

      # The bearer token used to authenticate as this API key. Returned only on creation
      # and rotation; subsequent reads omit this field.
      sig { returns(T.nilable(String)) }
      attr_reader :token

      sig { params(token: String).void }
      attr_writer :token

      # True when this key is managed by the system (e.g. the auto-provisioned global
      # account key). System keys cannot be deleted but can be rotated.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :system_

      sig { params(system_: T::Boolean).void }
      attr_writer :system_

      # Configuration for an API key.
      sig do
        params(
          token: String,
          description: String,
          permissions: T::Array[String],
          system_: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The bearer token used to authenticate as this API key. Returned only on creation
        # and rotation; subsequent reads omit this field.
        token: nil,
        # Free-form description of what this API key is used for.
        description: nil,
        # Permissions granted to this key. Each entry is a colon-separated verb:resource
        # string (e.g. "manage:agents"). Currently has no enforced effect; reserved for
        # future fine-grained authorization.
        permissions: nil,
        # True when this key is managed by the system (e.g. the auto-provisioned global
        # account key). System keys cannot be deleted but can be rotated.
        system_: nil
      )
      end

      sig do
        override.returns(
          {
            token: String,
            description: String,
            permissions: T::Array[String],
            system_: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
