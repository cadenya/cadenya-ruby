# typed: strong

module Cadenya
  module Models
    class SubObjectiveCreated < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::SubObjectiveCreated, Cadenya::Internal::AnyHash)
        end

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(T.nilable(Cadenya::OperationMetadata)) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
      attr_writer :metadata

      sig do
        params(metadata: Cadenya::OperationMetadata::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        metadata: nil
      )
      end

      sig { override.returns({ metadata: Cadenya::OperationMetadata }) }
      def to_hash
      end
    end
  end
end
