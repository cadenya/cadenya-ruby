# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveToolCallInfo < Cadenya::Internal::Type::BaseModel
        # @!attribute created_by
        #   A profile identifies a user or non-human principal (such as an API key) at the
        #   account level. Profiles are account-scoped and can be granted access to multiple
        #   workspaces.
        #
        #   @return [Cadenya::Models::Profile, nil]
        optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

        # @!attribute objective
        #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
        #   runs)
        #
        #   @return [Cadenya::Models::OperationMetadata]
        required :objective, -> { Cadenya::OperationMetadata }

        # @!attribute tool
        #   BareMetadata contains the minimal metadata for a resource: the ID and an
        #   optional human-readable name. These are used for reference fields where the full
        #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
        #   e.g., the tool references inside an agent variation spec or the tools assigned
        #   to an objective. Both fields are server-populated; clients provide IDs through
        #   sibling fields rather than by constructing a BareMetadata themselves.
        #
        #   @return [Cadenya::Models::BareMetadata, nil]
        optional :tool, -> { Cadenya::BareMetadata }

        # @!attribute tool_set
        #   BareMetadata contains the minimal metadata for a resource: the ID and an
        #   optional human-readable name. These are used for reference fields where the full
        #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
        #   e.g., the tool references inside an agent variation spec or the tools assigned
        #   to an objective. Both fields are server-populated; clients provide IDs through
        #   sibling fields rather than by constructing a BareMetadata themselves.
        #
        #   @return [Cadenya::Models::BareMetadata, nil]
        optional :tool_set, -> { Cadenya::BareMetadata }, api_name: :toolSet

        # @!method initialize(created_by: nil, objective:, tool: nil, tool_set: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ObjectiveToolCallInfo} for more details.
        #
        #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
        #
        #   @param objective [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
        #
        #   @param tool [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
        #
        #   @param tool_set [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
      end
    end

    ObjectiveToolCallInfo = Objectives::ObjectiveToolCallInfo
  end
end
