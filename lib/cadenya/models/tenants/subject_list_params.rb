# frozen_string_literal: true

module Cadenya
  module Models
    module Tenants
      # @see Cadenya::Resources::Tenants::Subjects#list
      class SubjectListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!attribute tenant_id
        #
        #   @return [String]
        required :tenant_id, String

        # @!attribute cursor
        #   Pagination cursor from previous response.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute include_info
        #   When true, the `info` field on each returned subject is populated.
        #
        #   @return [Boolean, nil]
        optional :include_info, Cadenya::Internal::Type::Boolean

        # @!attribute limit
        #   Maximum number of results to return.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute query
        #   Substring match against the subject's name and external_id.
        #
        #   @return [String, nil]
        optional :query, String

        # @!attribute sort_order
        #   Sort order for results (asc or desc by creation time).
        #
        #   @return [String, nil]
        optional :sort_order, String

        # @!method initialize(tenant_id:, workspace_id: nil, cursor: nil, include_info: nil, limit: nil, query: nil, sort_order: nil, request_options: {})
        #   @param tenant_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param cursor [String] Pagination cursor from previous response.
        #
        #   @param include_info [Boolean] When true, the `info` field on each returned subject is populated.
        #
        #   @param limit [Integer] Maximum number of results to return.
        #
        #   @param query [String] Substring match against the subject's name and external_id.
        #
        #   @param sort_order [String] Sort order for results (asc or desc by creation time).
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
