# typed: strong

module Cadenya
  module Models
    module Agents
      class CompactionConfigSummarizationStrategy < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::CompactionConfigSummarizationStrategy,
              Cadenya::Internal::AnyHash
            )
          end

        # Custom instructions that guide what the summarizer preserves. Replaces the
        # default summarization prompt entirely. Example: "Preserve all code snippets,
        # variable names, and technical decisions."
        sig { returns(T.nilable(String)) }
        attr_reader :instructions

        sig { params(instructions: String).void }
        attr_writer :instructions

        # SummarizationStrategy configures LLM-powered summarization of older conversation
        # turns.
        sig { params(instructions: String).returns(T.attached_class) }
        def self.new(
          # Custom instructions that guide what the summarizer preserves. Replaces the
          # default summarization prompt entirely. Example: "Preserve all code snippets,
          # variable names, and technical decisions."
          instructions: nil
        )
        end

        sig { override.returns({ instructions: String }) }
        def to_hash
        end
      end
    end
  end
end
