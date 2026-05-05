# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentScheduleSpecSchedule < Cadenya::Internal::Type::BaseModel
        # @!attribute calendars
        #   Wall-clock rules. May be empty if `intervals` is non-empty.
        #
        #   @return [Array<Cadenya::Models::Agents::ScheduleCalendar>, nil]
        optional :calendars, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Agents::ScheduleCalendar] }

        # @!attribute intervals
        #   Duration-based rules. May be empty if `calendars` is non-empty.
        #
        #   @return [Array<Cadenya::Models::Agents::ScheduleInterval>, nil]
        optional :intervals, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Agents::ScheduleInterval] }

        # @!attribute timezone
        #   IANA tz name (e.g. "America/New_York"). Required. Applies to calendars;
        #   intervals fire on wall-clock cadence anchored in this zone.
        #
        #   @return [String, nil]
        optional :timezone, String

        # @!method initialize(calendars: nil, intervals: nil, timezone: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentScheduleSpecSchedule} for more details.
        #
        #   Schedule defines WHEN the schedule fires. Temporal-style structured form: a list
        #   of calendar rules (wall-clock) and/or interval rules (duration), OR'd together.
        #   At least one rule is required.
        #
        #   @param calendars [Array<Cadenya::Models::Agents::ScheduleCalendar>] Wall-clock rules. May be empty if `intervals` is non-empty.
        #
        #   @param intervals [Array<Cadenya::Models::Agents::ScheduleInterval>] Duration-based rules. May be empty if `calendars` is non-empty.
        #
        #   @param timezone [String] IANA tz name (e.g. "America/New_York"). Required. Applies to calendars;
      end
    end

    AgentScheduleSpecSchedule = Agents::AgentScheduleSpecSchedule
  end
end
