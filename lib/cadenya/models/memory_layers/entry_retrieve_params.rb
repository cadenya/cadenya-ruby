# frozen_string_literal: true

module Cadenya
  module Models
    module MemoryLayers
      # @see Cadenya::Resources::MemoryLayers::Entries#retrieve
      class EntryRetrieveParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute memory_layer_id
        #
        #   @return [String]
        required :memory_layer_id, String

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!method initialize(workspace_id:, memory_layer_id:, id:, request_options: {})
        #   @param workspace_id [String]
        #   @param memory_layer_id [String]
        #   @param id [String]
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
