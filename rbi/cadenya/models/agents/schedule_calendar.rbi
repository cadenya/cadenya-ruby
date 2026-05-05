# typed: strong

module Cadenya
  module Models
    module Agents
      class ScheduleCalendar < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::Agents::ScheduleCalendar, Cadenya::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :comment

        sig { params(comment: String).void }
        attr_writer :comment

        sig { returns(T.nilable(T::Array[Cadenya::Agents::ScheduleRange])) }
        attr_reader :day_of_month

        sig do
          params(
            day_of_month: T::Array[Cadenya::Agents::ScheduleRange::OrHash]
          ).void
        end
        attr_writer :day_of_month

        sig { returns(T.nilable(T::Array[Cadenya::Agents::ScheduleRange])) }
        attr_reader :day_of_week

        sig do
          params(
            day_of_week: T::Array[Cadenya::Agents::ScheduleRange::OrHash]
          ).void
        end
        attr_writer :day_of_week

        sig { returns(T.nilable(T::Array[Cadenya::Agents::ScheduleRange])) }
        attr_reader :hour

        sig do
          params(hour: T::Array[Cadenya::Agents::ScheduleRange::OrHash]).void
        end
        attr_writer :hour

        sig { returns(T.nilable(T::Array[Cadenya::Agents::ScheduleRange])) }
        attr_reader :minute

        sig do
          params(minute: T::Array[Cadenya::Agents::ScheduleRange::OrHash]).void
        end
        attr_writer :minute

        sig { returns(T.nilable(T::Array[Cadenya::Agents::ScheduleRange])) }
        attr_reader :month

        sig do
          params(month: T::Array[Cadenya::Agents::ScheduleRange::OrHash]).void
        end
        attr_writer :month

        sig { returns(T.nilable(T::Array[Cadenya::Agents::ScheduleRange])) }
        attr_reader :second

        sig do
          params(second: T::Array[Cadenya::Agents::ScheduleRange::OrHash]).void
        end
        attr_writer :second

        # Calendar is a wall-clock rule. Empty field-list semantics:
        #
        # - second/minute/hour: empty means [{start: 0}] (top of the unit)
        # - day_of_month/month/day_of_week: empty means "any value" Fire times = cartesian
        #   product across all fields.
        sig do
          params(
            comment: String,
            day_of_month: T::Array[Cadenya::Agents::ScheduleRange::OrHash],
            day_of_week: T::Array[Cadenya::Agents::ScheduleRange::OrHash],
            hour: T::Array[Cadenya::Agents::ScheduleRange::OrHash],
            minute: T::Array[Cadenya::Agents::ScheduleRange::OrHash],
            month: T::Array[Cadenya::Agents::ScheduleRange::OrHash],
            second: T::Array[Cadenya::Agents::ScheduleRange::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          comment: nil,
          day_of_month: nil,
          day_of_week: nil,
          hour: nil,
          minute: nil,
          month: nil,
          second: nil
        )
        end

        sig do
          override.returns(
            {
              comment: String,
              day_of_month: T::Array[Cadenya::Agents::ScheduleRange],
              day_of_week: T::Array[Cadenya::Agents::ScheduleRange],
              hour: T::Array[Cadenya::Agents::ScheduleRange],
              minute: T::Array[Cadenya::Agents::ScheduleRange],
              month: T::Array[Cadenya::Agents::ScheduleRange],
              second: T::Array[Cadenya::Agents::ScheduleRange]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
