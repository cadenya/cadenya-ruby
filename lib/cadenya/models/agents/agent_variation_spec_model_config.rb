# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentVariationSpecModelConfig < Cadenya::Internal::Type::BaseModel
        # @!attribute model_id
        #   The model identifier in family/model format (e.g., "claude/opus-4.6",
        #   "claude/sonnet-4.5")
        #
        #   @return [String, nil]
        optional :model_id, String, api_name: :modelId

        # @!attribute temperature
        #   Sampling temperature for model inference (0.0 to 1.0) Lower values produce more
        #   deterministic outputs, higher values increase randomness
        #
        #   @return [Float, nil]
        optional :temperature, Float

        # @!method initialize(model_id: nil, temperature: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentVariationSpecModelConfig} for more details.
        #
        #   ModelConfig defines the model configuration for a variation
        #
        #   @param model_id [String] The model identifier in family/model format (e.g., "claude/opus-4.6", "claude/so
        #
        #   @param temperature [Float] Sampling temperature for model inference (0.0 to 1.0)
      end
    end

    AgentVariationSpecModelConfig = Agents::AgentVariationSpecModelConfig
  end
end
