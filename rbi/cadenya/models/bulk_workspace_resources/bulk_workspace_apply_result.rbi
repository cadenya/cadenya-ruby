# typed: strong

module Cadenya
  module Models
    module BulkWorkspaceResources
      class BulkWorkspaceApplyResult < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResult,
              Cadenya::Internal::AnyHash
            )
          end

        # Outcome for a single resource within a bulk apply. The `type` field is the
        # discriminator string naming the populated `outcome` oneof variant (e.g.,
        # "toolSet", "memoryEntry"). Every outcome shell carries an `action` enum and
        # either a resulting resource snapshot (for ACTION_CREATED, ACTION_UPDATED,
        # ACTION_UNCHANGED, ACTION_DELETED) or a google.rpc.Status (for ACTION_FAILED).
        sig do
          returns(Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultData)
        end
        attr_reader :data

        sig do
          params(
            data:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultData::OrHash
          ).void
        end
        attr_writer :data

        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        sig { returns(Cadenya::OperationMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
        attr_writer :metadata

        # One row of the per-resource result list for a BulkWorkspaceApply. Each row is
        # itself an operation that can be paginated, sorted by created_at, and addressed
        # individually.
        sig do
          params(
            data:
              Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultData::OrHash,
            metadata: Cadenya::OperationMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Outcome for a single resource within a bulk apply. The `type` field is the
          # discriminator string naming the populated `outcome` oneof variant (e.g.,
          # "toolSet", "memoryEntry"). Every outcome shell carries an `action` enum and
          # either a resulting resource snapshot (for ACTION_CREATED, ACTION_UPDATED,
          # ACTION_UNCHANGED, ACTION_DELETED) or a google.rpc.Status (for ACTION_FAILED).
          data:,
          # Metadata for ephemeral operations and activities (e.g., objectives, executions,
          # runs)
          metadata:
        )
        end

        sig do
          override.returns(
            {
              data:
                Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultData,
              metadata: Cadenya::OperationMetadata
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
