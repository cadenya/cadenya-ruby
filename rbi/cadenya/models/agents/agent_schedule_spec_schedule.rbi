# typed: strong

module Cadenya
  module Models
    AgentScheduleSpecSchedule = Agents::AgentScheduleSpecSchedule

    module Agents
      class AgentScheduleSpecSchedule < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::AgentScheduleSpecSchedule,
              Cadenya::Internal::AnyHash
            )
          end

        # Wall-clock rules. May be empty if `intervals` is non-empty.
        sig { returns(T.nilable(T::Array[Cadenya::Agents::ScheduleCalendar])) }
        attr_reader :calendars

        sig do
          params(
            calendars: T::Array[Cadenya::Agents::ScheduleCalendar::OrHash]
          ).void
        end
        attr_writer :calendars

        # Duration-based rules. May be empty if `calendars` is non-empty.
        sig { returns(T.nilable(T::Array[Cadenya::Agents::ScheduleInterval])) }
        attr_reader :intervals

        sig do
          params(
            intervals: T::Array[Cadenya::Agents::ScheduleInterval::OrHash]
          ).void
        end
        attr_writer :intervals

        # IANA tz name (e.g. "America/New_York"). Required. Applies to calendars;
        # intervals fire on wall-clock cadence anchored in this zone.
        sig { returns(T.nilable(String)) }
        attr_reader :timezone

        sig { params(timezone: String).void }
        attr_writer :timezone

        # Schedule defines WHEN the schedule fires. Temporal-style structured form: a list
        # of calendar rules (wall-clock) and/or interval rules (duration), OR'd together.
        # At least one rule is required.
        sig do
          params(
            calendars: T::Array[Cadenya::Agents::ScheduleCalendar::OrHash],
            intervals: T::Array[Cadenya::Agents::ScheduleInterval::OrHash],
            timezone: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Wall-clock rules. May be empty if `intervals` is non-empty.
          calendars: nil,
          # Duration-based rules. May be empty if `calendars` is non-empty.
          intervals: nil,
          # IANA tz name (e.g. "America/New_York"). Required. Applies to calendars;
          # intervals fire on wall-clock cadence anchored in this zone.
          timezone: nil
        )
        end

        sig do
          override.returns(
            {
              calendars: T::Array[Cadenya::Agents::ScheduleCalendar],
              intervals: T::Array[Cadenya::Agents::ScheduleInterval],
              timezone: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
