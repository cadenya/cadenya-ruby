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
        sig { returns(T.nilable(String)) }
        attr_reader :model_id

        sig { params(model_id: String).void }
        attr_writer :model_id

        # Sampling temperature for model inference (0.0 to 1.0) Lower values produce more
        # deterministic outputs, higher values increase randomness
        sig { returns(T.nilable(Float)) }
        attr_reader :temperature

        sig { params(temperature: Float).void }
        attr_writer :temperature

        # ModelConfig defines the model configuration for a variation
        sig do
          params(model_id: String, temperature: Float).returns(T.attached_class)
        end
        def self.new(
          # The model identifier in family/model format (e.g., "claude/opus-4.6",
          # "claude/sonnet-4.5")
          model_id: nil,
          # Sampling temperature for model inference (0.0 to 1.0) Lower values produce more
          # deterministic outputs, higher values increase randomness
          temperature: nil
        )
        end

        sig { override.returns({ model_id: String, temperature: Float }) }
        def to_hash
        end
      end
    end
  end
end
