# frozen_string_literal: true

module Cadenya
  module Models
    module APIKeys
      # @see Cadenya::Resources::APIKeys::Access#list
      class AccessListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor from previous response.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #   Maximum number of results to return.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!method initialize(id:, cursor: nil, limit: nil, request_options: {})
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor from previous response.
        #
        #   @param limit [Integer] Maximum number of results to return.
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
