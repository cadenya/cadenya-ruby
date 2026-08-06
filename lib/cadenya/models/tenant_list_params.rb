# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Tenants#list
    class TenantListParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!attribute cursor
      #   Pagination cursor from previous response.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute include_info
      #   When true, the `info` field on each returned tenant is populated. This costs
      #   several count queries per tenant, so it is off by default.
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
      #   Maximum number of results to return.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute query
      #   Substring match against the tenant's name and external_id. Built for type-ahead
      #   filter pickers, where the operator knows the customer's own identifier rather
      #   than Cadenya's.
      #
      #   @return [String, nil]
      optional :query, String

      # @!attribute sort_order
      #   Sort order for results (asc or desc by creation time).
      #
      #   @return [String, nil]
      optional :sort_order, String

      # @!method initialize(workspace_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, query: nil, sort_order: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::TenantListParams} for more details.
      #
      #   @param workspace_id [String]
      #
      #   @param cursor [String] Pagination cursor from previous response.
      #
      #   @param include_info [Boolean] When true, the `info` field on each returned tenant is populated. This
      #
      #   @param labels [String] Filters by metadata labels. Comma-separated key=value pairs,
      #
      #   @param limit [Integer] Maximum number of results to return.
      #
      #   @param query [String] Substring match against the tenant's name and external_id. Built for
      #
      #   @param sort_order [String] Sort order for results (asc or desc by creation time).
      #
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
