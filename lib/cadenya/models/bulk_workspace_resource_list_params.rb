# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::BulkWorkspaceResources#list
    class BulkWorkspaceResourceListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute bundle_key
      #   Filter by bundle_key — list every apply for a given bundle.
      #
      #   @return [String, nil]
      optional :bundle_key, String

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

      # @!attribute state
      #   Filter by lifecycle state.
      #
      #   @return [Symbol, Cadenya::Models::BulkWorkspaceResourceListParams::State, nil]
      optional :state, enum: -> { Cadenya::BulkWorkspaceResourceListParams::State }

      # @!method initialize(workspace_id:, bundle_key: nil, cursor: nil, limit: nil, sort_order: nil, state: nil, request_options: {})
      #   @param workspace_id [String]
      #
      #   @param bundle_key [String] Filter by bundle_key — list every apply for a given bundle.
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      #   @param state [Symbol, Cadenya::Models::BulkWorkspaceResourceListParams::State] Filter by lifecycle state.
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      # Filter by lifecycle state.
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_PENDING = :STATE_PENDING
        STATE_VALIDATING = :STATE_VALIDATING
        STATE_RUNNING = :STATE_RUNNING
        STATE_SUCCEEDED = :STATE_SUCCEEDED
        STATE_PARTIALLY_APPLIED = :STATE_PARTIALLY_APPLIED
        STATE_FAILED = :STATE_FAILED
        STATE_CANCELLED = :STATE_CANCELLED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
