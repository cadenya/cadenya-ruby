# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class ScheduleRange < Cadenya::Internal::Type::BaseModel
        # @!attribute end_
        #
        #   @return [Integer, nil]
        optional :end_, Integer, api_name: :end

        # @!attribute start
        #
        #   @return [Integer, nil]
        optional :start, Integer

        # @!attribute step
        #
        #   @return [Integer, nil]
        optional :step, Integer

        # @!method initialize(end_: nil, start: nil, step: nil)
        #   Inclusive numeric range with optional step. {start: 9} → 9 {start: 9, end: 17} →
        #   9..17 {start: 0, end: 59, step: 15} → 0,15,30,45 `end` defaults to `start`;
        #   `step` defaults to 1.
        #
        #   @param end_ [Integer]
        #   @param start [Integer]
        #   @param step [Integer]
      end
    end
  end
end
