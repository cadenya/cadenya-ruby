# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::Variations#add_assignment
      class VariationAssignment < Cadenya::Internal::Type::BaseModel
        # @!attribute agent
        #   BareMetadata contains the minimal metadata for a resource: the ID and an
        #   optional human-readable name. These are used for reference fields where the full
        #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
        #   e.g., the tool references inside an agent variation spec or the tools assigned
        #   to an objective. Both fields are server-populated; clients provide IDs through
        #   sibling fields rather than by constructing a BareMetadata themselves.
        #
        #   @return [Cadenya::Models::BareMetadata, nil]
        optional :agent, -> { Cadenya::BareMetadata }

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

        # @!attribute type
        #   The JSON name of the variant set in `reference` (e.g. "toolSet"). Filled by the
        #   server; drives the discriminated union in the generated OpenAPI.
        #
        #   @return [String, nil]
        optional :type, String

        response_only do
          # @!attribute id
          #
          #   @return [String, nil]
          optional :id, String
        end

        # @!method initialize(id: nil, agent: nil, tool: nil, tool_set: nil, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::VariationAssignment} for more details.
        #
        #   A read-only reference to a single tool, tool set, or sub-agent attached to a
        #   variation. Read the full set of assignments via
        #   `AgentVariationInfo.assignments`; mutations go through the dedicated add/remove
        #   assignment endpoints.
        #
        #   The `id` identifies the assignment itself (not the referenced resource) and is
        #   the handle used to remove the assignment. It is returned by the add endpoint and
        #   present on every entry in `AgentVariationInfo.assignments`.
        #
        #   @param id [String]
        #
        #   @param agent [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
        #
        #   @param tool [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
        #
        #   @param tool_set [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
        #
        #   @param type [String] The JSON name of the variant set in `reference` (e.g. "toolSet"). Filled by
      end
    end
  end
end
