# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AddAgentVariationAssignmentRequestSubAgentID < Cadenya::Internal::Type::BaseModel
        # @!attribute sub_agent_id
        #
        #   @return [String]
        required :sub_agent_id, String, api_name: :subAgentId

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestSubAgentID::Type]
        required :type, enum: -> { Cadenya::Agents::AddAgentVariationAssignmentRequestSubAgentID::Type }

        # @!method initialize(sub_agent_id:, type:)
        #   @param sub_agent_id [String]
        #   @param type [Symbol, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestSubAgentID::Type]

        # @see Cadenya::Models::Agents::AddAgentVariationAssignmentRequestSubAgentID#type
        module Type
          extend Cadenya::Internal::Type::Enum

          SUB_AGENT_ID = :subAgentId

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
