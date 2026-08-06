# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AddAgentVariationAssignmentRequestToolID < Cadenya::Internal::Type::BaseModel
        # @!attribute tool_id
        #
        #   @return [String]
        required :tool_id, String, api_name: :toolId

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolID::Type]
        required :type, enum: -> { Cadenya::Agents::AddAgentVariationAssignmentRequestToolID::Type }

        # @!method initialize(tool_id:, type:)
        #   @param tool_id [String]
        #   @param type [Symbol, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolID::Type]

        # @see Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolID#type
        module Type
          extend Cadenya::Internal::Type::Enum

          TOOL_ID = :toolId

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
