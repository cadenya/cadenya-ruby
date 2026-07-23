# typed: strong

module Cadenya
  module Resources
    class Agents
      # Manage recurring schedules attached to agents. Schedules trigger objectives on a
      # cadence defined by AgentScheduleSpec.Schedule.
      class Schedules
        # Creates a new schedule for an agent
        sig do
          params(
            agent_id: String,
            metadata: Cadenya::CreateResourceMetadata::OrHash,
            spec: Cadenya::Agents::AgentScheduleSpec::OrHash,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Agents::AgentSchedule)
        end
        def create(
          # Path param: Agent ID. Accepts the canonical `agent_…` form or the
          # `external_id:<value>` form.
          agent_id,
          # Body param: CreateResourceMetadata contains the user-provided fields for
          # creating a workspace-scoped resource. Read-only fields (id, account_id,
          # workspace_id, profile_id, created_at) are excluded since they are set by the
          # server.
          metadata:,
          # Body param: AgentScheduleSpec is the user-provided configuration for a schedule.
          spec:,
          # Path param: Workspace ID.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Retrieves a schedule by ID from an agent
        sig do
          params(
            agent_id: String,
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Agents::AgentSchedule)
        end
        def retrieve(
          # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
          # form.
          agent_id,
          # Schedule ID. Accepts the canonical `as_…` form or the `external_id:<value>`
          # form.
          id,
          # Workspace ID.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Updates a schedule for an agent
        sig do
          params(
            agent_id: String,
            id: String,
            workspace_id: String,
            metadata: Cadenya::UpdateResourceMetadata::OrHash,
            spec: Cadenya::Agents::AgentScheduleSpec::OrHash,
            update_mask: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Agents::AgentSchedule)
        end
        def update(
          # Path param: Agent ID. Accepts the canonical `agent_…` form or the
          # `external_id:<value>` form.
          agent_id,
          # Path param: Schedule ID. Accepts the canonical `as_…` form or the
          # `external_id:<value>` form.
          id,
          # Path param: Workspace ID.
          workspace_id: nil,
          # Body param: UpdateResourceMetadata contains the user-provided fields for
          # updating a workspace-scoped resource. Read-only fields (id, account_id,
          # workspace_id, profile_id, created_at) are excluded since they are set by the
          # server.
          metadata: nil,
          # Body param: AgentScheduleSpec is the user-provided configuration for a schedule.
          spec: nil,
          # Body param: Fields to update.
          update_mask: nil,
          request_options: {}
        )
        end

        # Lists all schedules for an agent
        sig do
          params(
            agent_id: String,
            workspace_id: String,
            cursor: String,
            include_info: T::Boolean,
            labels: String,
            limit: Integer,
            prefix: String,
            query: String,
            sort_order: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[Cadenya::Agents::AgentSchedule]
          )
        end
        def list(
          # Path param: Agent ID. Accepts the canonical `agent_…` form or the
          # `external_id:<value>` form.
          agent_id,
          # Path param: Workspace ID.
          workspace_id: nil,
          # Query param: Pagination cursor from previous response.
          cursor: nil,
          # Query param: When true, the `info` field on each returned schedule is populated.
          # Requests with this flag count more against your rate limit.
          include_info: nil,
          # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
          # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
          # semantics).
          labels: nil,
          # Query param: Maximum number of results to return.
          limit: nil,
          # Query param: Filter expression (query param: prefix).
          prefix: nil,
          # Query param: Free-form search query.
          query: nil,
          # Query param: Sort order for results (asc or desc by creation time).
          sort_order: nil,
          request_options: {}
        )
        end

        # Deletes a schedule from an agent
        sig do
          params(
            agent_id: String,
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
          # form.
          agent_id,
          # Schedule ID. Accepts the canonical `as_…` form or the `external_id:<value>`
          # form.
          id,
          # Workspace ID.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Transitions a schedule to STATE_ARCHIVED and removes its underlying timer.
        # Archiving is terminal: archived schedules never fire and cannot be reactivated;
        # create a new schedule instead.
        sig do
          params(
            agent_id: String,
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Agents::AgentSchedule)
        end
        def archive(
          # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
          # form.
          agent_id,
          # Schedule ID. Accepts the canonical `as_…` form or the `external_id:<value>`
          # form.
          id,
          # Workspace ID.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Transitions a schedule to STATE_PAUSED. Paused schedules retain history but do
        # not fire.
        sig do
          params(
            agent_id: String,
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Agents::AgentSchedule)
        end
        def pause(
          # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
          # form.
          agent_id,
          # Schedule ID. Accepts the canonical `as_…` form or the `external_id:<value>`
          # form.
          id,
          # Workspace ID.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Transitions a paused schedule back to STATE_ACTIVE so it fires on its cadence
        # again. Archived schedules cannot be resumed.
        sig do
          params(
            agent_id: String,
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Agents::AgentSchedule)
        end
        def resume(
          # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
          # form.
          agent_id,
          # Schedule ID. Accepts the canonical `as_…` form or the `external_id:<value>`
          # form.
          id,
          # Workspace ID.
          workspace_id: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Cadenya::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
