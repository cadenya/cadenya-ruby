# typed: strong

module Cadenya
  module Models
    class ObjectiveRetrieveDiagnosticsResponse < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::Models::ObjectiveRetrieveDiagnosticsResponse,
            Cadenya::Internal::AnyHash
          )
        end

      # ObjectiveDiagnostics is the context-usage breakdown measured for a single
      # iteration at request-assembly time. It reports how much of the context window
      # each component occupies so tool parameters, memory cascades, and prompts can be
      # tuned against real token usage.
      sig { returns(Cadenya::ObjectiveDiagnostics) }
      attr_reader :diagnostics

      sig { params(diagnostics: Cadenya::ObjectiveDiagnostics::OrHash).void }
      attr_writer :diagnostics

      sig do
        params(diagnostics: Cadenya::ObjectiveDiagnostics::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(
        # ObjectiveDiagnostics is the context-usage breakdown measured for a single
        # iteration at request-assembly time. It reports how much of the context window
        # each component occupies so tool parameters, memory cascades, and prompts can be
        # tuned against real token usage.
        diagnostics:
      )
      end

      sig { override.returns({ diagnostics: Cadenya::ObjectiveDiagnostics }) }
      def to_hash
      end
    end
  end
end
