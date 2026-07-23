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
        #   @return [String, nil]
        optional :workspace_id, String

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

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

        # @!attribute labels
        #   Filters by metadata labels. Comma-separated key=value pairs, e.g.
        #   "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        #   semantics).
        #
        #   @return [String, nil]
        optional :labels, String

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

        # @!method initialize(agent_id:, workspace_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, sort_order: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::VariationListParams} for more details.
        #
        #   @param agent_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param include_info [Boolean] When true, the `info` field on each returned variation is populated.
        #
        #   @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
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
