# frozen_string_literal: true

module Cadenya
  module Models
    class ObjectiveConfigSnapshot < Cadenya::Internal::Type::BaseModel
      # @!attribute agent
      #   Agent resource
      #
      #   @return [Cadenya::Models::Agent, nil]
      optional :agent, -> { Cadenya::Agent }

      # @!attribute agent_schedule
      #   AgentSchedule resource — a recurring trigger attached to an agent that creates
      #   objectives on its cadence.
      #
      #   @return [Cadenya::Models::Agents::AgentSchedule, nil]
      optional :agent_schedule, -> { Cadenya::Agents::AgentSchedule }, api_name: :agentSchedule

      # @!attribute agent_variation
      #   AgentVariation resource
      #
      #   @return [Cadenya::Models::Agents::AgentVariation, nil]
      optional :agent_variation, -> { Cadenya::Agents::AgentVariation }, api_name: :agentVariation

      # @!method initialize(agent: nil, agent_schedule: nil, agent_variation: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::ObjectiveConfigSnapshot} for more details.
      #
      #   ObjectiveConfigSnapshot is the point-in-time snapshot of the agent, variation,
      #   and (when applicable) schedule that an objective was started with.
      #
      #   @param agent [Cadenya::Models::Agent] Agent resource
      #
      #   @param agent_schedule [Cadenya::Models::Agents::AgentSchedule] AgentSchedule resource — a recurring trigger attached to an agent that
      #
      #   @param agent_variation [Cadenya::Models::Agents::AgentVariation] AgentVariation resource
    end
  end
end
