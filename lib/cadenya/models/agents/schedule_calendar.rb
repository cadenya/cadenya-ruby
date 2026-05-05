# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class ScheduleCalendar < Cadenya::Internal::Type::BaseModel
        # @!attribute comment
        #
        #   @return [String, nil]
        optional :comment, String

        # @!attribute day_of_month
        #
        #   @return [Array<Cadenya::Models::Agents::ScheduleRange>, nil]
        optional :day_of_month,
                 -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Agents::ScheduleRange] },
                 api_name: :dayOfMonth

        # @!attribute day_of_week
        #
        #   @return [Array<Cadenya::Models::Agents::ScheduleRange>, nil]
        optional :day_of_week,
                 -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Agents::ScheduleRange] },
                 api_name: :dayOfWeek

        # @!attribute hour
        #
        #   @return [Array<Cadenya::Models::Agents::ScheduleRange>, nil]
        optional :hour, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Agents::ScheduleRange] }

        # @!attribute minute
        #
        #   @return [Array<Cadenya::Models::Agents::ScheduleRange>, nil]
        optional :minute, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Agents::ScheduleRange] }

        # @!attribute month
        #
        #   @return [Array<Cadenya::Models::Agents::ScheduleRange>, nil]
        optional :month, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Agents::ScheduleRange] }

        # @!attribute second
        #
        #   @return [Array<Cadenya::Models::Agents::ScheduleRange>, nil]
        optional :second, -> { Cadenya::Internal::Type::ArrayOf[Cadenya::Agents::ScheduleRange] }

        # @!method initialize(comment: nil, day_of_month: nil, day_of_week: nil, hour: nil, minute: nil, month: nil, second: nil)
        #   Calendar is a wall-clock rule. Empty field-list semantics:
        #
        #   - second/minute/hour: empty means [{start: 0}] (top of the unit)
        #   - day_of_month/month/day_of_week: empty means "any value" Fire times = cartesian
        #     product across all fields.
        #
        #   @param comment [String]
        #   @param day_of_month [Array<Cadenya::Models::Agents::ScheduleRange>]
        #   @param day_of_week [Array<Cadenya::Models::Agents::ScheduleRange>]
        #   @param hour [Array<Cadenya::Models::Agents::ScheduleRange>]
        #   @param minute [Array<Cadenya::Models::Agents::ScheduleRange>]
        #   @param month [Array<Cadenya::Models::Agents::ScheduleRange>]
        #   @param second [Array<Cadenya::Models::Agents::ScheduleRange>]
      end
    end
  end
end
