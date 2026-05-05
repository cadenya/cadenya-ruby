# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveStatus < Cadenya::Internal::Type::BaseModel
      # @!attribute state
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveStatus::State]
      required :state, enum: -> { Cadenya::ObjectiveStatus::State }

      # @!attribute message
      #
      #   @return [String, nil]
      optional :message, String

      # @!method initialize(state:, message: nil)
      #   @param state [Symbol, Cadenya::Models::ObjectiveStatus::State]
      #   @param message [String]

      # @see Cadenya::Models::ObjectiveStatus#state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_PENDING = :STATE_PENDING
        STATE_RUNNING = :STATE_RUNNING
        STATE_COMPLETED = :STATE_COMPLETED
        STATE_FAILED = :STATE_FAILED
        STATE_CANCELLED = :STATE_CANCELLED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
