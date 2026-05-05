# frozen_string_literal: true

module Cadenya
  module Models
    module BulkWorkspaceResources
      # @see Cadenya::Resources::BulkWorkspaceResources::Results#list
      class BulkWorkspaceApplyResult < Cadenya::Internal::Type::BaseModel
        # @!attribute data
        #   Outcome for a single resource within a bulk apply. The `type` field is the
        #   discriminator string naming the populated `outcome` oneof variant (e.g.,
        #   "toolSet", "memoryEntry"). Every outcome shell carries an `action` enum and
        #   either a resulting resource snapshot (for ACTION_CREATED, ACTION_UPDATED,
        #   ACTION_UNCHANGED, ACTION_DELETED) or a google.rpc.Status (for ACTION_FAILED).
        #
        #   @return [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultData]
        required :data, -> { Cadenya::BulkWorkspaceResources::BulkWorkspaceApplyResultData }

        # @!attribute metadata
        #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
        #   runs)
        #
        #   @return [Cadenya::Models::OperationMetadata]
        required :metadata, -> { Cadenya::OperationMetadata }

        # @!method initialize(data:, metadata:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResult} for more
        #   details.
        #
        #   One row of the per-resource result list for a BulkWorkspaceApply. Each row is
        #   itself an operation that can be paginated, sorted by created_at, and addressed
        #   individually.
        #
        #   @param data [Cadenya::Models::BulkWorkspaceResources::BulkWorkspaceApplyResultData] Outcome for a single resource within a bulk apply. The `type` field is
        #
        #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      end
    end
  end
end
