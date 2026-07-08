# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentVariationSpecProgressiveDiscovery < Cadenya::Internal::Type::BaseModel
        # @!attribute hints
        #   Free-text guidance appended to the discoverable-tools appendix in the system
        #   prompt. Hints steer the model's choice of tool names; they do not filter or rank
        #   anything, because tool_search matches names exactly rather than searching.
        #
        #   @return [Array<String>, nil]
        optional :hints, Cadenya::Internal::Type::ArrayOf[String]

        # @!attribute max_tools
        #   The most tool names tool_search will load in a single call. Requesting more than
        #   this returns an error telling the model to retry in smaller batches -- it is a
        #   per-call batch limit, not a ceiling on how many tools an objective may end up
        #   with.
        #
        #   @return [Integer, nil]
        optional :max_tools, Integer, api_name: :maxTools

        # @!method initialize(hints: nil, max_tools: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentVariationSpecProgressiveDiscovery} for more
        #   details.
        #
        #   ProgressiveDiscovery is used to indicate that the agent should automatically
        #   discover tools that are not explicitly assigned to it. Max tools is the maximum
        #   number of tools that can be discovered per search. Hints are optional hints for
        #   tool search. These are used in conjunction with the context-aware tool search
        #   and can help select the best tools for the task.
        #
        #   @param hints [Array<String>] Free-text guidance appended to the discoverable-tools appendix in the
        #
        #   @param max_tools [Integer] The most tool names tool_search will load in a single call. Requesting more
      end
    end

    AgentVariationSpecProgressiveDiscovery = Agents::AgentVariationSpecProgressiveDiscovery
  end
end
