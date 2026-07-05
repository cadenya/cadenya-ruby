# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveDiagnostics < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute cached_input_tokens
        #   The portion of input_tokens served from the provider's prompt cache. Lets
        #   clients distinguish "big but cached" from "big and paid fresh every iteration".
        #
        #   @return [Integer]
        required :cached_input_tokens, Integer, api_name: :cachedInputTokens

        # @!attribute context_lengths
        #   ContextLengths is the measured character length of each distinct component of an
        #   iteration's assembled context window. Values are raw character lengths of the
        #   component as assembled into the request — token estimates are derived by the
        #   client against input_tokens (component share = component length / sum of all
        #   lengths).
        #
        #   New components are added as new fields — wire-compatible; absent components read
        #   as 0.
        #
        #   @return [Cadenya::Models::ContextLengths]
        required :context_lengths, -> { Cadenya::ContextLengths }, api_name: :contextLengths

        # @!attribute input_tokens
        #   Input tokens reported by the LLM provider for the iteration's completion.
        #
        #   @return [Integer]
        required :input_tokens, Integer, api_name: :inputTokens
      end

      # @!method initialize(cached_input_tokens:, context_lengths:, input_tokens:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveDiagnostics} for more details.
      #
      #   ObjectiveDiagnostics is the context-usage breakdown measured for a single
      #   iteration at request-assembly time. It reports how much of the context window
      #   each component occupies so tool parameters, memory cascades, and prompts can be
      #   tuned against real token usage.
      #
      #   @param cached_input_tokens [Integer] The portion of input_tokens served from the provider's prompt cache.
      #
      #   @param context_lengths [Cadenya::Models::ContextLengths] ContextLengths is the measured character length of each distinct component
      #
      #   @param input_tokens [Integer] Input tokens reported by the LLM provider for the iteration's completion.
    end
  end
end
