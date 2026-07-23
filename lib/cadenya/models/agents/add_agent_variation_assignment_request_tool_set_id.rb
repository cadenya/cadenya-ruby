# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AddAgentVariationAssignmentRequestToolSetID < Cadenya::Internal::Type::BaseModel
        # @!attribute tool_set_id
        #
        #   @return [String]
        required :tool_set_id, String, api_name: :toolSetId

        # @!attribute type
        #
        #   @return [Symbol, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolSetID::Type]
        required :type, enum: -> { Cadenya::Agents::AddAgentVariationAssignmentRequestToolSetID::Type }

        # @!method initialize(tool_set_id:, type:)
        #   @param tool_set_id [String]
        #   @param type [Symbol, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolSetID::Type]

        # @see Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolSetID#type
        module Type
          extend Cadenya::Internal::Type::Enum

          TOOL_SET_ID = :toolSetId

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
