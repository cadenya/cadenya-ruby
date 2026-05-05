# typed: strong

module Cadenya
  module Models
    AgentScheduleSpec = Agents::AgentScheduleSpec

    module Agents
      class AgentScheduleSpec < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::AgentScheduleSpec,
              Cadenya::Internal::AnyHash
            )
          end

        # The initial message passed to CreateObjective on each fire. Becomes the first
        # user message in the objective's chat history.
        sig { returns(String) }
        attr_accessor :initial_message

        # Schedule defines WHEN the schedule fires. Temporal-style structured form: a list
        # of calendar rules (wall-clock) and/or interval rules (duration), OR'd together.
        # At least one rule is required.
        sig { returns(Cadenya::Agents::AgentScheduleSpecSchedule) }
        attr_reader :schedule

        sig do
          params(
            schedule: Cadenya::Agents::AgentScheduleSpecSchedule::OrHash
          ).void
        end
        attr_writer :schedule

        # Optional input data passed to the objective. If the agent has an
        # input_data_schema, this must satisfy it.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :data

        sig { params(data: T.anything).void }
        attr_writer :data

        # What to do when the previous run is still in flight. Defaults to SKIP.
        sig do
          returns(
            T.nilable(
              Cadenya::Agents::AgentScheduleSpec::OverlapPolicy::OrSymbol
            )
          )
        end
        attr_reader :overlap_policy

        sig do
          params(
            overlap_policy:
              Cadenya::Agents::AgentScheduleSpec::OverlapPolicy::OrSymbol
          ).void
        end
        attr_writer :overlap_policy

        # Lifecycle. Defaults to ACTIVE on create when unspecified.
        sig do
          returns(
            T.nilable(Cadenya::Agents::AgentScheduleSpec::Status::OrSymbol)
          )
        end
        attr_reader :status

        sig do
          params(
            status: Cadenya::Agents::AgentScheduleSpec::Status::OrSymbol
          ).void
        end
        attr_writer :status

        # Optional explicit variation. When unset, the agent's variation_selection_mode
        # chooses per fire.
        sig { returns(T.nilable(String)) }
        attr_reader :variation_id

        sig { params(variation_id: String).void }
        attr_writer :variation_id

        # AgentScheduleSpec is the user-provided configuration for a schedule.
        sig do
          params(
            initial_message: String,
            schedule: Cadenya::Agents::AgentScheduleSpecSchedule::OrHash,
            data: T.anything,
            overlap_policy:
              Cadenya::Agents::AgentScheduleSpec::OverlapPolicy::OrSymbol,
            status: Cadenya::Agents::AgentScheduleSpec::Status::OrSymbol,
            variation_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The initial message passed to CreateObjective on each fire. Becomes the first
          # user message in the objective's chat history.
          initial_message:,
          # Schedule defines WHEN the schedule fires. Temporal-style structured form: a list
          # of calendar rules (wall-clock) and/or interval rules (duration), OR'd together.
          # At least one rule is required.
          schedule:,
          # Optional input data passed to the objective. If the agent has an
          # input_data_schema, this must satisfy it.
          data: nil,
          # What to do when the previous run is still in flight. Defaults to SKIP.
          overlap_policy: nil,
          # Lifecycle. Defaults to ACTIVE on create when unspecified.
          status: nil,
          # Optional explicit variation. When unset, the agent's variation_selection_mode
          # chooses per fire.
          variation_id: nil
        )
        end

        sig do
          override.returns(
            {
              initial_message: String,
              schedule: Cadenya::Agents::AgentScheduleSpecSchedule,
              data: T.anything,
              overlap_policy:
                Cadenya::Agents::AgentScheduleSpec::OverlapPolicy::OrSymbol,
              status: Cadenya::Agents::AgentScheduleSpec::Status::OrSymbol,
              variation_id: String
            }
          )
        end
        def to_hash
        end

        # What to do when the previous run is still in flight. Defaults to SKIP.
        module OverlapPolicy
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::Agents::AgentScheduleSpec::OverlapPolicy)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OVERLAP_POLICY_UNSPECIFIED =
            T.let(
              :OVERLAP_POLICY_UNSPECIFIED,
              Cadenya::Agents::AgentScheduleSpec::OverlapPolicy::TaggedSymbol
            )
          OVERLAP_POLICY_ALLOW =
            T.let(
              :OVERLAP_POLICY_ALLOW,
              Cadenya::Agents::AgentScheduleSpec::OverlapPolicy::TaggedSymbol
            )
          OVERLAP_POLICY_SKIP =
            T.let(
              :OVERLAP_POLICY_SKIP,
              Cadenya::Agents::AgentScheduleSpec::OverlapPolicy::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Agents::AgentScheduleSpec::OverlapPolicy::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Lifecycle. Defaults to ACTIVE on create when unspecified.
        module Status
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::Agents::AgentScheduleSpec::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT_SCHEDULE_STATUS_UNSPECIFIED =
            T.let(
              :AGENT_SCHEDULE_STATUS_UNSPECIFIED,
              Cadenya::Agents::AgentScheduleSpec::Status::TaggedSymbol
            )
          AGENT_SCHEDULE_STATUS_ACTIVE =
            T.let(
              :AGENT_SCHEDULE_STATUS_ACTIVE,
              Cadenya::Agents::AgentScheduleSpec::Status::TaggedSymbol
            )
          AGENT_SCHEDULE_STATUS_PAUSED =
            T.let(
              :AGENT_SCHEDULE_STATUS_PAUSED,
              Cadenya::Agents::AgentScheduleSpec::Status::TaggedSymbol
            )
          AGENT_SCHEDULE_STATUS_ARCHIVED =
            T.let(
              :AGENT_SCHEDULE_STATUS_ARCHIVED,
              Cadenya::Agents::AgentScheduleSpec::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Cadenya::Agents::AgentScheduleSpec::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
