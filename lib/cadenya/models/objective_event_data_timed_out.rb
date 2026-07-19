# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveEventDataTimedOut < Cadenya::Internal::Type::BaseModel
      # @!attribute timed_out
      #   ObjectiveTimedOut is the terminal event written when an objective is finalized
      #   by the inactivity sweep because it saw no activity (no user messages, no LLM
      #   calls) within its variation's inactivity timeout — or the system-wide 24 hour
      #   maximum when no timeout is configured. The objective produces no output. After
      #   this event, the objective is super-terminal: no further iterations, compaction,
      #   or continuation are permitted.
      #
      #   @return [Cadenya::Models::ObjectiveEventDataTimedOut::TimedOut]
      required :timed_out, -> { Cadenya::ObjectiveEventDataTimedOut::TimedOut }, api_name: :timedOut

      # @!attribute type
      #
      #   @return [Symbol, Cadenya::Models::ObjectiveEventDataTimedOut::Type]
      required :type, enum: -> { Cadenya::ObjectiveEventDataTimedOut::Type }

      # @!method initialize(timed_out:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveEventDataTimedOut} for more details.
      #
      #   @param timed_out [Cadenya::Models::ObjectiveEventDataTimedOut::TimedOut] ObjectiveTimedOut is the terminal event written when an objective is
      #
      #   @param type [Symbol, Cadenya::Models::ObjectiveEventDataTimedOut::Type]

      # @see Cadenya::Models::ObjectiveEventDataTimedOut#timed_out
      class TimedOut < Cadenya::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable note recorded at timeout time (e.g. "Timed out after 2h of
        #   inactivity").
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(message: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::ObjectiveEventDataTimedOut::TimedOut} for more details.
        #
        #   ObjectiveTimedOut is the terminal event written when an objective is finalized
        #   by the inactivity sweep because it saw no activity (no user messages, no LLM
        #   calls) within its variation's inactivity timeout — or the system-wide 24 hour
        #   maximum when no timeout is configured. The objective produces no output. After
        #   this event, the objective is super-terminal: no further iterations, compaction,
        #   or continuation are permitted.
        #
        #   @param message [String] Human-readable note recorded at timeout time (e.g. "Timed out after 2h
      end

      # @see Cadenya::Models::ObjectiveEventDataTimedOut#type
      module Type
        extend Cadenya::Internal::Type::Enum

        TIMED_OUT = :timedOut

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
