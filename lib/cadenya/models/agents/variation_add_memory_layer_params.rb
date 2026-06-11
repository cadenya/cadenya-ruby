# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::Variations#add_memory_layer
      class VariationAddMemoryLayerParams < Cadenya::Internal::Type::BaseModel
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

        # @!attribute memory_layer_id
        #   Layer to attach. Accepts the canonical `memlyr_…` form or the
        #   `external_id:<value>` form.
        #
        #   @return [String, nil]
        optional :memory_layer_id, String, api_name: :memoryLayerId

        # @!attribute position
        #   Position in the baseline cascade (lower = more specific). If omitted, the server
        #   appends at the most general end (max existing position + 1).
        #
        #   @return [Integer, nil]
        optional :position, Integer

        # @!method initialize(workspace_id:, agent_id:, variation_id:, memory_layer_id: nil, position: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::VariationAddMemoryLayerParams} for more details.
        #
        #   @param workspace_id [String]
        #
        #   @param agent_id [String]
        #
        #   @param variation_id [String]
        #
        #   @param memory_layer_id [String] Layer to attach. Accepts the canonical `memlyr_…` form or the `external_id:<valu
        #
        #   @param position [Integer] Position in the baseline cascade (lower = more specific). If
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
