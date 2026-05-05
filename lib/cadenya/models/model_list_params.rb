# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Models#list
    class ModelListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute bundle_key
      #   Filter by bundle_key — return only resources owned by this bundle.
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

      # @!attribute prefix
      #   Filter by name prefix
      #
      #   @return [String, nil]
      optional :prefix, String

      # @!attribute query
      #   Free-form search query
      #
      #   @return [String, nil]
      optional :query, String

      # @!attribute sort_order
      #   Sort order for results (asc or desc by creation time)
      #
      #   @return [String, nil]
      optional :sort_order, String

      # @!attribute status
      #   Filter by model status
      #
      #   @return [Symbol, Cadenya::Models::ModelListParams::Status, nil]
      optional :status, enum: -> { Cadenya::ModelListParams::Status }

      # @!method initialize(workspace_id:, bundle_key: nil, cursor: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, status: nil, request_options: {})
      #   @param workspace_id [String]
      #
      #   @param bundle_key [String] Filter by bundle_key — return only resources owned by this bundle.
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param prefix [String] Filter by name prefix
      #
      #   @param query [String] Free-form search query
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      #   @param status [Symbol, Cadenya::Models::ModelListParams::Status] Filter by model status
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

      # Filter by model status
      module Status
        extend Cadenya::Internal::Type::Enum

        MODEL_STATUS_UNSPECIFIED = :MODEL_STATUS_UNSPECIFIED
        MODEL_STATUS_ENABLED = :MODEL_STATUS_ENABLED
        MODEL_STATUS_DISABLED = :MODEL_STATUS_DISABLED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
