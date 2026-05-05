# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # @see Cadenya::Resources::Objectives::Tasks#retrieve
      class ObjectiveTask < Cadenya::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [Cadenya::Models::Objectives::ObjectiveTaskData]
        required :data, -> { Cadenya::Objectives::ObjectiveTaskData }

        # @!attribute metadata
        #   BareMetadata contains the minimal metadata for a resource: the ID and an
        #   optional human-readable name. These are used for reference fields where the full
        #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
        #   e.g., the tool references inside an agent variation spec or the tools assigned
        #   to an objective. Both fields are server-populated; clients provide IDs through
        #   sibling fields rather than by constructing a BareMetadata themselves.
        #
        #   @return [Cadenya::Models::BareMetadata]
        required :metadata, -> { Cadenya::BareMetadata }

        # @!method initialize(data:, metadata:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ObjectiveTask} for more details.
        #
        #   ObjectiveTask represents a task within an objective, typically created and
        #   managed by an AI agent to track progress toward completing the objective.
        #
        #   @param data [Cadenya::Models::Objectives::ObjectiveTaskData]
        #
        #   @param metadata [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
      end
    end

    ObjectiveTask = Objectives::ObjectiveTask
  end
end
