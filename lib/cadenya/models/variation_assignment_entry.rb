# frozen_string_literal: true

module Cadenya
  module Models
    class VariationAssignmentEntry < Cadenya::Internal::Type::BaseModel
      # @!attribute sub_agent_id
      #
      #   @return [String, nil]
      optional :sub_agent_id, String, api_name: :subAgentId

      # @!attribute tool_id
      #
      #   @return [String, nil]
      optional :tool_id, String, api_name: :toolId

      # @!attribute tool_set_id
      #
      #   @return [String, nil]
      optional :tool_set_id, String, api_name: :toolSetId

      # @!method initialize(sub_agent_id: nil, tool_id: nil, tool_set_id: nil)
      #   @param sub_agent_id [String]
      #   @param tool_id [String]
      #   @param tool_set_id [String]
    end
  end
end
