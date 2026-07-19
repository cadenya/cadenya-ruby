# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class VariationAssignmentAgent < Cadenya::Internal::Type::BaseModel
        # @!attribute agent
        #   BareMetadata contains the minimal metadata for a resource: the ID and an
        #   optional human-readable name. These are used for reference fields where the full
        #   metadata (account scoping, timestamps, labels, external IDs) is not needed —
        #   e.g., the tool references inside an agent variation spec or the tools assigned
        #   to an objective. Both fields are server-populated; clients provide IDs through
        #   sibling fields rather than by constructing a BareMetadata themselves.
        #
        #   @return [Cadenya::Models::BareMetadata]
        required :agent, -> { Cadenya::BareMetadata }

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::Agents::VariationAssignmentAgent::Type]
        required :type, enum: -> { Cadenya::Agents::VariationAssignmentAgent::Type }

        response_only do
          # @!attribute id
          #
          #   @return [String, nil]
          optional :id, String
        end

        # @!method initialize(agent:, type:, id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::VariationAssignmentAgent} for more details.
        #
        #   @param agent [Cadenya::Models::BareMetadata] BareMetadata contains the minimal metadata for a resource: the ID and an
        #
        #   @param type [Symbol, Cadenya::Models::Agents::VariationAssignmentAgent::Type]
        #
        #   @param id [String]

        # @see Cadenya::Models::Agents::VariationAssignmentAgent#type
        module Type
          extend Cadenya::Internal::Type::Enum

          AGENT = :agent

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    VariationAssignmentAgent = Agents::VariationAssignmentAgent
  end
end
