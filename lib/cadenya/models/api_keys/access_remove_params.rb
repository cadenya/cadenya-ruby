# frozen_string_literal: true

module Cadenya
  module Models
    module APIKeys
      # @see Cadenya::Resources::APIKeys::Access#remove
      class AccessRemoveParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, workspace_id:, request_options: {})
        #   @param id [String]
        #   @param workspace_id [String]
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
