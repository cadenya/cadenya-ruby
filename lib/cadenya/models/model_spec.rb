# frozen_string_literal: true

module Cadenya
  module Models
    class ModelSpec < Cadenya::Internal::Type::BaseModel
      # @!attribute family
      #   The model family (e.g., "claude-sonnet-4.6", "gpt-5.4", "gemini-2.5-flash")
      #
      #   @return [String, nil]
      optional :family, String

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

      # @!attribute provider
      #   The model provider (e.g., "anthropic", "openai", "google")
      #
      #   @return [String, nil]
      optional :provider, String

      # @!attribute status
      #   The status of the model in the workspace
      #
      #   @return [Symbol, Cadenya::Models::ModelSpec::Status, nil]
      optional :status, enum: -> { Cadenya::ModelSpec::Status }

      # @!method initialize(family: nil, input_price_per_million_tokens: nil, max_input_tokens: nil, max_output_tokens: nil, output_price_per_million_tokens: nil, provider: nil, status: nil)
      #   @param family [String] The model family (e.g., "claude-sonnet-4.6", "gpt-5.4", "gemini-2.5-flash")
      #
      #   @param input_price_per_million_tokens [String] Cost per million input tokens in cents (e.g., 300 = $3.00)
      #
      #   @param max_input_tokens [Integer] Maximum number of input tokens the model supports
      #
      #   @param max_output_tokens [Integer] Maximum number of output tokens the model can generate
      #
      #   @param output_price_per_million_tokens [String] Cost per million output tokens in cents (e.g., 1500 = $15.00)
      #
      #   @param provider [String] The model provider (e.g., "anthropic", "openai", "google")
      #
      #   @param status [Symbol, Cadenya::Models::ModelSpec::Status] The status of the model in the workspace

      # The status of the model in the workspace
      #
      # @see Cadenya::Models::ModelSpec#status
      module Status
        extend Cadenya::Internal::Type::Enum

        MODEL_STATUS_UNSPECIFIED = :MODEL_STATUS_UNSPECIFIED
        MODEL_STATUS_ENABLED = :MODEL_STATUS_ENABLED
        MODEL_STATUS_DISABLED = :MODEL_STATUS_DISABLED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
