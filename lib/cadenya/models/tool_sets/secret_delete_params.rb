# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      # @see Cadenya::Resources::ToolSets::Secrets#delete
      class SecretDeleteParams < Cadenya::Internal::Type::BaseModel
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

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!method initialize(workspace_id:, tool_set_id:, id:, request_options: {})
        #   @param workspace_id [String]
        #   @param tool_set_id [String]
        #   @param id [String]
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
