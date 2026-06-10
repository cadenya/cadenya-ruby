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

        # Optional initial message passed to CreateObjective on each fire. Becomes the
        # first user message in the objective's chat history. When unset, the fired
        # objective defers to the selected variation's user_message_template.
        sig { returns(T.nilable(String)) }
        attr_reader :initial_message

        sig { params(initial_message: String).void }
        attr_writer :initial_message

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

        # Optional data rendered into the variation's user_message_template when each
        # fired objective is created. Separate from `data`, which renders the system
        # prompt template.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :user_data

        sig { params(user_data: T.anything).void }
        attr_writer :user_data

        # Optional explicit variation. When unset, the agent's variation_selection_mode
        # chooses per fire.
        sig { returns(T.nilable(String)) }
        attr_reader :variation_id

        sig { params(variation_id: String).void }
        attr_writer :variation_id

        # AgentScheduleSpec is the user-provided configuration for a schedule.
        sig do
          params(
            schedule: Cadenya::Agents::AgentScheduleSpecSchedule::OrHash,
            data: T.anything,
            initial_message: String,
            overlap_policy:
              Cadenya::Agents::AgentScheduleSpec::OverlapPolicy::OrSymbol,
            user_data: T.anything,
            variation_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Schedule defines WHEN the schedule fires. Temporal-style structured form: a list
          # of calendar rules (wall-clock) and/or interval rules (duration), OR'd together.
          # At least one rule is required.
          schedule:,
          # Optional input data passed to the objective. If the agent has an
          # input_data_schema, this must satisfy it.
          data: nil,
          # Optional initial message passed to CreateObjective on each fire. Becomes the
          # first user message in the objective's chat history. When unset, the fired
          # objective defers to the selected variation's user_message_template.
          initial_message: nil,
          # What to do when the previous run is still in flight. Defaults to SKIP.
          overlap_policy: nil,
          # Optional data rendered into the variation's user_message_template when each
          # fired objective is created. Separate from `data`, which renders the system
          # prompt template.
          user_data: nil,
          # Optional explicit variation. When unset, the agent's variation_selection_mode
          # chooses per fire.
          variation_id: nil
        )
        end

        sig do
          override.returns(
            {
              schedule: Cadenya::Agents::AgentScheduleSpecSchedule,
              data: T.anything,
              initial_message: String,
              overlap_policy:
                Cadenya::Agents::AgentScheduleSpec::OverlapPolicy::OrSymbol,
              user_data: T.anything,
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
      end
    end
  end
end
