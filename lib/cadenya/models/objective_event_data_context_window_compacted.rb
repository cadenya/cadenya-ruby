# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataContextWindowCompacted < Cadenya::Internal::Type::BaseModel
      # @!attribute context_window_compacted
      #
      #   @return [Cadenya::Models::ContextWindowCompacted]
      required :context_window_compacted,
               -> { Cadenya::ContextWindowCompacted },
               api_name: :contextWindowCompacted

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataContextWindowCompacted::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataContextWindowCompacted::Type }

      # @!method initialize(context_window_compacted:, type:)
      #   @param context_window_compacted [Cadenya::Models::ContextWindowCompacted]
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataContextWindowCompacted::Type]

      # @see Cadenya::Models::ObjectiveEventDataContextWindowCompacted#type
      module Type
        extend Cadenya::Internal::Type::Enum

        CONTEXT_WINDOW_COMPACTED = :contextWindowCompacted

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
