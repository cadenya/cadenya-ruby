# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentVariationSpecConstraints < Cadenya::Internal::Type::BaseModel
        # @!attribute max_sub_objectives
        #   The maximum number of sub-objectives that can be created. 0 means no limit.
        #
        #   @return [Integer, nil]
        optional :max_sub_objectives, Integer, api_name: :maxSubObjectives

        # @!attribute max_tool_calls
        #   The maximum number of tool calls that can be made. 0 means no limit.
        #
        #   @return [Integer, nil]
        optional :max_tool_calls, Integer, api_name: :maxToolCalls

        # @!method initialize(max_sub_objectives: nil, max_tool_calls: nil)
        #   @param max_sub_objectives [Integer] The maximum number of sub-objectives that can be created. 0 means no limit.
        #
        #   @param max_tool_calls [Integer] The maximum number of tool calls that can be made. 0 means no limit.
      end
    end

    AgentVariationSpecConstraints = Agents::AgentVariationSpecConstraints
  end
end
