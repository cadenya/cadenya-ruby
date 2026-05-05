# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class ScheduleInterval < Cadenya::Internal::Type::BaseModel
        # @!attribute every
        #
        #   @return [String, nil]
        optional :every, String

        # @!attribute offset
        #   Phase shift within `every`. Must be < `every` (enforced at runtime).
        #
        #   @return [String, nil]
        optional :offset, String

        # @!method initialize(every: nil, offset: nil)
        #   Interval is a duration-based rule. Fires every `every` from a stable anchor
        #   (workspace epoch), optionally phase-shifted by `offset`.
        #
        #   @param every [String]
        #
        #   @param offset [String] Phase shift within `every`. Must be < `every` (enforced at runtime).
      end
    end
  end
end
