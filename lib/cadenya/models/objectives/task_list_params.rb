# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # @see Cadenya::Resources::Objectives::Tasks#list
      class TaskListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute objective_id
        #
        #   @return [String]
        required :objective_id, String

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

        # @!attribute sort_order
        #   Sort order for results
        #
        #   @return [String, nil]
        optional :sort_order, String

        # @!method initialize(workspace_id:, objective_id:, cursor: nil, limit: nil, sort_order: nil, request_options: {})
        #   @param workspace_id [String]
        #
        #   @param objective_id [String]
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param limit [Integer] Maximum number of results to return
        #
        #   @param sort_order [String] Sort order for results
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
