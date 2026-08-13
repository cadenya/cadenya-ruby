# typed: strong

module Cadenya
  module Models
    class ModelSpec < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::ModelSpec, Cadenya::Internal::AnyHash) }

      # The model family (e.g., "claude-sonnet-4.6", "gpt-5.4", "gemini-2.5-flash")
      sig { returns(String) }
      attr_accessor :family

      # The model provider (e.g., "anthropic", "openai", "google")
      sig { returns(String) }
      attr_accessor :provider

      # The inference knobs this model supports. Catalog data; drives which ModelConfig
      # fields a variation on this model may set. Reasoning support (and its mode) lives
      # here too, as the "reasoning" capability.
      sig do
        returns(T.nilable(T::Array[Cadenya::ModelSpecCapability::Variants]))
      end
      attr_reader :capabilities

      sig do
        params(
          capabilities:
            T::Array[
              T.any(
                Cadenya::ModelSpecCapabilityTemperature::OrHash,
                Cadenya::ModelSpecCapabilityTopP::OrHash,
                Cadenya::ModelSpecCapabilityTopK::OrHash,
                Cadenya::ModelSpecCapabilityStopSequences::OrHash,
                Cadenya::ModelSpecCapabilityMaxOutputTokens::OrHash,
                Cadenya::ModelSpecCapabilityReasoning::OrHash
              )
            ]
        ).void
      end
      attr_writer :capabilities

      # Cost per million input tokens in cents (e.g., 300 = $3.00)
      sig { returns(String) }
      attr_accessor :input_price_per_million_tokens

      # Maximum number of input tokens the model supports
      sig { returns(Integer) }
      attr_accessor :max_input_tokens

      # Maximum number of output tokens the model can generate
      sig { returns(Integer) }
      attr_accessor :max_output_tokens

      # Cost per million output tokens in cents (e.g., 1500 = $15.00)
      sig { returns(String) }
      attr_accessor :output_price_per_million_tokens

      sig do
        params(
          family: String,
          provider: String,
          capabilities:
            T::Array[
              T.any(
                Cadenya::ModelSpecCapabilityTemperature::OrHash,
                Cadenya::ModelSpecCapabilityTopP::OrHash,
                Cadenya::ModelSpecCapabilityTopK::OrHash,
                Cadenya::ModelSpecCapabilityStopSequences::OrHash,
                Cadenya::ModelSpecCapabilityMaxOutputTokens::OrHash,
                Cadenya::ModelSpecCapabilityReasoning::OrHash
              )
            ],
          input_price_per_million_tokens: String,
          max_input_tokens: Integer,
          max_output_tokens: Integer,
          output_price_per_million_tokens: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The model family (e.g., "claude-sonnet-4.6", "gpt-5.4", "gemini-2.5-flash")
        family:,
        # The model provider (e.g., "anthropic", "openai", "google")
        provider:,
        # The inference knobs this model supports. Catalog data; drives which ModelConfig
        # fields a variation on this model may set. Reasoning support (and its mode) lives
        # here too, as the "reasoning" capability.
        capabilities:,
        # Cost per million input tokens in cents (e.g., 300 = $3.00)
        input_price_per_million_tokens:,
        # Maximum number of input tokens the model supports
        max_input_tokens:,
        # Maximum number of output tokens the model can generate
        max_output_tokens:,
        # Cost per million output tokens in cents (e.g., 1500 = $15.00)
        output_price_per_million_tokens:
      )
      end

      sig do
        override.returns(
          {
            family: String,
            provider: String,
            capabilities: T::Array[Cadenya::ModelSpecCapability::Variants],
            input_price_per_million_tokens: String,
            max_input_tokens: Integer,
            max_output_tokens: Integer,
            output_price_per_million_tokens: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
