# frozen_string_literal: true

module Cadenya
  module Models
    class Reasoning < Cadenya::Internal::Type::BaseModel
      # @!attribute content
      #   The reasoning text. May be a verbatim chain of thought or a provider-generated
      #   summary depending on the model.
      #
      #   @return [String]
      required :content, String

      # @!method initialize(content:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::Reasoning} for more details.
      #
      #   Reasoning carries the human-readable reasoning text a model produced while
      #   working on an iteration — extended thinking (Anthropic, Gemini) or reasoning
      #   summaries (OpenAI). It is emitted alongside the assistant message from the same
      #   model response and is purely informational: the text shown here is never sent
      #   back to the model.
      #
      #   @param content [String] The reasoning text. May be a verbatim chain of thought or a
    end
  end
end
