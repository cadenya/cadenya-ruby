# typed: strong

module Cadenya
  module Models
    module Agents
      class CompactionConfigToolResultClearingStrategy < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::CompactionConfigToolResultClearingStrategy,
              Cadenya::Internal::AnyHash
            )
          end

        # Number of most recent tool call results to keep intact. Older tool results have
        # their content replaced with "[result cleared]" while preserving the assistant
        # tool call message (function name, arguments). Default: 2
        sig { returns(T.nilable(Integer)) }
        attr_reader :preserve_recent_results

        sig { params(preserve_recent_results: Integer).void }
        attr_writer :preserve_recent_results

        # ToolResultClearingStrategy configures clearing of older tool result content.
        sig do
          params(preserve_recent_results: Integer).returns(T.attached_class)
        end
        def self.new(
          # Number of most recent tool call results to keep intact. Older tool results have
          # their content replaced with "[result cleared]" while preserving the assistant
          # tool call message (function name, arguments). Default: 2
          preserve_recent_results: nil
        )
        end

        sig { override.returns({ preserve_recent_results: Integer }) }
        def to_hash
        end
      end
    end
  end
end
