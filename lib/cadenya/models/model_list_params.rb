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

      # @!attribute ai_provider_key_id
      #   Filter to models provisioned on a specific AI provider key. Accepts the key's id
      #   or an "external_id:"-prefixed slug.
      #
      #   @return [String, nil]
      optional :ai_provider_key_id, String

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

      # @!attribute include_info
      #   When true, populate each item's info (e.g. the AI provider), at the cost of
      #   extra lookups.
      #
      #   @return [Boolean, nil]
      optional :include_info, Cadenya::Internal::Type::Boolean

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

      # @!method initialize(workspace_id:, ai_provider_key_id: nil, bundle_key: nil, cursor: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ModelListParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param ai_provider_key_id [String] Filter to models provisioned on a specific AI provider key. Accepts the
      #
      #   @param bundle_key [String] Filter by bundle_key — return only resources owned by this bundle.
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param include_info [Boolean] When true, populate each item's info (e.g. the AI provider), at the cost of
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
