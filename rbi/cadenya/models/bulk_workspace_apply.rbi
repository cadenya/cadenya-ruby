# typed: strong

module Cadenya
  module Models
    class BulkWorkspaceApply < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::BulkWorkspaceApply, Cadenya::Internal::AnyHash)
        end

      sig { returns(Cadenya::BulkWorkspaceApplyData) }
      attr_reader :data

      sig { params(data: Cadenya::BulkWorkspaceApplyData::OrHash).void }
      attr_writer :data

      # Metadata for ephemeral operations and activities (e.g., objectives, executions,
      # runs)
      sig { returns(Cadenya::OperationMetadata) }
      attr_reader :metadata

      sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
      attr_writer :metadata

      sig { returns(Cadenya::BulkWorkspaceApplyStatus) }
      attr_reader :status

      sig { params(status: Cadenya::BulkWorkspaceApplyStatus::OrHash).void }
      attr_writer :status

      sig { returns(T.nilable(Cadenya::BulkWorkspaceApplyInfo)) }
      attr_reader :info

      sig { params(info: Cadenya::BulkWorkspaceApplyInfo::OrHash).void }
      attr_writer :info

      # The operation resource produced by a call to BulkWorkspaceResources.Apply. It
      # carries the input bundle in `data`, the lifecycle state in `status`, and
      # aggregate counts in `info`.
      sig do
        params(
          data: Cadenya::BulkWorkspaceApplyData::OrHash,
          metadata: Cadenya::OperationMetadata::OrHash,
          status: Cadenya::BulkWorkspaceApplyStatus::OrHash,
          info: Cadenya::BulkWorkspaceApplyInfo::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        metadata:,
        status:,
        info: nil
      )
      end

      sig do
        override.returns(
          {
            data: Cadenya::BulkWorkspaceApplyData,
            metadata: Cadenya::OperationMetadata,
            status: Cadenya::BulkWorkspaceApplyStatus,
            info: Cadenya::BulkWorkspaceApplyInfo
          }
        )
      end
      def to_hash
      end
    end
  end
end
