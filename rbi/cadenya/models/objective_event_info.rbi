# typed: strong

module Cadenya
  module Models
    class ObjectiveEventInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveEventInfo, Cadenya::Internal::AnyHash)
        end

      # A profile identifies a user or non-human principal (such as an API key) at the
      # account level. Profiles are account-scoped and can be granted access to multiple
      # workspaces.
      sig { returns(Cadenya::Profile) }
      attr_accessor :created_by

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(T.nilable(Cadenya::OperationMetadata)) }
      attr_reader :objective

      sig { params(objective: Cadenya::OperationMetadata::OrHash).void }
      attr_writer :objective

      sig do
        params(
          created_by: Cadenya::Profile::OrHash,
          objective: Cadenya::OperationMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        created_by:,
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        objective: nil
      )
      end

      sig do
        override.returns(
          {
            created_by: Cadenya::Profile,
            objective: Cadenya::OperationMetadata
          }
        )
      end
      def to_hash
      end
    end
  end
end
