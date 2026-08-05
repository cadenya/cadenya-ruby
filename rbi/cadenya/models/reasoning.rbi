# typed: strong

module Cadenya
  module Models
    class Reasoning < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::Reasoning, Cadenya::Internal::AnyHash) }

      # The reasoning text. May be a verbatim chain of thought or a provider-generated
      # summary depending on the model.
      sig { returns(String) }
      attr_accessor :content

      # Reasoning carries the human-readable reasoning text a model produced while
      # working on an iteration — extended thinking (Anthropic, Gemini) or reasoning
      # summaries (OpenAI). It is emitted alongside the assistant message from the same
      # model response and is purely informational: the text shown here is never sent
      # back to the model.
      sig { params(content: String).returns(T.attached_class) }
      def self.new(
        # The reasoning text. May be a verbatim chain of thought or a provider-generated
        # summary depending on the model.
        content:
      )
      end

      sig { override.returns({ content: String }) }
      def to_hash
      end
    end
  end
end
