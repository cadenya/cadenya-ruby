# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class CompactionConfigSummarizationStrategy < Cadenya::Internal::Type::BaseModel
        # @!attribute instructions
        #   Custom instructions that guide what the summarizer preserves. Replaces the
        #   default summarization prompt entirely. Example: "Preserve all code snippets,
        #   variable names, and technical decisions."
        #
        #   @return [String, nil]
        optional :instructions, String

        # @!method initialize(instructions: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::CompactionConfigSummarizationStrategy} for more
        #   details.
        #
        #   SummarizationStrategy configures LLM-powered summarization of older conversation
        #   turns.
        #
        #   @param instructions [String] Custom instructions that guide what the summarizer preserves.
      end
    end
  end
end
