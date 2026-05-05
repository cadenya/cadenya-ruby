# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentVariationSpecCompactionConfig < Cadenya::Internal::Type::BaseModel
        # @!attribute summarization
        #   SummarizationStrategy configures LLM-powered summarization of older conversation
        #   turns.
        #
        #   @return [Cadenya::Models::Agents::CompactionConfigSummarizationStrategy, nil]
        optional :summarization, -> { Cadenya::Agents::CompactionConfigSummarizationStrategy }

        # @!attribute tool_result_clearing
        #   ToolResultClearingStrategy configures clearing of older tool result content.
        #
        #   @return [Cadenya::Models::Agents::CompactionConfigToolResultClearingStrategy, nil]
        optional :tool_result_clearing,
                 -> { Cadenya::Agents::CompactionConfigToolResultClearingStrategy },
                 api_name: :toolResultClearing

        # @!attribute trigger_threshold
        #   Trigger threshold as a percentage of the model's context window (0.0 to 1.0).
        #   When input tokens reach this percentage of the model's limit, compaction
        #   triggers. Default: 0.75 (75%)
        #
        #   @return [Float, nil]
        optional :trigger_threshold, Float, api_name: :triggerThreshold

        # @!method initialize(summarization: nil, tool_result_clearing: nil, trigger_threshold: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentVariationSpecCompactionConfig} for more details.
        #
        #   CompactionConfig defines how context window compaction behaves for objectives
        #   using this variation.
        #
        #   @param summarization [Cadenya::Models::Agents::CompactionConfigSummarizationStrategy] SummarizationStrategy configures LLM-powered summarization of older conversation
        #
        #   @param tool_result_clearing [Cadenya::Models::Agents::CompactionConfigToolResultClearingStrategy] ToolResultClearingStrategy configures clearing of older tool result content.
        #
        #   @param trigger_threshold [Float] Trigger threshold as a percentage of the model's context window (0.0 to 1.0).
      end
    end

    AgentVariationSpecCompactionConfig = Agents::AgentVariationSpecCompactionConfig
  end
end
