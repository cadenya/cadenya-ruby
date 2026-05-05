# typed: strong

module Cadenya
  module Models
    ObjectiveTask = Objectives::ObjectiveTask

    module Objectives
      class ObjectiveTask < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveTask,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(Cadenya::Objectives::ObjectiveTaskData) }
        attr_reader :data

        sig do
          params(data: Cadenya::Objectives::ObjectiveTaskData::OrHash).void
        end
        attr_writer :data

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

        # ObjectiveTask represents a task within an objective, typically created and
        # managed by an AI agent to track progress toward completing the objective.
        sig do
          params(
            data: Cadenya::Objectives::ObjectiveTaskData::OrHash,
            metadata: Cadenya::BareMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          data:,
          # BareMetadata contains the minimal metadata for a resource: the ID and an
          # optional human-readable name. These are used for reference fields where the full
          # metadata (account scoping, timestamps, labels, external IDs) is not needed —
          # e.g., the tool references inside an agent variation spec or the tools assigned
          # to an objective. Both fields are server-populated; clients provide IDs through
          # sibling fields rather than by constructing a BareMetadata themselves.
          metadata:
        )
        end

        sig do
          override.returns(
            {
              data: Cadenya::Objectives::ObjectiveTaskData,
              metadata: Cadenya::BareMetadata
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
