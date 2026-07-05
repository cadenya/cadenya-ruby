# typed: strong

module Cadenya
  module Models
    class ObjectiveDiagnostics < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveDiagnostics, Cadenya::Internal::AnyHash)
        end

      # The portion of input_tokens served from the provider's prompt cache. Lets
      # clients distinguish "big but cached" from "big and paid fresh every iteration".
      sig { returns(Integer) }
      attr_accessor :cached_input_tokens

      # ContextLengths is the measured character length of each distinct component of an
      # iteration's assembled context window. Values are raw character lengths of the
      # component as assembled into the request — token estimates are derived by the
      # client against input_tokens (component share = component length / sum of all
      # lengths).
      #
      # New components are added as new fields — wire-compatible; absent components read
      # as 0.
      sig { returns(Cadenya::ContextLengths) }
      attr_reader :context_lengths

      sig { params(context_lengths: Cadenya::ContextLengths::OrHash).void }
      attr_writer :context_lengths

      # Input tokens reported by the LLM provider for the iteration's completion.
      sig { returns(Integer) }
      attr_accessor :input_tokens

      # ObjectiveDiagnostics is the context-usage breakdown measured for a single
      # iteration at request-assembly time. It reports how much of the context window
      # each component occupies so tool parameters, memory cascades, and prompts can be
      # tuned against real token usage.
      sig do
        params(
          cached_input_tokens: Integer,
          context_lengths: Cadenya::ContextLengths::OrHash,
          input_tokens: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # The portion of input_tokens served from the provider's prompt cache. Lets
        # clients distinguish "big but cached" from "big and paid fresh every iteration".
        cached_input_tokens:,
        # ContextLengths is the measured character length of each distinct component of an
        # iteration's assembled context window. Values are raw character lengths of the
        # component as assembled into the request — token estimates are derived by the
        # client against input_tokens (component share = component length / sum of all
        # lengths).
        #
        # New components are added as new fields — wire-compatible; absent components read
        # as 0.
        context_lengths:,
        # Input tokens reported by the LLM provider for the iteration's completion.
        input_tokens:
      )
      end

      sig do
        override.returns(
          {
            cached_input_tokens: Integer,
            context_lengths: Cadenya::ContextLengths,
            input_tokens: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
