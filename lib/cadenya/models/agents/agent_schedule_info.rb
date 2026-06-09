# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class AgentScheduleInfo < Cadenya::Internal::Type::BaseModel
        # @!attribute created_by
        #   A profile identifies a user or non-human principal (such as an API key) at the
        #   account level. Profiles are account-scoped and can be granted access to multiple
        #   workspaces.
        #
        #   @return [Cadenya::Models::Profile, nil]
        optional :created_by, -> { Cadenya::Profile }, api_name: :createdBy

        response_only do
          # @!attribute last_fire_at
          #   When the schedule last fired (regardless of objective outcome).
          #
          #   @return [Time, nil]
          optional :last_fire_at, Time, api_name: :lastFireAt

          # @!attribute last_objective_id
          #   ID of the most recent objective the schedule created.
          #
          #   @return [String, nil]
          optional :last_objective_id, String, api_name: :lastObjectiveId

          # @!attribute last_skipped_at
          #   When the schedule most recently skipped a fire (SKIP policy + prior in flight).
          #
          #   @return [Time, nil]
          optional :last_skipped_at, Time, api_name: :lastSkippedAt

          # @!attribute last_skip_reason
          #   Reason for the most recent skip (e.g. "previous objective still running").
          #
          #   @return [String, nil]
          optional :last_skip_reason, String, api_name: :lastSkipReason

          # @!attribute next_fire_at
          #   When the schedule will next fire. Computed from the spec; absent when the
          #   schedule is STATE_PAUSED/STATE_ARCHIVED or has no future fire times.
          #
          #   @return [Time, nil]
          optional :next_fire_at, Time, api_name: :nextFireAt

          # @!attribute total_fires
          #   Lifetime count of objectives created by this schedule.
          #
          #   @return [Integer, nil]
          optional :total_fires, Integer, api_name: :totalFires
        end

        # @!method initialize(created_by: nil, last_fire_at: nil, last_objective_id: nil, last_skipped_at: nil, last_skip_reason: nil, next_fire_at: nil, total_fires: nil)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::AgentScheduleInfo} for more details.
        #
        #   AgentScheduleInfo provides read-only runtime data about a schedule.
        #
        #   @param created_by [Cadenya::Models::Profile] A profile identifies a user or non-human principal (such as an API key)
        #
        #   @param last_fire_at [Time] When the schedule last fired (regardless of objective outcome).
        #
        #   @param last_objective_id [String] ID of the most recent objective the schedule created.
        #
        #   @param last_skipped_at [Time] When the schedule most recently skipped a fire (SKIP policy + prior in flight).
        #
        #   @param last_skip_reason [String] Reason for the most recent skip (e.g. "previous objective still running").
        #
        #   @param next_fire_at [Time] When the schedule will next fire. Computed from the spec; absent when
        #
        #   @param total_fires [Integer] Lifetime count of objectives created by this schedule.
      end
    end

    AgentScheduleInfo = Agents::AgentScheduleInfo
  end
end
