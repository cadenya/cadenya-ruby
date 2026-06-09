# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentScheduleSpec < Cadenya::Internal::Type::BaseModel
        # @!attribute initial_message
        #   The initial message passed to CreateObjective on each fire. Becomes the first
        #   user message in the objective's chat history.
        #
        #   @return [String]
        required :initial_message, String, api_name: :initialMessage

        # @!attribute schedule
        #   Schedule defines WHEN the schedule fires. Temporal-style structured form: a list
        #   of calendar rules (wall-clock) and/or interval rules (duration), OR'd together.
        #   At least one rule is required.
        #
        #   @return [Cadenya::Models::Agents::AgentScheduleSpecSchedule]
        required :schedule, -> { Cadenya::Agents::AgentScheduleSpecSchedule }

        # @!attribute data
        #   Optional input data passed to the objective. If the agent has an
        #   input_data_schema, this must satisfy it.
        #
        #   @return [Object, nil]
        optional :data, Cadenya::Internal::Type::Unknown

        # @!attribute overlap_policy
        #   What to do when the previous run is still in flight. Defaults to SKIP.
        #
        #   @return [Symbol, Cadenya::Models::Agents::AgentScheduleSpec::OverlapPolicy, nil]
        optional :overlap_policy,
                 enum: -> { Cadenya::Agents::AgentScheduleSpec::OverlapPolicy },
                 api_name: :overlapPolicy

        # @!attribute variation_id
        #   Optional explicit variation. When unset, the agent's variation_selection_mode
        #   chooses per fire.
        #
        #   @return [String, nil]
        optional :variation_id, String, api_name: :variationId

        # @!method initialize(initial_message:, schedule:, data: nil, overlap_policy: nil, variation_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentScheduleSpec} for more details.
        #
        #   AgentScheduleSpec is the user-provided configuration for a schedule.
        #
        #   @param initial_message [String] The initial message passed to CreateObjective on each fire. Becomes the
        #
        #   @param schedule [Cadenya::Models::Agents::AgentScheduleSpecSchedule] Schedule defines WHEN the schedule fires. Temporal-style structured form:
        #
        #   @param data [Object] Optional input data passed to the objective. If the agent has an
        #
        #   @param overlap_policy [Symbol, Cadenya::Models::Agents::AgentScheduleSpec::OverlapPolicy] What to do when the previous run is still in flight. Defaults to SKIP.
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
