# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentVariationSpecModelConfig < Cadenya::Internal::Type::BaseModel
        # @!attribute model_id
        #   The model identifier in family/model format (e.g., "claude/opus-4.6",
        #   "claude/sonnet-4.5")
        #
        #   @return [String]
        required :model_id, String, api_name: :modelId

        # @!attribute max_output_tokens
        #   Cap on output tokens per LLM call. Must not exceed the model's
        #   spec.max_output_tokens. Requires the model's "maxOutputTokens" capability.
        #
        #   @return [Integer, nil]
        optional :max_output_tokens, Integer, api_name: :maxOutputTokens

        # @!attribute reasoning_effort
        #   Reasoning effort. Requires the model's "reasoning" capability.
        #
        #   @return [Symbol, Cadenya::Models::Agents::AgentVariationSpecModelConfig::ReasoningEffort, nil]
        optional :reasoning_effort,
                 enum: -> { Cadenya::Agents::AgentVariationSpecModelConfig::ReasoningEffort },
                 api_name: :reasoningEffort

        # @!attribute stop_sequences
        #   Sequences that stop generation when produced. Empty means none. No count cap
        #   here — providers impose their own limits (surfaced as the "stopSequences"
        #   capability's `limit` on the model spec), and it is the caller's responsibility
        #   to stay within the selected model's limit. Requires the model's "stopSequences"
        #   capability.
        #
        #   @return [Array<String>, nil]
        optional :stop_sequences, Cadenya::Internal::Type::ArrayOf[String], api_name: :stopSequences

        # @!attribute temperature
        #   Sampling temperature for model inference (0.0 to 1.0) Lower values produce more
        #   deterministic outputs, higher values increase randomness. Presence-tracked so a
        #   deliberate 0.0 (fully deterministic) is distinguishable from unset.
        #
        #   @return [Float, nil]
        optional :temperature, Float

        # @!attribute top_k
        #   Only sample from the top_k most likely tokens. Requires the model's "topK"
        #   capability.
        #
        #   @return [Integer, nil]
        optional :top_k, Integer, api_name: :topK

        # @!attribute top_p
        #   Nucleus sampling: only tokens comprising the top_p probability mass are
        #   considered. Requires the model's "topP" capability.
        #
        #   @return [Float, nil]
        optional :top_p, Float, api_name: :topP

        # @!method initialize(model_id:, max_output_tokens: nil, reasoning_effort: nil, stop_sequences: nil, temperature: nil, top_k: nil, top_p: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentVariationSpecModelConfig} for more details.
        #
        #   ModelConfig defines the model configuration for a variation.
        #
        #   Every knob besides model_id is honored only when the assigned model's
        #   spec.capabilities lists the matching capability.
        #
        #   @param model_id [String] The model identifier in family/model format (e.g., "claude/opus-4.6", "claude/so
        #
        #   @param max_output_tokens [Integer] Cap on output tokens per LLM call. Must not exceed the model's
        #
        #   @param reasoning_effort [Symbol, Cadenya::Models::Agents::AgentVariationSpecModelConfig::ReasoningEffort] Reasoning effort. Requires the model's "reasoning" capability.
        #
        #   @param stop_sequences [Array<String>] Sequences that stop generation when produced. Empty means none.
        #
        #   @param temperature [Float] Sampling temperature for model inference (0.0 to 1.0)
        #
        #   @param top_k [Integer] Only sample from the top_k most likely tokens.
        #
        #   @param top_p [Float] Nucleus sampling: only tokens comprising the top_p probability mass

        # Reasoning effort. Requires the model's "reasoning" capability.
        #
        # @see Cadenya::Models::Agents::AgentVariationSpecModelConfig#reasoning_effort
        module ReasoningEffort
          extend Cadenya::Internal::Type::Enum

          REASONING_EFFORT_UNSPECIFIED = :REASONING_EFFORT_UNSPECIFIED
          REASONING_EFFORT_NONE = :REASONING_EFFORT_NONE
          REASONING_EFFORT_LOW = :REASONING_EFFORT_LOW
          REASONING_EFFORT_MEDIUM = :REASONING_EFFORT_MEDIUM
          REASONING_EFFORT_HIGH = :REASONING_EFFORT_HIGH

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    AgentVariationSpecModelConfig = Agents::AgentVariationSpecModelConfig
  end
end
