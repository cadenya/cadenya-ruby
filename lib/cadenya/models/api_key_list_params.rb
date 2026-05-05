# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::APIKeys#list
    class APIKeyListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute bundle_key
      #   Filter by bundle_key — return only resources owned by this bundle.
      #
      #   @return [String, nil]
      optional :bundle_key, String

      # @!attribute cursor
      #   Pagination cursor from previous response.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute include_info
      #   When true, included info fields are populated. Requests with this flag count
      #   more against your rate limit.
      #
      #   @return [Boolean, nil]
      optional :include_info, Cadenya::Internal::Type::Boolean

      # @!attribute limit
      #   Maximum number of results to return.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute prefix
      #   Filter by ID prefix.
      #
      #   @return [String, nil]
      optional :prefix, String

      # @!attribute query
      #   Free-form search query.
      #
      #   @return [String, nil]
      optional :query, String

      # @!attribute sort_order
      #   Sort order for results (asc or desc by creation time).
      #
      #   @return [String, nil]
      optional :sort_order, String

      # @!method initialize(bundle_key: nil, cursor: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::APIKeyListParams} for more details.
      #
      #   @param bundle_key [String] Filter by bundle_key — return only resources owned by this bundle.
      #
      #   @param cursor [String] Pagination cursor from previous response.
      #
      #   @param include_info [Boolean] When true, included info fields are populated. Requests with this
      #
      #   @param limit [Integer] Maximum number of results to return.
      #
      #   @param prefix [String] Filter by ID prefix.
      #
      #   @param query [String] Free-form search query.
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time).
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
