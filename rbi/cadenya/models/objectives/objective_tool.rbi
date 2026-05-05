# typed: strong

module Cadenya
  module Models
    ObjectiveTool = Objectives::ObjectiveTool

    module Objectives
      class ObjectiveTool < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveTool,
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
        attr_reader :metadata

        sig { params(metadata: Cadenya::BareMetadata::OrHash).void }
        attr_writer :metadata

        # Snapshot of the tool at the time it was assigned to the objective. Because tools
        # can change over time, snapshots are used to ensure tools don't change
        # unexpectedly during an objective's lifecycle.
        sig { returns(T.nilable(Cadenya::ToolSets::Tool)) }
        attr_reader :snapshot

        sig { params(snapshot: Cadenya::ToolSets::Tool::OrHash).void }
        attr_writer :snapshot

        # ObjectiveTool represents a tool that was assigned to an objective.
        sig do
          params(
            metadata: Cadenya::BareMetadata::OrHash,
            snapshot: Cadenya::ToolSets::Tool::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # BareMetadata contains the minimal metadata for a resource: the ID and an
          # optional human-readable name. These are used for reference fields where the full
          # metadata (account scoping, timestamps, labels, external IDs) is not needed —
          # e.g., the tool references inside an agent variation spec or the tools assigned
          # to an objective. Both fields are server-populated; clients provide IDs through
          # sibling fields rather than by constructing a BareMetadata themselves.
          metadata:,
          # Snapshot of the tool at the time it was assigned to the objective. Because tools
          # can change over time, snapshots are used to ensure tools don't change
          # unexpectedly during an objective's lifecycle.
          snapshot: nil
        )
        end

        sig do
          override.returns(
            {
              metadata: Cadenya::BareMetadata,
              snapshot: Cadenya::ToolSets::Tool
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
