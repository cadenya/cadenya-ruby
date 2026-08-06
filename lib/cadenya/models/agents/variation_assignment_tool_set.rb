# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class VariationAssignmentToolSet < Cadenya::Internal::Type::BaseModel
        # @!attribute tool_set
        #   BareMetadata contains the minimal metadata for a resource: the ID and an
        #   optional human-readable name. These are used for reference fields where the full
        #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
        #   e.g., the tool references inside an agent variation spec or the tools assigned
        #   to an objective. Both fields are server-populated; clients provide IDs through
        #   sibling fields rather than by constructing a BareMetadata themselves.
        #
        #   @return [Cadenya::Models::BareMetadata]
        required :tool_set, -> { Cadenya::BareMetadata }, api_name: :toolSet

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::Agents::VariationAssignmentToolSet::Type]
        required :type, enum: -> { Cadenya::Agents::VariationAssignmentToolSet::Type }

        response_only do
          # @!attribute id
          #
          #   @return [String, nil]
          optional :id, String
        end

        # @!method initialize(tool_set:, type:, id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::VariationAssignmentToolSet} for more details.
        #
        #   @param tool_set [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
        #
        #   @param type [Symbol, Cadenya::Models::Agents::VariationAssignmentToolSet::Type]
        #
        #   @param id [String]

        # @see Cadenya::Models::Agents::VariationAssignmentToolSet#type
        module Type
          extend Cadenya::Internal::Type::Enum

          TOOL_SET = :toolSet

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
