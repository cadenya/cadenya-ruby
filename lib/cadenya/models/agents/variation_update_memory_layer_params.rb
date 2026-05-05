# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::Variations#update_memory_layer
      class VariationUpdateMemoryLayerParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

        # @!attribute variation_id
        #
        #   @return [String]
        required :variation_id, String

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute position
        #   New position. Only field currently updatable on an assignment.
        #
        #   @return [Integer, nil]
        optional :position, Integer

        # @!method initialize(workspace_id:, agent_id:, variation_id:, id:, position: nil, request_options: {})
        #   @param workspace_id [String]
        #
        #   @param agent_id [String]
        #
        #   @param variation_id [String]
        #
        #   @param id [String]
        #
        #   @param position [Integer] New position. Only field currently updatable on an assignment.
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
