# typed: strong

module Cadenya
  module Models
    module Agents
      class VariationAssignment < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::VariationAssignment,
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
        attr_reader :agent

        sig { params(agent: Cadenya::BareMetadata::OrHash).void }
        attr_writer :agent

        # BareMetadata contains the minimal metadata for a resource: the ID and an
        # optional human-readable name. These are used for reference fields where the full
        # metadata (account scoping, timestamps, labels, external IDs) is not needed —
        # e.g., the tool references inside an agent variation spec or the tools assigned
        # to an objective. Both fields are server-populated; clients provide IDs through
        # sibling fields rather than by constructing a BareMetadata themselves.
        sig { returns(T.nilable(Cadenya::BareMetadata)) }
        attr_reader :tool

        sig { params(tool: Cadenya::BareMetadata::OrHash).void }
        attr_writer :tool

        # BareMetadata contains the minimal metadata for a resource: the ID and an
        # optional human-readable name. These are used for reference fields where the full
        # metadata (account scoping, timestamps, labels, external IDs) is not needed —
        # e.g., the tool references inside an agent variation spec or the tools assigned
        # to an objective. Both fields are server-populated; clients provide IDs through
        # sibling fields rather than by constructing a BareMetadata themselves.
        sig { returns(T.nilable(Cadenya::BareMetadata)) }
        attr_reader :tool_set

        sig { params(tool_set: Cadenya::BareMetadata::OrHash).void }
        attr_writer :tool_set

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # A read-only reference to a single tool, tool set, or sub-agent attached to a
        # variation. Read the full set of assignments via
        # `AgentVariationInfo.assignments`; mutations go through the dedicated add/remove
        # assignment endpoints.
        #
        # The `id` identifies the assignment itself (not the referenced resource) and is
        # the handle used to remove the assignment. It is returned by the add endpoint and
        # present on every entry in `AgentVariationInfo.assignments`.
        sig do
          params(
            id: String,
            agent: Cadenya::BareMetadata::OrHash,
            tool: Cadenya::BareMetadata::OrHash,
            tool_set: Cadenya::BareMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          # BareMetadata contains the minimal metadata for a resource: the ID and an
          # optional human-readable name. These are used for reference fields where the full
          # metadata (account scoping, timestamps, labels, external IDs) is not needed —
          # e.g., the tool references inside an agent variation spec or the tools assigned
          # to an objective. Both fields are server-populated; clients provide IDs through
          # sibling fields rather than by constructing a BareMetadata themselves.
          agent: nil,
          # BareMetadata contains the minimal metadata for a resource: the ID and an
          # optional human-readable name. These are used for reference fields where the full
          # metadata (account scoping, timestamps, labels, external IDs) is not needed —
          # e.g., the tool references inside an agent variation spec or the tools assigned
          # to an objective. Both fields are server-populated; clients provide IDs through
          # sibling fields rather than by constructing a BareMetadata themselves.
          tool: nil,
          # BareMetadata contains the minimal metadata for a resource: the ID and an
          # optional human-readable name. These are used for reference fields where the full
          # metadata (account scoping, timestamps, labels, external IDs) is not needed —
          # e.g., the tool references inside an agent variation spec or the tools assigned
          # to an objective. Both fields are server-populated; clients provide IDs through
          # sibling fields rather than by constructing a BareMetadata themselves.
          tool_set: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              agent: Cadenya::BareMetadata,
              tool: Cadenya::BareMetadata,
              tool_set: Cadenya::BareMetadata
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
