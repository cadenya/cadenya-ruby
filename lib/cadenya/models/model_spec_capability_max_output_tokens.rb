# frozen_string_literal: true

module Cadenya
  module Models
    class ModelSpecCapabilityMaxOutputTokens < Cadenya::Internal::Type::BaseModel
      # @!attribute max_output_tokens
      #   Per-request output token cap (ModelConfig.max_output_tokens). The effective
      #   ceiling is ModelSpec.max_output_tokens.
      #
      #   @return [Object]
      required :max_output_tokens, Cadenya::Internal::Type::Unknown, api_name: :maxOutputTokens

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ModelSpecCapabilityMaxOutputTokens::Type]
      required :type, enum: -> { Cadenya::ModelSpecCapabilityMaxOutputTokens::Type }

      # @!method initialize(max_output_tokens:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ModelSpecCapabilityMaxOutputTokens} for more details.
      #
      #   @param max_output_tokens [Object] Per-request output token cap (ModelConfig.max_output_tokens).
      #
      #   @param type [Symbol, Cadenya::Models::ModelSpecCapabilityMaxOutputTokens::Type]

      # @see Cadenya::Models::ModelSpecCapabilityMaxOutputTokens#type
      module Type
        extend Cadenya::Internal::Type::Enum

        MAX_OUTPUT_TOKENS = :maxOutputTokens

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
