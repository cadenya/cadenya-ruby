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
        #   @return [String]
        required :workspace_id, String

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

        # @!attribute variation_id
        #
        #   @return [String]
        required :variation_id, String

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

        # @!method initialize(workspace_id:, agent_id:, variation_id:, sub_agent_id: nil, tool_id: nil, tool_set_id: nil, request_options: {})
        #   @param workspace_id [String]
        #   @param agent_id [String]
        #   @param variation_id [String]
        #   @param sub_agent_id [String]
        #   @param tool_id [String]
        #   @param tool_set_id [String]
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
