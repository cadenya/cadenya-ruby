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

        # Optional explicit first user message passed to CreateObjective on each fire.
        # Becomes the first user message in the objective's chat history. When unset, the
        # fired objective defers to the selected variation's first_user_message_template.
        sig { returns(T.nilable(String)) }
        attr_reader :first_user_message

        sig { params(first_user_message: String).void }
        attr_writer :first_user_message

        # Optional data rendered into the variation's first_user_message_template when
        # each fired objective is created. Separate from `system_prompt_data`, which
        # renders the system prompt template.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :first_user_message_data

        sig { params(first_user_message_data: T.anything).void }
        attr_writer :first_user_message_data

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

        # Optional data rendered into the variation's system_prompt_template when each
        # fired objective is created. If the agent has a system_prompt_data_schema, this
        # must satisfy it.
        sig { returns(T.nilable(T.anything)) }
        attr_reader :system_prompt_data

        sig { params(system_prompt_data: T.anything).void }
        attr_writer :system_prompt_data

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
            first_user_message: String,
            first_user_message_data: T.anything,
            overlap_policy:
              Cadenya::Agents::AgentScheduleSpec::OverlapPolicy::OrSymbol,
            system_prompt_data: T.anything,
            variation_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Schedule defines WHEN the schedule fires. Temporal-style structured form: a list
          # of calendar rules (wall-clock) and/or interval rules (duration), OR'd together.
          # At least one rule is required.
          schedule:,
          # Optional explicit first user message passed to CreateObjective on each fire.
          # Becomes the first user message in the objective's chat history. When unset, the
          # fired objective defers to the selected variation's first_user_message_template.
          first_user_message: nil,
          # Optional data rendered into the variation's first_user_message_template when
          # each fired objective is created. Separate from `system_prompt_data`, which
          # renders the system prompt template.
          first_user_message_data: nil,
          # What to do when the previous run is still in flight. Defaults to SKIP.
          overlap_policy: nil,
          # Optional data rendered into the variation's system_prompt_template when each
          # fired objective is created. If the agent has a system_prompt_data_schema, this
          # must satisfy it.
          system_prompt_data: nil,
          # Optional explicit variation. When unset, the agent's variation_selection_mode
          # chooses per fire.
          variation_id: nil
        )
        end

        sig do
          override.returns(
            {
              schedule: Cadenya::Agents::AgentScheduleSpecSchedule,
              first_user_message: String,
              first_user_message_data: T.anything,
              overlap_policy:
                Cadenya::Agents::AgentScheduleSpec::OverlapPolicy::OrSymbol,
              system_prompt_data: T.anything,
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
