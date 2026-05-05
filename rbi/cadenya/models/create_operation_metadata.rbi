# typed: strong

module Cadenya
  module Models
    class CreateOperationMetadata < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::CreateOperationMetadata, Cadenya::Internal::AnyHash)
        end

      # External ID for the operation (e.g., a workflow ID from an external system)
      sig { returns(T.nilable(String)) }
      attr_reader :external_id

      sig { params(external_id: String).void }
      attr_writer :external_id

      # Arbitrary key-value pairs for categorization and filtering Examples:
      # {"priority": "high", "source": "api", "workflow": "onboarding"}
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :labels

      sig { params(labels: T::Hash[Symbol, String]).void }
      attr_writer :labels

      # CreateOperationMetadata contains the user-provided fields for creating an
      # operation. Read-only fields (id, account_id, workspace_id, created_at,
      # profile_id) are excluded since they are set by the server.
      sig do
        params(external_id: String, labels: T::Hash[Symbol, String]).returns(
          T.attached_class
        )
      end
      def self.new(
        # External ID for the operation (e.g., a workflow ID from an external system)
        external_id: nil,
        # Arbitrary key-value pairs for categorization and filtering Examples:
        # {"priority": "high", "source": "api", "workflow": "onboarding"}
        labels: nil
      )
      end

      sig do
        override.returns(
          { external_id: String, labels: T::Hash[Symbol, String] }
        )
      end
      def to_hash
      end
    end
  end
end
