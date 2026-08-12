# typed: strong

module Cadenya
  module Models
    AgentVariationSpecModelConfig = Agents::AgentVariationSpecModelConfig

    module Agents
      class AgentVariationSpecModelConfig < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::AgentVariationSpecModelConfig,
              Cadenya::Internal::AnyHash
            )
          end

        # The model identifier in family/model format (e.g., "claude/opus-4.6",
        # "claude/sonnet-4.5")
        sig { returns(String) }
        attr_accessor :model_id

        # Cap on output tokens per LLM call. Must not exceed the model's
        # spec.max_output_tokens. Requires the model's "maxOutputTokens" capability.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_output_tokens

        sig { params(max_output_tokens: Integer).void }
        attr_writer :max_output_tokens

        # Reasoning effort. Requires the model's "reasoning" capability.
        sig do
          returns(
            T.nilable(
              Cadenya::Agents::AgentVariationSpecModelConfig::ReasoningEffort::OrSymbol
            )
          )
        end
        attr_reader :reasoning_effort

        sig do
          params(
            reasoning_effort:
              Cadenya::Agents::AgentVariationSpecModelConfig::ReasoningEffort::OrSymbol
          ).void
        end
        attr_writer :reasoning_effort

        # Sequences that stop generation when produced. Empty means none. No count cap
        # here — providers impose their own limits (surfaced as the "stopSequences"
        # capability's `limit` on the model spec), and it is the caller's responsibility
        # to stay within the selected model's limit. Requires the model's "stopSequences"
        # capability.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :stop_sequences

        sig { params(stop_sequences: T::Array[String]).void }
        attr_writer :stop_sequences

        # Sampling temperature for model inference (0.0 to 1.0) Lower values produce more
        # deterministic outputs, higher values increase randomness. Presence-tracked so a
        # deliberate 0.0 (fully deterministic) is distinguishable from unset.
        sig { returns(T.nilable(Float)) }
        attr_reader :temperature

        sig { params(temperature: Float).void }
        attr_writer :temperature

        # Only sample from the top_k most likely tokens. Requires the model's "topK"
        # capability.
        sig { returns(T.nilable(Integer)) }
        attr_reader :top_k

        sig { params(top_k: Integer).void }
        attr_writer :top_k

        # Nucleus sampling: only tokens comprising the top_p probability mass are
        # considered. Requires the model's "topP" capability.
        sig { returns(T.nilable(Float)) }
        attr_reader :top_p

        sig { params(top_p: Float).void }
        attr_writer :top_p

        # ModelConfig defines the model configuration for a variation.
        #
        # Every knob besides model_id is honored only when the assigned model's
        # spec.capabilities lists the matching capability.
        sig do
          params(
            model_id: String,
            max_output_tokens: Integer,
            reasoning_effort:
              Cadenya::Agents::AgentVariationSpecModelConfig::ReasoningEffort::OrSymbol,
            stop_sequences: T::Array[String],
            temperature: Float,
            top_k: Integer,
            top_p: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # The model identifier in family/model format (e.g., "claude/opus-4.6",
          # "claude/sonnet-4.5")
          model_id:,
          # Cap on output tokens per LLM call. Must not exceed the model's
          # spec.max_output_tokens. Requires the model's "maxOutputTokens" capability.
          max_output_tokens: nil,
          # Reasoning effort. Requires the model's "reasoning" capability.
          reasoning_effort: nil,
          # Sequences that stop generation when produced. Empty means none. No count cap
          # here — providers impose their own limits (surfaced as the "stopSequences"
          # capability's `limit` on the model spec), and it is the caller's responsibility
          # to stay within the selected model's limit. Requires the model's "stopSequences"
          # capability.
          stop_sequences: nil,
          # Sampling temperature for model inference (0.0 to 1.0) Lower values produce more
          # deterministic outputs, higher values increase randomness. Presence-tracked so a
          # deliberate 0.0 (fully deterministic) is distinguishable from unset.
          temperature: nil,
          # Only sample from the top_k most likely tokens. Requires the model's "topK"
          # capability.
          top_k: nil,
          # Nucleus sampling: only tokens comprising the top_p probability mass are
          # considered. Requires the model's "topP" capability.
          top_p: nil
        )
        end

        sig do
          override.returns(
            {
              model_id: String,
              max_output_tokens: Integer,
              reasoning_effort:
                Cadenya::Agents::AgentVariationSpecModelConfig::ReasoningEffort::OrSymbol,
              stop_sequences: T::Array[String],
              temperature: Float,
              top_k: Integer,
              top_p: Float
            }
          )
        end
        def to_hash
        end

        # Reasoning effort. Requires the model's "reasoning" capability.
        module ReasoningEffort
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Cadenya::Agents::AgentVariationSpecModelConfig::ReasoningEffort
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          REASONING_EFFORT_UNSPECIFIED =
            T.let(
              :REASONING_EFFORT_UNSPECIFIED,
              Cadenya::Agents::AgentVariationSpecModelConfig::ReasoningEffort::TaggedSymbol
            )
          REASONING_EFFORT_NONE =
            T.let(
              :REASONING_EFFORT_NONE,
              Cadenya::Agents::AgentVariationSpecModelConfig::ReasoningEffort::TaggedSymbol
            )
          REASONING_EFFORT_LOW =
            T.let(
              :REASONING_EFFORT_LOW,
              Cadenya::Agents::AgentVariationSpecModelConfig::ReasoningEffort::TaggedSymbol
            )
          REASONING_EFFORT_MEDIUM =
            T.let(
              :REASONING_EFFORT_MEDIUM,
              Cadenya::Agents::AgentVariationSpecModelConfig::ReasoningEffort::TaggedSymbol
            )
          REASONING_EFFORT_HIGH =
            T.let(
              :REASONING_EFFORT_HIGH,
              Cadenya::Agents::AgentVariationSpecModelConfig::ReasoningEffort::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Agents::AgentVariationSpecModelConfig::ReasoningEffort::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
