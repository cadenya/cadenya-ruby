# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::BulkWorkspaceResources#retrieve
    class BulkWorkspaceApply < Cadenya::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Cadenya::Models::BulkWorkspaceApplyData]
      required :data, -> { Cadenya::BulkWorkspaceApplyData }

      # @!attribute metadata
      #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #   runs)
      #
      #   @return [Cadenya::Models::OperationMetadata]
      required :metadata, -> { Cadenya::OperationMetadata }

      # @!attribute status
      #
      #   @return [Cadenya::Models::BulkWorkspaceApplyStatus]
      required :status, -> { Cadenya::BulkWorkspaceApplyStatus }

      # @!attribute info
      #
      #   @return [Cadenya::Models::BulkWorkspaceApplyInfo, nil]
      optional :info, -> { Cadenya::BulkWorkspaceApplyInfo }

      # @!method initialize(data:, metadata:, status:, info: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::BulkWorkspaceApply} for more details.
      #
      #   The operation resource produced by a call to BulkWorkspaceResources.Apply. It
      #   carries the input bundle in `data`, the lifecycle state in `status`, and
      #   aggregate counts in `info`.
      #
      #   @param data [Cadenya::Models::BulkWorkspaceApplyData]
      #
      #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      #
      #   @param status [Cadenya::Models::BulkWorkspaceApplyStatus]
      #
      #   @param info [Cadenya::Models::BulkWorkspaceApplyInfo]
    end
  end
end
