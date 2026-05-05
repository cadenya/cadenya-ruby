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
        #   @return [Cadenya::Models::Agents::AgentScheduleInfo, nil]
        optional :info, -> { Cadenya::Agents::AgentScheduleInfo }

        # @!method initialize(metadata:, spec:, info: nil)
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
        #   @param info [Cadenya::Models::Agents::AgentScheduleInfo] AgentScheduleInfo provides read-only runtime data about a schedule.
      end
    end

    AgentSchedule = Agents::AgentSchedule
  end
end
