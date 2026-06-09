# frozen_string_literal: true

module Cadenya
  module Models
    class AgentScheduleEntry < Cadenya::Internal::Type::BaseModel
      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute spec
      #   AgentScheduleSpec is the user-provided configuration for a schedule.
      #
      #   @return [Cadenya::Models::Agents::AgentScheduleSpec]
      required :spec, -> { Cadenya::Agents::AgentScheduleSpec }

      # @!attribute labels
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :labels, Cadenya::Internal::Type::HashOf[String]

      # @!attribute state
      #   Desired lifecycle state for the schedule. Defaults to STATE_ACTIVE when
      #   unspecified. Declare STATE_PAUSED to provision a schedule without it firing.
      #   STATE_ARCHIVED is rejected here.
      #
      #   @return [Symbol, Cadenya::Models::AgentScheduleEntry::State, nil]
      optional :state, enum: -> { Cadenya::AgentScheduleEntry::State }

      # @!method initialize(name:, spec:, labels: nil, state: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AgentScheduleEntry} for more details.
      #
      #   @param name [String]
      #
      #   @param spec [Cadenya::Models::Agents::AgentScheduleSpec] AgentScheduleSpec is the user-provided configuration for a schedule.
      #
      #   @param labels [Hash{Symbol=>String}]
      #
      #   @param state [Symbol, Cadenya::Models::AgentScheduleEntry::State] Desired lifecycle state for the schedule. Defaults to STATE_ACTIVE when

      # Desired lifecycle state for the schedule. Defaults to STATE_ACTIVE when
      # unspecified. Declare STATE_PAUSED to provision a schedule without it firing.
      # STATE_ARCHIVED is rejected here.
      #
      # @see Cadenya::Models::AgentScheduleEntry#state
      module State
        extend Cadenya::Internal::Type::Enum

        STATE_UNSPECIFIED = :STATE_UNSPECIFIED
        STATE_ACTIVE = :STATE_ACTIVE
        STATE_PAUSED = :STATE_PAUSED
        STATE_ARCHIVED = :STATE_ARCHIVED

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
