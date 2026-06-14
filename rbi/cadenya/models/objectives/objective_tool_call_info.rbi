# typed: strong

module Cadenya
  module Models
    ObjectiveToolCallInfo = Objectives::ObjectiveToolCallInfo

    module Objectives
      class ObjectiveToolCallInfo < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveToolCallInfo,
              Cadenya::Internal::AnyHash
            )
          end

        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        sig { returns(T.nilable(Cadenya::Profile)) }
        attr_reader :created_by

        sig { params(created_by: Cadenya::Profile::OrHash).void }
        attr_writer :created_by

        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        sig { returns(T.nilable(Cadenya::OperationMetadata)) }
        attr_reader :objective

        sig { params(objective: Cadenya::OperationMetadata::OrHash).void }
        attr_writer :objective

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

        sig do
          params(
            created_by: Cadenya::Profile::OrHash,
            objective: Cadenya::OperationMetadata::OrHash,
            tool: Cadenya::BareMetadata::OrHash,
            tool_set: Cadenya::BareMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # A profile identifies a user or non-human principal (such as an API key) at the
          # account level. Profiles are account-scoped and can be granted access to multiple
          # workspaces.
          created_by: nil,
          # Metadata for ephemeral operations and activities (e.g., objectives, executions,
          # runs)
          objective: nil,
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
              created_by: Cadenya::Profile,
              objective: Cadenya::OperationMetadata,
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
