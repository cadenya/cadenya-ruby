# typed: strong

module Cadenya
  module Models
    AgentVariationSpecCompactionConfig =
      Agents::AgentVariationSpecCompactionConfig

    module Agents
      class AgentVariationSpecCompactionConfig < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::AgentVariationSpecCompactionConfig,
              Cadenya::Internal::AnyHash
            )
          end

        # SummarizationStrategy configures LLM-powered summarization of older conversation
        # turns.
        sig do
          returns(
            T.nilable(Cadenya::Agents::CompactionConfigSummarizationStrategy)
          )
        end
        attr_reader :summarization

        sig do
          params(
            summarization:
              Cadenya::Agents::CompactionConfigSummarizationStrategy::OrHash
          ).void
        end
        attr_writer :summarization

        # ToolResultClearingStrategy configures clearing of older tool result content.
        sig do
          returns(
            T.nilable(
              Cadenya::Agents::CompactionConfigToolResultClearingStrategy
            )
          )
        end
        attr_reader :tool_result_clearing

        sig do
          params(
            tool_result_clearing:
              Cadenya::Agents::CompactionConfigToolResultClearingStrategy::OrHash
          ).void
        end
        attr_writer :tool_result_clearing

        # Trigger threshold as a percentage of the model's context window (0.0 to 1.0).
        # When input tokens reach this percentage of the model's limit, compaction
        # triggers. Default: 0.75 (75%)
        sig { returns(T.nilable(Float)) }
        attr_reader :trigger_threshold

        sig { params(trigger_threshold: Float).void }
        attr_writer :trigger_threshold

        # CompactionConfig defines how context window compaction behaves for objectives
        # using this variation.
        sig do
          params(
            summarization:
              Cadenya::Agents::CompactionConfigSummarizationStrategy::OrHash,
            tool_result_clearing:
              Cadenya::Agents::CompactionConfigToolResultClearingStrategy::OrHash,
            trigger_threshold: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # SummarizationStrategy configures LLM-powered summarization of older conversation
          # turns.
          summarization: nil,
          # ToolResultClearingStrategy configures clearing of older tool result content.
          tool_result_clearing: nil,
          # Trigger threshold as a percentage of the model's context window (0.0 to 1.0).
          # When input tokens reach this percentage of the model's limit, compaction
          # triggers. Default: 0.75 (75%)
          trigger_threshold: nil
        )
        end

        sig do
          override.returns(
            {
              summarization:
                Cadenya::Agents::CompactionConfigSummarizationStrategy,
              tool_result_clearing:
                Cadenya::Agents::CompactionConfigToolResultClearingStrategy,
              trigger_threshold: Float
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
