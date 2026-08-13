# frozen_string_literal: true

module Cadenya
  module Models
    class ModelSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute family
      #   The model family (e.g., "claude-sonnet-4.6", "gpt-5.4", "gemini-2.5-flash")
      #
      #   @return [String]
      required :family, String

      # @!attribute provider
      #   The model provider (e.g., "anthropic", "openai", "google")
      #
      #   @return [String]
      required :provider, String

      # @!attribute capabilities
      #   The inference knobs this model supports. Catalog data; drives which ModelConfig
      #   fields a variation on this model may set. Reasoning support (and its mode) lives
      #   here too, as the "reasoning" capability.
      #
      #   @return [Array<Cadenya::Models::ModelSpecCapabilityTemperature, Cadenya::Models::ModelSpecCapabilityTopP, Cadenya::Models::ModelSpecCapabilityTopK, Cadenya::Models::ModelSpecCapabilityStopSequences, Cadenya::Models::ModelSpecCapabilityMaxOutputTokens, Cadenya::Models::ModelSpecCapabilityReasoning>]
      required :capabilities, -> { Cadenya::Internal::Type::ArrayOf[union: Cadenya::ModelSpecCapability] }

      # @!attribute input_price_per_million_tokens
      #   Cost per million input tokens in cents (e.g., 300 = $3.00)
      #
      #   @return [String]
      required :input_price_per_million_tokens, String, api_name: :inputPricePerMillionTokens

      # @!attribute max_input_tokens
      #   Maximum number of input tokens the model supports
      #
      #   @return [Integer]
      required :max_input_tokens, Integer, api_name: :maxInputTokens

      # @!attribute max_output_tokens
      #   Maximum number of output tokens the model can generate
      #
      #   @return [Integer]
      required :max_output_tokens, Integer, api_name: :maxOutputTokens

      # @!attribute output_price_per_million_tokens
      #   Cost per million output tokens in cents (e.g., 1500 = $15.00)
      #
      #   @return [String]
      required :output_price_per_million_tokens, String, api_name: :outputPricePerMillionTokens

      # @!method initialize(family:, provider:, capabilities:, input_price_per_million_tokens:, max_input_tokens:, max_output_tokens:, output_price_per_million_tokens:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ModelSpec} for more details.
      #
      #   @param family [String] The model family (e.g., "claude-sonnet-4.6", "gpt-5.4", "gemini-2.5-flash")
      #
      #   @param provider [String] The model provider (e.g., "anthropic", "openai", "google")
      #
      #   @param capabilities [Array<Cadenya::Models::ModelSpecCapabilityTemperature, Cadenya::Models::ModelSpecCapabilityTopP, Cadenya::Models::ModelSpecCapabilityTopK, Cadenya::Models::ModelSpecCapabilityStopSequences, Cadenya::Models::ModelSpecCapabilityMaxOutputTokens, Cadenya::Models::ModelSpecCapabilityReasoning>] The inference knobs this model supports. Catalog data; drives which
      #
      #   @param input_price_per_million_tokens [String] Cost per million input tokens in cents (e.g., 300 = $3.00)
      #
      #   @param max_input_tokens [Integer] Maximum number of input tokens the model supports
      #
      #   @param max_output_tokens [Integer] Maximum number of output tokens the model can generate
      #
      #   @param output_price_per_million_tokens [String] Cost per million output tokens in cents (e.g., 1500 = $15.00)
    end
  end
end
