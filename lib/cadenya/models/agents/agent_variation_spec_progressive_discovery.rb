# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentVariationSpecProgressiveDiscovery < Cadenya::Internal::Type::BaseModel
        # @!attribute hints
        #
        #   @return [Array<String>, nil]
        optional :hints, Cadenya::Internal::Type::ArrayOf[String]

        # @!attribute max_tools
        #
        #   @return [Integer, nil]
        optional :max_tools, Integer, api_name: :maxTools

        # @!attribute rerank_threshold
        #   Rerank Threshold is an optional value that instructs whether or not to run a
        #   search result through a embedding/reranker process which can improve performance
        #   and reduce context bloat when tools reach the configured threshold. If a tool
        #   match must exceed 0.8, for example, the tool very closely match the query the
        #   tool search performed.
        #
        #   @return [Float, nil]
        optional :rerank_threshold, Float, api_name: :rerankThreshold

        # @!method initialize(hints: nil, max_tools: nil, rerank_threshold: nil)
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
        #   @param hints [Array<String>]
        #
        #   @param max_tools [Integer]
        #
        #   @param rerank_threshold [Float] Rerank Threshold is an optional value that instructs whether or not to run a sea
      end
    end

    AgentVariationSpecProgressiveDiscovery = Agents::AgentVariationSpecProgressiveDiscovery
  end
end
