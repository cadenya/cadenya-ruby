# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentVariationSpecConstraints < Cadenya::Internal::Type::BaseModel
        # @!attribute inactivity_timeout
        #   How long an objective may sit with no activity (no user messages, no LLM calls)
        #   before it is finalized as timed out. Between 1 minute and 24 hours. When not
        #   set, objectives are still swept at the system-wide 24 hour maximum — every
        #   objective eventually reaches a terminal state.
        #
        #   @return [Integer, nil]
        optional :inactivity_timeout, Integer, api_name: :inactivityTimeout

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

        # @!method initialize(inactivity_timeout: nil, max_sub_objectives: nil, max_tool_calls: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentVariationSpecConstraints} for more details.
        #
        #   @param inactivity_timeout [Integer] How long an objective may sit with no activity (no user messages, no
        #
        #   @param max_sub_objectives [Integer] The maximum number of sub-objectives that can be created. 0 means no limit.
        #
        #   @param max_tool_calls [Integer] The maximum number of tool calls that can be made. 0 means no limit.
      end
    end

    AgentVariationSpecConstraints = Agents::AgentVariationSpecConstraints
  end
end
