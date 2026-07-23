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

      # Cost per million input tokens in cents (e.g., 300 = $3.00)
      sig { returns(T.nilable(String)) }
      attr_reader :input_price_per_million_tokens

      sig { params(input_price_per_million_tokens: String).void }
      attr_writer :input_price_per_million_tokens

      # Maximum number of input tokens the model supports
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_input_tokens

      sig { params(max_input_tokens: Integer).void }
      attr_writer :max_input_tokens

      # Maximum number of output tokens the model can generate
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_output_tokens

      sig { params(max_output_tokens: Integer).void }
      attr_writer :max_output_tokens

      # Cost per million output tokens in cents (e.g., 1500 = $15.00)
      sig { returns(T.nilable(String)) }
      attr_reader :output_price_per_million_tokens

      sig { params(output_price_per_million_tokens: String).void }
      attr_writer :output_price_per_million_tokens

      sig do
        params(
          family: String,
          provider: String,
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
        # Cost per million input tokens in cents (e.g., 300 = $3.00)
        input_price_per_million_tokens: nil,
        # Maximum number of input tokens the model supports
        max_input_tokens: nil,
        # Maximum number of output tokens the model can generate
        max_output_tokens: nil,
        # Cost per million output tokens in cents (e.g., 1500 = $15.00)
        output_price_per_million_tokens: nil
      )
      end

      sig do
        override.returns(
          {
            family: String,
            provider: String,
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
