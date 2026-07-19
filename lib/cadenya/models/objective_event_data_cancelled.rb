# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataCancelled < Cadenya::Internal::Type::BaseModel
      # @!attribute cancelled
      #   ObjectiveCancelled is the terminal event written when an objective is cancelled.
      #   After this event, the objective is super-terminal: no further iterations,
      #   compaction, or continuation are permitted.
      #
      #   @return [Cadenya::Models::ObjectiveEventDataCancelled::Cancelled]
      required :cancelled, -> { Cadenya::ObjectiveEventDataCancelled::Cancelled }

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataCancelled::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataCancelled::Type }

      # @!method initialize(cancelled:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveEventDataCancelled} for more details.
      #
      #   @param cancelled [Cadenya::Models::ObjectiveEventDataCancelled::Cancelled] ObjectiveCancelled is the terminal event written when an objective is
      #
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataCancelled::Type]

      # @see Cadenya::Models::ObjectiveEventDataCancelled#cancelled
      class Cancelled < Cadenya::Internal::Type::BaseModel
        # @!attribute message
        #   Optional human-readable note recorded at cancel time. Today the workflow sets
        #   "Cancelled" but this field leaves room for richer reasons (e.g. "Cancelled by
        #   user", "Cancelled by schedule sweep", "Credit balance exhausted").
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(message: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ObjectiveEventDataCancelled::Cancelled} for more details.
        #
        #   ObjectiveCancelled is the terminal event written when an objective is cancelled.
        #   After this event, the objective is super-terminal: no further iterations,
        #   compaction, or continuation are permitted.
        #
        #   @param message [String] Optional human-readable note recorded at cancel time. Today the workflow
      end

      # @see Cadenya::Models::ObjectiveEventDataCancelled#type
      module Type
        extend Cadenya::Internal::Type::Enum

        CANCELLED = :cancelled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
