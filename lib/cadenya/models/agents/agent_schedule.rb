# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::Schedules#create
      class AgentSchedule < Cadenya::Internal::Type::BaseModel
        # @!attribute metadata
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata]
        required :metadata, -> { Cadenya::ResourceMetadata }

        # @!attribute spec
        #   AgentScheduleSpec is the user-provided configuration for a schedule.
        #
        #   @return [Cadenya::Models::Agents::AgentScheduleSpec]
        required :spec, -> { Cadenya::Agents::AgentScheduleSpec }

        # @!attribute info
        #   AgentScheduleInfo provides read-only runtime data about a schedule.
        #
        #   @return [Cadenya::Models::Agents::AgentScheduleInfo]
        required :info, -> { Cadenya::Agents::AgentScheduleInfo }

        response_only do
          # @!attribute state
          #   The current lifecycle state of the schedule. Output only. Schedules are created
          #   STATE_ACTIVE; use the :pause, :resume, and :archive actions to transition
          #   between states.
          #
          #   @return [Symbol, Cadenya::Models::Agents::AgentSchedule::State]
          required :state, enum: -> { Cadenya::Agents::AgentSchedule::State }
        end

        # @!method initialize(metadata:, spec:, state:, info:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentSchedule} for more details.
        #
        #   AgentSchedule resource — a recurring trigger attached to an agent that creates
        #   objectives on its cadence.
        #
        #   @param metadata [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @param spec [Cadenya::Models::Agents::AgentScheduleSpec] AgentScheduleSpec is the user-provided configuration for a schedule.
        #
        #   @param state [Symbol, Cadenya::Models::Agents::AgentSchedule::State] The current lifecycle state of the schedule. Output only. Schedules are
        #
        #   @param info [Cadenya::Models::Agents::AgentScheduleInfo] AgentScheduleInfo provides read-only runtime data about a schedule.

        # The current lifecycle state of the schedule. Output only. Schedules are created
        # STATE_ACTIVE; use the :pause, :resume, and :archive actions to transition
        # between states.
        #
        # @see Cadenya::Models::Agents::AgentSchedule#state
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

    AgentSchedule = Agents::AgentSchedule
  end
end
