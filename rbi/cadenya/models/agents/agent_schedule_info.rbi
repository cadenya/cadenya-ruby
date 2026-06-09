# typed: strong

module Cadenya
  module Models
    AgentScheduleInfo = Agents::AgentScheduleInfo

    module Agents
      class AgentScheduleInfo < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::AgentScheduleInfo,
              Cadenya::Internal::AnyHash
            )
          end

        # A profile identifies a user or non-human principal (such as an API key) at the
        # account level. Profiles are account-scoped and can be granted access to multiple
        # workspaces.
        sig { returns(T.nilable(Cadenya::Profile)) }
        attr_reader :created_by

        sig { params(created_by: Cadenya::Profile::OrHash).void }
        attr_writer :created_by

        # When the schedule last fired (regardless of objective outcome).
        sig { returns(T.nilable(Time)) }
        attr_reader :last_fire_at

        sig { params(last_fire_at: Time).void }
        attr_writer :last_fire_at

        # ID of the most recent objective the schedule created.
        sig { returns(T.nilable(String)) }
        attr_reader :last_objective_id

        sig { params(last_objective_id: String).void }
        attr_writer :last_objective_id

        # When the schedule most recently skipped a fire (SKIP policy + prior in flight).
        sig { returns(T.nilable(Time)) }
        attr_reader :last_skipped_at

        sig { params(last_skipped_at: Time).void }
        attr_writer :last_skipped_at

        # Reason for the most recent skip (e.g. "previous objective still running").
        sig { returns(T.nilable(String)) }
        attr_reader :last_skip_reason

        sig { params(last_skip_reason: String).void }
        attr_writer :last_skip_reason

        # When the schedule will next fire. Computed from the spec; absent when the
        # schedule is STATE_PAUSED/STATE_ARCHIVED or has no future fire times.
        sig { returns(T.nilable(Time)) }
        attr_reader :next_fire_at

        sig { params(next_fire_at: Time).void }
        attr_writer :next_fire_at

        # Lifetime count of objectives created by this schedule.
        sig { returns(T.nilable(Integer)) }
        attr_reader :total_fires

        sig { params(total_fires: Integer).void }
        attr_writer :total_fires

        # AgentScheduleInfo provides read-only runtime data about a schedule.
        sig do
          params(
            created_by: Cadenya::Profile::OrHash,
            last_fire_at: Time,
            last_objective_id: String,
            last_skipped_at: Time,
            last_skip_reason: String,
            next_fire_at: Time,
            total_fires: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # A profile identifies a user or non-human principal (such as an API key) at the
          # account level. Profiles are account-scoped and can be granted access to multiple
          # workspaces.
          created_by: nil,
          # When the schedule last fired (regardless of objective outcome).
          last_fire_at: nil,
          # ID of the most recent objective the schedule created.
          last_objective_id: nil,
          # When the schedule most recently skipped a fire (SKIP policy + prior in flight).
          last_skipped_at: nil,
          # Reason for the most recent skip (e.g. "previous objective still running").
          last_skip_reason: nil,
          # When the schedule will next fire. Computed from the spec; absent when the
          # schedule is STATE_PAUSED/STATE_ARCHIVED or has no future fire times.
          next_fire_at: nil,
          # Lifetime count of objectives created by this schedule.
          total_fires: nil
        )
        end

        sig do
          override.returns(
            {
              created_by: Cadenya::Profile,
              last_fire_at: Time,
              last_objective_id: String,
              last_skipped_at: Time,
              last_skip_reason: String,
              next_fire_at: Time,
              total_fires: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
