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

      # Scopes granted to this key. Each entry is a colon-separated resource:verb string
      # (e.g. "objectives:manage").
      #
      # Resources: agents, objectives, tools, memory, secrets, account. Verbs: read and
      # manage, where manage implies read — a stored scope set is normalized to drop
      # "x:read" when "x:manage" is present. The secrets and account resources support
      # only manage. "\*" is an explicit full-access grant.
      #
      # Scopes are deny-by-default: a key with an empty list can call only scope-free
      # endpoints. Full access is always an explicit "\*" grant.
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
        # Scopes granted to this key. Each entry is a colon-separated resource:verb string
        # (e.g. "objectives:manage").
        #
        # Resources: agents, objectives, tools, memory, secrets, account. Verbs: read and
        # manage, where manage implies read — a stored scope set is normalized to drop
        # "x:read" when "x:manage" is present. The secrets and account resources support
        # only manage. "\*" is an explicit full-access grant.
        #
        # Scopes are deny-by-default: a key with an empty list can call only scope-free
        # endpoints. Full access is always an explicit "\*" grant.
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
