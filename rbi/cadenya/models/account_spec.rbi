# typed: strong

module Cadenya
  module Models
    class AccountSpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::AccountSpec, Cadenya::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :billing_email

      sig { returns(String) }
      attr_accessor :description

      sig { returns(String) }
      attr_accessor :domain

      sig { returns(T::Array[Cadenya::Workspace]) }
      attr_accessor :workspaces

      # Configuration for an account.
      sig do
        params(
          billing_email: String,
          description: String,
          domain: String,
          workspaces: T::Array[Cadenya::Workspace::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(billing_email:, description:, domain:, workspaces:)
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
