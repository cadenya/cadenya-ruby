# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      class ObjectiveFeedbackInfo < Cadenya::Internal::Type::BaseModel
        response_only do
          # @!attribute agent_variation
          #   BareMetadata contains the minimal metadata for a resource: the ID and an
          #   optional human-readable name. These are used for reference fields where the full
          #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
          #   e.g., the tool references inside an agent variation spec or the tools assigned
          #   to an objective. Both fields are server-populated; clients provide IDs through
          #   sibling fields rather than by constructing a BareMetadata themselves.
          #
          #   @return [Cadenya::Models::BareMetadata, nil]
          optional :agent_variation, -> { Cadenya::BareMetadata }, api_name: :agentVariation

          # @!attribute objective
          #   BareMetadata contains the minimal metadata for a resource: the ID and an
          #   optional human-readable name. These are used for reference fields where the full
          #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
          #   e.g., the tool references inside an agent variation spec or the tools assigned
          #   to an objective. Both fields are server-populated; clients provide IDs through
          #   sibling fields rather than by constructing a BareMetadata themselves.
          #
          #   @return [Cadenya::Models::BareMetadata, nil]
          optional :objective, -> { Cadenya::BareMetadata }

          # @!attribute submitted_by
          #   A profile identifies a user or non-human principal (such as an API key) at the
          #   account level. Profiles are account-scoped and can be granted access to multiple
          #   workspaces.
          #
          #   @return [Cadenya::Models::Profile]
          required :submitted_by, -> { Cadenya::Profile }, api_name: :submittedBy
        end

        # @!method initialize(agent_variation: nil, objective: nil, submitted_by:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ObjectiveFeedbackInfo} for more details.
        #
        #   @param agent_variation [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
        #
        #   @param objective [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
        #
        #   @param submitted_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
      end
    end

    ObjectiveFeedbackInfo = Objectives::ObjectiveFeedbackInfo
  end
end
