# frozen_string_literal: true

module Cadenya
  module Models
    module APIKeys
      # @see Cadenya::Resources::APIKeys::Access#add
      class AccessAddParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute workspace_id
        #   The workspace to grant access to.
        #
        #   @return [String, nil]
        optional :workspace_id, String, api_name: :workspaceId

        # @!method initialize(id:, workspace_id: nil, request_options: {})
        #   @param id [String]
        #
        #   @param workspace_id [String] The workspace to grant access to.
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
