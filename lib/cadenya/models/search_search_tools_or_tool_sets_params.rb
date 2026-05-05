# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Search#search_tools_or_tool_sets
    class SearchSearchToolsOrToolSetsParams < Cadenya::Internal::Type::BaseModel
      extend Cadenya::Internal::Type::RequestParameters::Converter
      include Cadenya::Internal::Type::RequestParameters

      # @!attribute workspace_id
      #
      #   @return [String]
      required :workspace_id, String

      # @!attribute query
      #
      #   @return [String, nil]
      optional :query, String

      # @!method initialize(workspace_id:, query: nil, request_options: {})
      #   @param workspace_id [String]
      #   @param query [String]
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
