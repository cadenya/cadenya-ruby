# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::Variations#add_memory_layer
      class VariationMemoryLayerAssignment < Cadenya::Internal::Type::BaseModel
        # @!attribute memory_layer
        #   BareMetadata contains the minimal metadata for a resource: the ID and an
        #   optional human-readable name. These are used for reference fields where the full
        #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
        #   e.g., the tool references inside an agent variation spec or the tools assigned
        #   to an objective. Both fields are server-populated; clients provide IDs through
        #   sibling fields rather than by constructing a BareMetadata themselves.
        #
        #   @return [Cadenya::Models::BareMetadata, nil]
        optional :memory_layer, -> { Cadenya::BareMetadata }, api_name: :memoryLayer

        # @!attribute position
        #   Position in the variation's baseline cascade. Position is specificity,
        #   CSS-style: a LOWER position is more specific and is consulted first; the
        #   highest-position assignment is the most general fallback. Gaps are fine — only
        #   relative position matters. Positions must be unique within a variation; a
        #   request that would collide with an existing assignment's position is rejected
        #   with InvalidArgument.
        #
        #   @return [Integer, nil]
        optional :position, Integer

        response_only do
          # @!attribute id
          #   Assignment row id — handle for removing the assignment. Distinct from the
          #   referenced memory layer's id.
          #
          #   @return [String, nil]
          optional :id, String
        end

        # @!method initialize(id: nil, memory_layer: nil, position: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::VariationMemoryLayerAssignment} for more details.
        #
        #   VariationMemoryLayerAssignment attaches a single MemoryLayer to a variation at a
        #   given position in the variation's baseline memory cascade. A variation has at
        #   most one assignment per memory_layer_id.
        #
        #   Variations only support whole-layer attachments — entry pinning is an
        #   objective-level capability.
        #
        #   @param id [String] Assignment row id — handle for removing the assignment. Distinct
        #
        #   @param memory_layer [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
        #
        #   @param position [Integer] Position in the variation's baseline cascade. Position is
      end
    end
  end
end
