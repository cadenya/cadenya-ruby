# typed: strong

module Cadenya
  module Models
    ObjectiveFeedbackInfo = Objectives::ObjectiveFeedbackInfo

    module Objectives
      class ObjectiveFeedbackInfo < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Objectives::ObjectiveFeedbackInfo,
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
        attr_reader :agent_variation

        sig { params(agent_variation: Cadenya::BareMetadata::OrHash).void }
        attr_writer :agent_variation

        # BareMetadata contains the minimal metadata for a resource: the ID and an
        # optional human-readable name. These are used for reference fields where the full
        # metadata (account scoping, timestamps, labels, external IDs) is not needed —
        # e.g., the tool references inside an agent variation spec or the tools assigned
        # to an objective. Both fields are server-populated; clients provide IDs through
        # sibling fields rather than by constructing a BareMetadata themselves.
        sig { returns(T.nilable(Cadenya::BareMetadata)) }
        attr_reader :objective

        sig { params(objective: Cadenya::BareMetadata::OrHash).void }
        attr_writer :objective

        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        sig { returns(Cadenya::Profile) }
        attr_accessor :submitted_by

        sig do
          params(
            submitted_by: Cadenya::Profile::OrHash,
            agent_variation: Cadenya::BareMetadata::OrHash,
            objective: Cadenya::BareMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # A profile identifies a user or non-human principal (such as an API key) at the
          # account level. Profiles are account-scoped and can be granted access to multiple
          # workspaces.
          submitted_by:,
          # BareMetadata contains the minimal metadata for a resource: the ID and an
          # optional human-readable name. These are used for reference fields where the full
          # metadata (account scoping, timestamps, labels, external IDs) is not needed —
          # e.g., the tool references inside an agent variation spec or the tools assigned
          # to an objective. Both fields are server-populated; clients provide IDs through
          # sibling fields rather than by constructing a BareMetadata themselves.
          agent_variation: nil,
          # BareMetadata contains the minimal metadata for a resource: the ID and an
          # optional human-readable name. These are used for reference fields where the full
          # metadata (account scoping, timestamps, labels, external IDs) is not needed —
          # e.g., the tool references inside an agent variation spec or the tools assigned
          # to an objective. Both fields are server-populated; clients provide IDs through
          # sibling fields rather than by constructing a BareMetadata themselves.
          objective: nil
        )
        end

        sig do
          override.returns(
            {
              agent_variation: Cadenya::BareMetadata,
              objective: Cadenya::BareMetadata,
              submitted_by: Cadenya::Profile
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
