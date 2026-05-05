# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class CompactionConfigToolResultClearingStrategy < Cadenya::Internal::Type::BaseModel
        # @!attribute preserve_recent_results
        #   Number of most recent tool call results to keep intact. Older tool results have
        #   their content replaced with "[result cleared]" while preserving the assistant
        #   tool call message (function name, arguments). Default: 2
        #
        #   @return [Integer, nil]
        optional :preserve_recent_results, Integer, api_name: :preserveRecentResults

        # @!method initialize(preserve_recent_results: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::CompactionConfigToolResultClearingStrategy} for more
        #   details.
        #
        #   ToolResultClearingStrategy configures clearing of older tool result content.
        #
        #   @param preserve_recent_results [Integer] Number of most recent tool call results to keep intact.
      end
    end
  end
end
