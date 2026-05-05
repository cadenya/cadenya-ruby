# frozen_string_literal: true

module Cadenya
  module Models
    module MemoryLayers
      # @see Cadenya::Resources::MemoryLayers::Entries#list
      class EntryListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute memory_layer_id
        #
        #   @return [String]
        required :memory_layer_id, String

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
        #   When set to true you may use more of your alloted API rate-limit
        #
        #   @return [Boolean, nil]
        optional :include_info, Cadenya::Internal::Type::Boolean

        # @!attribute limit
        #   Maximum number of results to return
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute prefix
        #   Filter by key prefix (e.g., "skills/postmortem/" to list all entries under that
        #   hierarchy). Matches against the entry's key, not its name.
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

        # @!method initialize(workspace_id:, memory_layer_id:, bundle_key: nil, cursor: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::MemoryLayers::EntryListParams} for more details.
        #
        #   @param workspace_id [String]
        #
        #   @param memory_layer_id [String]
        #
        #   @param bundle_key [String] Filter by bundle_key — return only resources owned by this bundle.
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param include_info [Boolean] When set to true you may use more of your alloted API rate-limit
        #
        #   @param limit [Integer] Maximum number of results to return
        #
        #   @param prefix [String] Filter by key prefix (e.g., "skills/postmortem/" to list all entries
        #
        #   @param query [String] Free-form search query
        #
        #   @param sort_order [String] Sort order for results (asc or desc by creation time)
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
