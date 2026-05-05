# typed: strong

module Cadenya
  module Models
    AgentSchedule = Agents::AgentSchedule

    module Agents
      class AgentSchedule < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::Agents::AgentSchedule, Cadenya::Internal::AnyHash)
          end

        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        sig { returns(Cadenya::ResourceMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::ResourceMetadata::OrHash).void }
        attr_writer :metadata

        # AgentScheduleSpec is the user-provided configuration for a schedule.
        sig { returns(Cadenya::Agents::AgentScheduleSpec) }
        attr_reader :spec

        sig { params(spec: Cadenya::Agents::AgentScheduleSpec::OrHash).void }
        attr_writer :spec

        # AgentScheduleInfo provides read-only runtime data about a schedule.
        sig { returns(T.nilable(Cadenya::Agents::AgentScheduleInfo)) }
        attr_reader :info

        sig { params(info: Cadenya::Agents::AgentScheduleInfo::OrHash).void }
        attr_writer :info

        # AgentSchedule resource — a recurring trigger attached to an agent that creates
        # objectives on its cadence.
        sig do
          params(
            metadata: Cadenya::ResourceMetadata::OrHash,
            spec: Cadenya::Agents::AgentScheduleSpec::OrHash,
            info: Cadenya::Agents::AgentScheduleInfo::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          metadata:,
          # AgentScheduleSpec is the user-provided configuration for a schedule.
          spec:,
          # AgentScheduleInfo provides read-only runtime data about a schedule.
          info: nil
        )
        end

        sig do
          override.returns(
            {
              metadata: Cadenya::ResourceMetadata,
              spec: Cadenya::Agents::AgentScheduleSpec,
              info: Cadenya::Agents::AgentScheduleInfo
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
