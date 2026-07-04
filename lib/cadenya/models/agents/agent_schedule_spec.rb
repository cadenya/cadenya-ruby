# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentScheduleSpec < Cadenya::Internal::Type::BaseModel
        # @!attribute schedule
        #   Schedule defines WHEN the schedule fires. Temporal-style structured form: a list
        #   of calendar rules (wall-clock) and/or interval rules (duration), OR'd together.
        #   At least one rule is required.
        #
        #   @return [Cadenya::Models::Agents::AgentScheduleSpecSchedule]
        required :schedule, -> { Cadenya::Agents::AgentScheduleSpecSchedule }

        # @!attribute first_user_message
        #   Optional explicit first user message passed to CreateObjective on each fire.
        #   Becomes the first user message in the objective's chat history. When unset, the
        #   fired objective defers to the selected variation's first_user_message_template.
        #
        #   @return [String, nil]
        optional :first_user_message, String, api_name: :firstUserMessage

        # @!attribute first_user_message_data
        #   Optional data rendered into the variation's first_user_message_template when
        #   each fired objective is created. Separate from `system_prompt_data`, which
        #   renders the system prompt template.
        #
        #   @return [Object, nil]
        optional :first_user_message_data, Cadenya::Internal::Type::Unknown, api_name: :firstUserMessageData

        # @!attribute overlap_policy
        #   What to do when the previous run is still in flight. Defaults to SKIP.
        #
        #   @return [Symbol, Cadenya::Models::Agents::AgentScheduleSpec::OverlapPolicy, nil]
        optional :overlap_policy,
                 enum: -> { Cadenya::Agents::AgentScheduleSpec::OverlapPolicy },
                 api_name: :overlapPolicy

        # @!attribute system_prompt_data
        #   Optional data rendered into the variation's system_prompt_template when each
        #   fired objective is created. If the agent has a system_prompt_data_schema, this
        #   must satisfy it.
        #
        #   @return [Object, nil]
        optional :system_prompt_data, Cadenya::Internal::Type::Unknown, api_name: :systemPromptData

        # @!attribute variation_id
        #   Optional explicit variation. When unset, the agent's variation_selection_mode
        #   chooses per fire.
        #
        #   @return [String, nil]
        optional :variation_id, String, api_name: :variationId

        # @!method initialize(schedule:, first_user_message: nil, first_user_message_data: nil, overlap_policy: nil, system_prompt_data: nil, variation_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentScheduleSpec} for more details.
        #
        #   AgentScheduleSpec is the user-provided configuration for a schedule.
        #
        #   @param schedule [Cadenya::Models::Agents::AgentScheduleSpecSchedule] Schedule defines WHEN the schedule fires. Temporal-style structured form:
        #
        #   @param first_user_message [String] Optional explicit first user message passed to CreateObjective on each fire.
        #
        #   @param first_user_message_data [Object] Optional data rendered into the variation's first_user_message_template when
        #
        #   @param overlap_policy [Symbol, Cadenya::Models::Agents::AgentScheduleSpec::OverlapPolicy] What to do when the previous run is still in flight. Defaults to SKIP.
        #
        #   @param system_prompt_data [Object] Optional data rendered into the variation's system_prompt_template when each
        #
        #   @param variation_id [String] Optional explicit variation. When unset, the agent's variation_selection_mode

        # What to do when the previous run is still in flight. Defaults to SKIP.
        #
        # @see Cadenya::Models::Agents::AgentScheduleSpec#overlap_policy
        module OverlapPolicy
          extend Cadenya::Internal::Type::Enum

          OVERLAP_POLICY_UNSPECIFIED = :OVERLAP_POLICY_UNSPECIFIED
          OVERLAP_POLICY_ALLOW = :OVERLAP_POLICY_ALLOW
          OVERLAP_POLICY_SKIP = :OVERLAP_POLICY_SKIP

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    AgentScheduleSpec = Agents::AgentScheduleSpec
  end
end
