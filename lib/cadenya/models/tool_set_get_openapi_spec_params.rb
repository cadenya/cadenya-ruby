# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::ToolSets#get_openapi_spec
    class ToolSetGetOpenAPISpecParams < Cadenya::Internal::Type::BaseModel
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

      # @!method initialize(workspace_id:, tool_set_id:, request_options: {})
      #   @param workspace_id [String]
      #   @param tool_set_id [String]
      #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
