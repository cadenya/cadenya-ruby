# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Objectives#compact
    class ObjectiveCompactResponse < Cadenya::Internal::Type::BaseModel
      # @!attribute context_window
      #   The new context window created by the compaction
      #
      #   @return [Cadenya::Models::ObjectiveContextWindowData, nil]
      optional :context_window, -> { Cadenya::ObjectiveContextWindowData }, api_name: :contextWindow

      # @!method initialize(context_window: nil)
      #   Compact objective response
      #
      #   @param context_window [Cadenya::Models::ObjectiveContextWindowData] The new context window created by the compaction
    end
  end
end
