# typed: strong

module Cadenya
  module Models
    module Agents
      class VariationMemoryLayerAssignment < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::VariationMemoryLayerAssignment,
              Cadenya::Internal::AnyHash
            )
          end

        # BareMetadata contains the minimal metadata for a resource: the ID and an
        # optional human-readable name. These are used for reference fields where the full
        # metadata (account scoping, timestamps, labels, external IDs) is not needed —
        # e.g., the tool references inside an agent variation spec or the tools assigned
        # to an objective. Both fields are server-populated; clients provide IDs through
        # sibling fields rather than by constructing a BareMetadata themselves.
        sig { returns(Cadenya::BareMetadata) }
        attr_accessor :memory_layer

        # Position in the variation's baseline cascade. Position is specificity,
        # CSS-style: a LOWER position is more specific and is consulted first; the
        # highest-position assignment is the most general fallback. Gaps are fine — only
        # relative position matters. Positions must be unique within a variation; a
        # request that would collide with an existing assignment's position is rejected
        # with InvalidArgument.
        sig { returns(Integer) }
        attr_accessor :position

        # Assignment row id — handle for removing the assignment. Distinct from the
        # referenced memory layer's id.
        sig { returns(String) }
        attr_accessor :id

        # VariationMemoryLayerAssignment attaches a single MemoryLayer to a variation at a
        # given position in the variation's baseline memory cascade. A variation has at
        # most one assignment per memory_layer_id.
        #
        # Variations only support whole-layer attachments — entry pinning is an
        # objective-level capability.
        sig do
          params(
            id: String,
            memory_layer: Cadenya::BareMetadata::OrHash,
            position: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Assignment row id — handle for removing the assignment. Distinct from the
          # referenced memory layer's id.
          id:,
          # BareMetadata contains the minimal metadata for a resource: the ID and an
          # optional human-readable name. These are used for reference fields where the full
          # metadata (account scoping, timestamps, labels, external IDs) is not needed —
          # e.g., the tool references inside an agent variation spec or the tools assigned
          # to an objective. Both fields are server-populated; clients provide IDs through
          # sibling fields rather than by constructing a BareMetadata themselves.
          memory_layer:,
          # Position in the variation's baseline cascade. Position is specificity,
          # CSS-style: a LOWER position is more specific and is consulted first; the
          # highest-position assignment is the most general fallback. Gaps are fine — only
          # relative position matters. Positions must be unique within a variation; a
          # request that would collide with an existing assignment's position is rejected
          # with InvalidArgument.
          position:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              memory_layer: Cadenya::BareMetadata,
              position: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
