# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::Variations#list
      class VariationListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

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
        #   When true, the `info` field on each returned variation is populated. Requests
        #   with this flag count more against your rate limit.
        #
        #   @return [Boolean, nil]
        optional :include_info, Cadenya::Internal::Type::Boolean

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

        # @!method initialize(workspace_id:, agent_id:, bundle_key: nil, cursor: nil, include_info: nil, limit: nil, sort_order: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::VariationListParams} for more details.
        #
        #   @param workspace_id [String]
        #
        #   @param agent_id [String]
        #
        #   @param bundle_key [String] Filter by bundle_key — return only resources owned by this bundle.
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param include_info [Boolean] When true, the `info` field on each returned variation is populated.
        #
        #   @param limit [Integer] Maximum number of results to return
        #
        #   @param sort_order [String] Sort order for results (asc or desc by creation time)
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
