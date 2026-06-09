# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      # @see Cadenya::Resources::ToolSets::Tools#list
      class ToolListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute tool_set_id
        #
        #   @return [String]
        required :tool_set_id, String

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

        # @!attribute names
        #   Filter by tool name (exact match). Multiple values are OR'd together.
        #
        #   @return [Array<String>, nil]
        optional :names, Cadenya::Internal::Type::ArrayOf[String]

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

        # @!attribute requires_approval
        #   Filter by approval requirement. Omitted = no filter; true = only tools requiring
        #   approval; false = only tools not requiring approval.
        #
        #   @return [Boolean, nil]
        optional :requires_approval, Cadenya::Internal::Type::Boolean

        # @!attribute sort_order
        #   Sort order for results (asc or desc by creation time)
        #
        #   @return [String, nil]
        optional :sort_order, String

        # @!attribute states
        #   Filter by tool state. Multiple values are OR'd together.
        #
        #   @return [Array<Symbol, Cadenya::Models::ToolSets::ToolListParams::State>, nil]
        optional :states, -> { Cadenya::Internal::Type::ArrayOf[enum: Cadenya::ToolSets::ToolListParams::State] }

        # @!method initialize(workspace_id:, tool_set_id:, bundle_key: nil, cursor: nil, include_info: nil, limit: nil, names: nil, prefix: nil, query: nil, requires_approval: nil, sort_order: nil, states: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ToolSets::ToolListParams} for more details.
        #
        #   @param workspace_id [String]
        #
        #   @param tool_set_id [String]
        #
        #   @param bundle_key [String] Filter by bundle_key — return only resources owned by this bundle.
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param include_info [Boolean] When set to true you may use more of your alloted API rate-limit
        #
        #   @param limit [Integer] Maximum number of results to return
        #
        #   @param names [Array<String>] Filter by tool name (exact match). Multiple values are OR'd together.
        #
        #   @param prefix [String] Filter expression (query param: prefix)
        #
        #   @param query [String] Free-form search query
        #
        #   @param requires_approval [Boolean] Filter by approval requirement. Omitted = no filter; true = only tools
        #
        #   @param sort_order [String] Sort order for results (asc or desc by creation time)
        #
        #   @param states [Array<Symbol, Cadenya::Models::ToolSets::ToolListParams::State>] Filter by tool state. Multiple values are OR'd together.
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

        module State
          extend Cadenya::Internal::Type::Enum

          STATE_UNSPECIFIED = :STATE_UNSPECIFIED
          STATE_AVAILABLE = :STATE_AVAILABLE
          STATE_OMITTED = :STATE_OMITTED
          STATE_ARCHIVED = :STATE_ARCHIVED

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
