# frozen_string_literal: true

module Cadenya
  module Models
    module BulkWorkspaceResources
      # @see Cadenya::Resources::BulkWorkspaceResources::Results#list
      class ResultListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute bulk_workspace_apply_id
        #
        #   @return [String]
        required :bulk_workspace_apply_id, String

        # @!attribute action
        #   Filter by action.
        #
        #   @return [Symbol, Cadenya::Models::BulkWorkspaceResources::ResultListParams::Action, nil]
        optional :action, enum: -> { Cadenya::BulkWorkspaceResources::ResultListParams::Action }

        # @!attribute cursor
        #   Pagination cursor from previous response
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #   Maximum number of results to return
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute sort_order
        #   Sort order for results (asc or desc by creation time)
        #
        #   @return [String, nil]
        optional :sort_order, String

        # @!attribute type
        #   Filter by data.type discriminator (e.g., "toolSet", "memoryEntry").
        #
        #   @return [String, nil]
        optional :type, String

        # @!method initialize(workspace_id:, bulk_workspace_apply_id:, action: nil, cursor: nil, limit: nil, sort_order: nil, type: nil, request_options: {})
        #   @param workspace_id [String]
        #
        #   @param bulk_workspace_apply_id [String]
        #
        #   @param action [Symbol, Cadenya::Models::BulkWorkspaceResources::ResultListParams::Action] Filter by action.
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param limit [Integer] Maximum number of results to return
        #
        #   @param sort_order [String] Sort order for results (asc or desc by creation time)
        #
        #   @param type [String] Filter by data.type discriminator (e.g., "toolSet", "memoryEntry").
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

        # Filter by action.
        module Action
          extend Cadenya::Internal::Type::Enum

          ACTION_UNSPECIFIED = :ACTION_UNSPECIFIED
          ACTION_CREATED = :ACTION_CREATED
          ACTION_UPDATED = :ACTION_UPDATED
          ACTION_UNCHANGED = :ACTION_UNCHANGED
          ACTION_DELETED = :ACTION_DELETED
          ACTION_FAILED = :ACTION_FAILED

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
