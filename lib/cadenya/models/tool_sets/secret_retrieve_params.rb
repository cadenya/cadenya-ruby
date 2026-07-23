# frozen_string_literal: true

module Cadenya
  module Models
    module ToolSets
      # @see Cadenya::Resources::ToolSets::Secrets#retrieve
      class SecretRetrieveParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!attribute tool_set_id
        #
        #   @return [String]
        required :tool_set_id, String

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!method initialize(tool_set_id:, id:, workspace_id: nil, request_options: {})
        #   @param tool_set_id [String]
        #   @param id [String]
        #   @param workspace_id [String]
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
