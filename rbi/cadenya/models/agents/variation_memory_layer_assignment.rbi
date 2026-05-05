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
        sig { returns(T.nilable(Cadenya::BareMetadata)) }
        attr_reader :memory_layer

        sig { params(memory_layer: Cadenya::BareMetadata::OrHash).void }
        attr_writer :memory_layer

        # Position in the variation's baseline stack. Lower values sit lower; the
        # highest-position assignment is on top of the variation's baseline. Gaps are fine
        # — only relative position matters. Positions must be unique within a variation; a
        # request that would collide with an existing assignment's position is rejected
        # with InvalidArgument.
        sig { returns(T.nilable(Integer)) }
        attr_reader :position

        sig { params(position: Integer).void }
        attr_writer :position

        # Assignment row id — handle for removing the assignment. Distinct from the
        # referenced memory layer's id.
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # VariationMemoryLayerAssignment attaches a single MemoryLayer to a variation at a
        # given position in the variation's baseline memory stack. A variation has at most
        # one assignment per memory_layer_id.
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
          id: nil,
          # BareMetadata contains the minimal metadata for a resource: the ID and an
          # optional human-readable name. These are used for reference fields where the full
          # metadata (account scoping, timestamps, labels, external IDs) is not needed —
          # e.g., the tool references inside an agent variation spec or the tools assigned
          # to an objective. Both fields are server-populated; clients provide IDs through
          # sibling fields rather than by constructing a BareMetadata themselves.
          memory_layer: nil,
          # Position in the variation's baseline stack. Lower values sit lower; the
          # highest-position assignment is on top of the variation's baseline. Gaps are fine
          # — only relative position matters. Positions must be unique within a variation; a
          # request that would collide with an existing assignment's position is rejected
          # with InvalidArgument.
          position: nil
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
