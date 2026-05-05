# frozen_string_literal: true

module Cadenya
  module Models
    class VariationMemoryLayerEntry < Cadenya::Internal::Type::BaseModel
      # @!attribute memory_layer_id
      #   external_id:<value> form. Canonical IDs are rejected.
      #
      #   @return [String, nil]
      optional :memory_layer_id, String, api_name: :memoryLayerId

      # @!attribute position
      #
      #   @return [Integer, nil]
      optional :position, Integer

      # @!method initialize(memory_layer_id: nil, position: nil)
      #   @param memory_layer_id [String] external_id:<value> form. Canonical IDs are rejected.
      #
      #   @param position [Integer]
    end
  end
end
