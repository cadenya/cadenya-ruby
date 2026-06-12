# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::AIProviderKeys#list
    class AIProviderKeyListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute cursor
      #   Pagination cursor from previous response
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute include_info
      #   When true, populate each item's info (model counts), at the cost of extra
      #   lookups.
      #
      #   @return [Boolean, nil]
      optional :include_info, Cadenya::Internal::Type::Boolean

      # @!attribute limit
      #   Maximum number of results to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute prefix
      #   Filter expression (query param: prefix)
      #
      #   @return [String, nil]
      optional :prefix, String

      # @!attribute promotional
      #   When true, return only promotional keys (provided by Cadenya, e.g. for
      #   onboarding). Defaults to returning all keys, customer-provided and promotional
      #   alike.
      #
      #   @return [Boolean, nil]
      optional :promotional, Cadenya::Internal::Type::Boolean

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

      # @!method initialize(workspace_id:, cursor: nil, include_info: nil, limit: nil, prefix: nil, promotional: nil, query: nil, sort_order: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AIProviderKeyListParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param include_info [Boolean] When true, populate each item's info (model counts), at the cost of extra
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param prefix [String] Filter expression (query param: prefix)
      #
      #   @param promotional [Boolean] When true, return only promotional keys (provided by Cadenya, e.g. for
      #
      #   @param query [String] Free-form search query
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
