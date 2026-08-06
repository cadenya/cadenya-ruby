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

      # @!attribute input_price_per_million_tokens
      #   Cost per million input tokens in cents (e.g., 300 = $3.00)
      #
      #   @return [String, nil]
      optional :input_price_per_million_tokens, String, api_name: :inputPricePerMillionTokens

      # @!attribute max_input_tokens
      #   Maximum number of input tokens the model supports
      #
      #   @return [Integer, nil]
      optional :max_input_tokens, Integer, api_name: :maxInputTokens

      # @!attribute max_output_tokens
      #   Maximum number of output tokens the model can generate
      #
      #   @return [Integer, nil]
      optional :max_output_tokens, Integer, api_name: :maxOutputTokens

      # @!attribute output_price_per_million_tokens
      #   Cost per million output tokens in cents (e.g., 1500 = $15.00)
      #
      #   @return [String, nil]
      optional :output_price_per_million_tokens, String, api_name: :outputPricePerMillionTokens

      # @!attribute reasoning
      #   The model's reasoning capability. Catalog data used to decide whether thinking
      #   is requested for objective iterations on this model.
      #
      #   @return [Symbol, Cadenya::Models::ModelSpec::Reasoning, nil]
      optional :reasoning, enum: -> { Cadenya::ModelSpec::Reasoning }

      # @!method initialize(family:, provider:, input_price_per_million_tokens: nil, max_input_tokens: nil, max_output_tokens: nil, output_price_per_million_tokens: nil, reasoning: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ModelSpec} for more details.
      #
      #   @param family [String] The model family (e.g., "claude-sonnet-4.6", "gpt-5.4", "gemini-2.5-flash")
      #
      #   @param provider [String] The model provider (e.g., "anthropic", "openai", "google")
      #
      #   @param input_price_per_million_tokens [String] Cost per million input tokens in cents (e.g., 300 = $3.00)
      #
      #   @param max_input_tokens [Integer] Maximum number of input tokens the model supports
      #
      #   @param max_output_tokens [Integer] Maximum number of output tokens the model can generate
      #
      #   @param output_price_per_million_tokens [String] Cost per million output tokens in cents (e.g., 1500 = $15.00)
      #
      #   @param reasoning [Symbol, Cadenya::Models::ModelSpec::Reasoning] The model's reasoning capability. Catalog data used to decide whether

      # The model's reasoning capability. Catalog data used to decide whether thinking
      # is requested for objective iterations on this model.
      #
      # @see Cadenya::Models::ModelSpec#reasoning
      module Reasoning
        extend Cadenya::Internal::Type::Enum

        REASONING_UNSPECIFIED = :REASONING_UNSPECIFIED
        REASONING_NONE = :REASONING_NONE
        REASONING_ADAPTIVE = :REASONING_ADAPTIVE
        REASONING_BUDGET = :REASONING_BUDGET

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
