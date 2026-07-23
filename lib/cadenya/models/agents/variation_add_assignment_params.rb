# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::Variations#add_assignment
      class VariationAddAssignmentParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String, nil]
        optional :workspace_id, String

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

        # @!attribute variation_id
        #
        #   @return [String]
        required :variation_id, String

        # @!attribute body
        #   Attach a single tool, tool set, or sub-agent to a variation. Exactly one of the
        #   target fields must be set; the assignment kind is inferred from the populated
        #   field.
        #
        #   @return [Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolID, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolSetID, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestSubAgentID]
        required :body, union: -> { Cadenya::Agents::VariationAddAssignmentParams::Body }

        # @!method initialize(agent_id:, variation_id:, body:, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::VariationAddAssignmentParams} for more details.
        #
        #   @param agent_id [String]
        #
        #   @param variation_id [String]
        #
        #   @param body [Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolID, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolSetID, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestSubAgentID] Attach a single tool, tool set, or sub-agent to a variation. Exactly one
        #
        #   @param workspace_id [String]
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

        # Attach a single tool, tool set, or sub-agent to a variation. Exactly one of the
        # target fields must be set; the assignment kind is inferred from the populated
        # field.
        module Body
          extend Cadenya::Internal::Type::Union

          discriminator :type

          variant :toolId, -> { Cadenya::Agents::AddAgentVariationAssignmentRequestToolID }

          variant :toolSetId, -> { Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID }

          variant :subAgentId, -> { Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID }

          # @!method self.variants
          #   @return [Array(Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolID, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolSetID, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestSubAgentID)]
        end
      end
    end
  end
end
