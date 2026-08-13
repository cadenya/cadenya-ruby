# typed: strong

module Cadenya
  module Models
    class ObjectiveConfigSnapshot < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveConfigSnapshot, Cadenya::Internal::AnyHash)
        end

      # Agent resource
      sig { returns(Cadenya::Agent) }
      attr_accessor :agent

      # AgentSchedule resource — a recurring trigger attached to an agent that creates
      # objectives on its cadence.
      sig { returns(T.nilable(Cadenya::Agents::AgentSchedule)) }
      attr_reader :agent_schedule

      sig do
        params(agent_schedule: Cadenya::Agents::AgentSchedule::OrHash).void
      end
      attr_writer :agent_schedule

      # AgentVariation resource
      sig { returns(Cadenya::Agents::AgentVariation) }
      attr_accessor :agent_variation

      # ObjectiveConfigSnapshot is the point-in-time snapshot of the agent, variation,
      # and (when applicable) schedule that an objective was started with.
      sig do
        params(
          agent: Cadenya::Agent::OrHash,
          agent_variation: Cadenya::Agents::AgentVariation::OrHash,
          agent_schedule: Cadenya::Agents::AgentSchedule::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Agent resource
        agent:,
        # AgentVariation resource
        agent_variation:,
        # AgentSchedule resource — a recurring trigger attached to an agent that creates
        # objectives on its cadence.
        agent_schedule: nil
      )
      end

      sig do
        override.returns(
          {
            agent: Cadenya::Agent,
            agent_schedule: Cadenya::Agents::AgentSchedule,
            agent_variation: Cadenya::Agents::AgentVariation
          }
        )
      end
      def to_hash
      end
    end
  end
end
