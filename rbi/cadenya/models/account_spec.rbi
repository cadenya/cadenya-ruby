# typed: strong

module Cadenya
  module Models
    class AccountSpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::AccountSpec, Cadenya::Internal::AnyHash) }

      sig { returns(T.nilable(String)) }
      attr_reader :billing_email

      sig { params(billing_email: String).void }
      attr_writer :billing_email

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig { returns(T.nilable(String)) }
      attr_reader :domain

      sig { params(domain: String).void }
      attr_writer :domain

      sig { returns(T.nilable(T::Array[Cadenya::Workspace])) }
      attr_reader :workspaces

      sig { params(workspaces: T::Array[Cadenya::Workspace::OrHash]).void }
      attr_writer :workspaces

      # Configuration for an account.
      sig do
        params(
          billing_email: String,
          description: String,
          domain: String,
          workspaces: T::Array[Cadenya::Workspace::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        billing_email: nil,
        description: nil,
        domain: nil,
        workspaces: nil
      )
      end

      sig do
        override.returns(
          {
            billing_email: String,
            description: String,
            domain: String,
            workspaces: T::Array[Cadenya::Workspace]
          }
        )
      end
      def to_hash
      end
    end
  end
end
