# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#retrieve_diagnostics
    class ObjectiveRetrieveDiagnosticsResponse < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute diagnostics
        #   ObjectiveDiagnostics is the context-usage breakdown measured for a single
        #   iteration at request-assembly time. It reports how much of the context window
        #   each component occupies so tool parameters, memory cascades, and prompts can be
        #   tuned against real token usage.
        #
        #   @return [Cadenya::Models::ObjectiveDiagnostics]
        required :diagnostics, -> { Cadenya::ObjectiveDiagnostics }
      end

      # @!method initialize(diagnostics:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveRetrieveDiagnosticsResponse} for more details.
      #
      #   @param diagnostics [Cadenya::Models::ObjectiveDiagnostics] ObjectiveDiagnostics is the context-usage breakdown measured for a single
    end
  end
end
