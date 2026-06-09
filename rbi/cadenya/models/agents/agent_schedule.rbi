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

        # The current lifecycle state of the schedule. Output only. Schedules are created
        # STATE_ACTIVE; use the :pause, :resume, and :archive actions to transition
        # between states.
        sig { returns(Cadenya::Agents::AgentSchedule::State::TaggedSymbol) }
        attr_accessor :state

        # AgentSchedule resource — a recurring trigger attached to an agent that creates
        # objectives on its cadence.
        sig do
          params(
            metadata: Cadenya::ResourceMetadata::OrHash,
            spec: Cadenya::Agents::AgentScheduleSpec::OrHash,
            state: Cadenya::Agents::AgentSchedule::State::OrSymbol,
            info: Cadenya::Agents::AgentScheduleInfo::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          metadata:,
          # AgentScheduleSpec is the user-provided configuration for a schedule.
          spec:,
          # The current lifecycle state of the schedule. Output only. Schedules are created
          # STATE_ACTIVE; use the :pause, :resume, and :archive actions to transition
          # between states.
          state:,
          # AgentScheduleInfo provides read-only runtime data about a schedule.
          info: nil
        )
        end

        sig do
          override.returns(
            {
              metadata: Cadenya::ResourceMetadata,
              spec: Cadenya::Agents::AgentScheduleSpec,
              state: Cadenya::Agents::AgentSchedule::State::TaggedSymbol,
              info: Cadenya::Agents::AgentScheduleInfo
            }
          )
        end
        def to_hash
        end

        # The current lifecycle state of the schedule. Output only. Schedules are created
        # STATE_ACTIVE; use the :pause, :resume, and :archive actions to transition
        # between states.
        module State
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::Agents::AgentSchedule::State)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STATE_UNSPECIFIED =
            T.let(
              :STATE_UNSPECIFIED,
              Cadenya::Agents::AgentSchedule::State::TaggedSymbol
            )
          STATE_ACTIVE =
            T.let(
              :STATE_ACTIVE,
              Cadenya::Agents::AgentSchedule::State::TaggedSymbol
            )
          STATE_PAUSED =
            T.let(
              :STATE_PAUSED,
              Cadenya::Agents::AgentSchedule::State::TaggedSymbol
            )
          STATE_ARCHIVED =
            T.let(
              :STATE_ARCHIVED,
              Cadenya::Agents::AgentSchedule::State::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Cadenya::Agents::AgentSchedule::State::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
