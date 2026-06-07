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

      # @!method initialize(workspace_id:, cursor: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, request_options: {})
      #   @param workspace_id [String]
      #
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param limit [Integer] Maximum number of results to return
      #
      #   @param prefix [String] Filter expression (query param: prefix)
      #
      #   @param query [String] Free-form search query
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
