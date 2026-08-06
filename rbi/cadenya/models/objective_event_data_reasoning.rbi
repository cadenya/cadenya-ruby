# typed: strong

module Cadenya
  module Models
    class ObjectiveEventDataReasoning < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::ObjectiveEventDataReasoning,
            Cadenya::Internal::AnyHash
          )
        end

      # Reasoning carries the human-readable reasoning text a model produced while
      # working on an iteration — extended thinking (Anthropic, Gemini) or reasoning
      # summaries (OpenAI). It is emitted alongside the assistant message from the same
      # model response and is purely informational: the text shown here is never sent
      # back to the model.
      sig { returns(Cadenya::Reasoning) }
      attr_reader :reasoning

      sig { params(reasoning: Cadenya::Reasoning::OrHash).void }
      attr_writer :reasoning

      sig { returns(Cadenya::ObjectiveEventDataReasoning::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(
          reasoning: Cadenya::Reasoning::OrHash,
          type: Cadenya::ObjectiveEventDataReasoning::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Reasoning carries the human-readable reasoning text a model produced while
        # working on an iteration — extended thinking (Anthropic, Gemini) or reasoning
        # summaries (OpenAI). It is emitted alongside the assistant message from the same
        # model response and is purely informational: the text shown here is never sent
        # back to the model.
        reasoning:,
        type:
      )
      end

      sig do
        override.returns(
          {
            reasoning: Cadenya::Reasoning,
            type: Cadenya::ObjectiveEventDataReasoning::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      module Type
        extend Cadenya::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Cadenya::ObjectiveEventDataReasoning::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REASONING =
          T.let(
            :reasoning,
            Cadenya::ObjectiveEventDataReasoning::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Cadenya::ObjectiveEventDataReasoning::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
