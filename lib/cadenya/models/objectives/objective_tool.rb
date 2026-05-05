# frozen_string_literal: true

module Cadenya
  module Models
    module Objectives
      # @see Cadenya::Resources::Objectives::Tools#list
      class ObjectiveTool < Cadenya::Internal::Type::BaseModel
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

        # @!attribute snapshot
        #   Snapshot of the tool at the time it was assigned to the objective. Because tools
        #   can change over time, snapshots are used to ensure tools don't change
        #   unexpectedly during an objective's lifecycle.
        #
        #   @return [Cadenya::Models::ToolSets::Tool, nil]
        optional :snapshot, -> { Cadenya::ToolSets::Tool }

        # @!method initialize(metadata:, snapshot: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Objectives::ObjectiveTool} for more details.
        #
        #   ObjectiveTool represents a tool that was assigned to an objective.
        #
        #   @param metadata [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
        #
        #   @param snapshot [Cadenya::Models::ToolSets::Tool] Snapshot of the tool at the time it was assigned to the objective. Because tools
      end
    end

    ObjectiveTool = Objectives::ObjectiveTool
  end
end
