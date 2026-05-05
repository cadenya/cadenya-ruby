# frozen_string_literal: true

module Cadenya
  module Models
    class BulkWorkspaceApplyInfo < Cadenya::Internal::Type::BaseModel
      # @!attribute created_by
      #   A profile identifies a user or non-human principal (such as an API key) at the
      #   account level. Profiles are account-scoped and can be granted access to multiple
      #   workspaces.
      #
      #   @return [Cadenya::Models::Profile, nil]
      optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

      response_only do
        # @!attribute completed_at
        #
        #   @return [Time, nil]
        optional :completed_at, Time, api_name: :completedAt

        # @!attribute created_count
        #
        #   @return [Integer, nil]
        optional :created_count, Integer, api_name: :createdCount

        # @!attribute deleted_count
        #
        #   @return [Integer, nil]
        optional :deleted_count, Integer, api_name: :deletedCount

        # @!attribute failed_count
        #
        #   @return [Integer, nil]
        optional :failed_count, Integer, api_name: :failedCount

        # @!attribute started_at
        #
        #   @return [Time, nil]
        optional :started_at, Time, api_name: :startedAt

        # @!attribute total_count
        #
        #   @return [Integer, nil]
        optional :total_count, Integer, api_name: :totalCount

        # @!attribute unchanged_count
        #
        #   @return [Integer, nil]
        optional :unchanged_count, Integer, api_name: :unchangedCount

        # @!attribute updated_count
        #
        #   @return [Integer, nil]
        optional :updated_count, Integer, api_name: :updatedCount
      end

      # @!method initialize(completed_at: nil, created_by: nil, created_count: nil, deleted_count: nil, failed_count: nil, started_at: nil, total_count: nil, unchanged_count: nil, updated_count: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::BulkWorkspaceApplyInfo} for more details.
      #
      #   @param completed_at [Time]
      #
      #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      #
      #   @param created_count [Integer]
      #
      #   @param deleted_count [Integer]
      #
      #   @param failed_count [Integer]
      #
      #   @param started_at [Time]
      #
      #   @param total_count [Integer]
      #
      #   @param unchanged_count [Integer]
      #
      #   @param updated_count [Integer]
    end
  end
end
