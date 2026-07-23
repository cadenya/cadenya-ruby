# typed: strong

module Cadenya
  module Resources
    # Manage AI agents within a workspace. Agents define AI behavior and tool access.
    class Agents
      # Manage AI agents within a workspace. Agents define AI behavior and tool access.
      sig { returns(Cadenya::Resources::Agents::Feedback) }
      attr_reader :feedback

      # Manage AI agents within a workspace. Agents define AI behavior and tool access.
      sig { returns(Cadenya::Resources::Agents::WebhookDeliveries) }
      attr_reader :webhook_deliveries

      # Manage variations of an agent and their tool, sub-agent, and memory layer
      # assignments.
      sig { returns(Cadenya::Resources::Agents::Variations) }
      attr_reader :variations

      # Manage recurring schedules attached to agents. Schedules trigger objectives on a
      # cadence defined by AgentScheduleSpec.Schedule.
      sig { returns(Cadenya::Resources::Agents::Schedules) }
      attr_reader :schedules

      # Creates a new agent in the workspace
      sig do
        params(
          metadata: Cadenya::CreateResourceMetadata::OrHash,
          spec: Cadenya::AgentSpec::OrHash,
          workspace_id: String,
          default_variation:
            Cadenya::AgentCreateParams::DefaultVariation::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Agent)
      end
      def create(
        # Body param: CreateResourceMetadata contains the user-provided fields for
        # creating a workspace-scoped resource. Read-only fields (id, account_id,
        # workspace_id, profile_id, created_at) are excluded since they are set by the
        # server.
        metadata:,
        # Body param: Agent specification (user-provided configuration)
        spec:,
        # Path param: Workspace ID.
        workspace_id: nil,
        # Body param: Create agent variation request
        default_variation: nil,
        request_options: {}
      )
      end

      # Retrieves an agent by ID from the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Agent)
      end
      def retrieve(
        # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
        # form.
        id,
        # Workspace ID.
        workspace_id: nil,
        request_options: {}
      )
      end

      # Updates an agent in the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          metadata: Cadenya::UpdateResourceMetadata::OrHash,
          spec: Cadenya::AgentSpec::OrHash,
          update_mask: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Agent)
      end
      def update(
        # Path param: Agent ID. Accepts the canonical `agent_…` form or the
        # `external_id:<value>` form.
        id,
        # Path param: Workspace ID.
        workspace_id: nil,
        # Body param: UpdateResourceMetadata contains the user-provided fields for
        # updating a workspace-scoped resource. Read-only fields (id, account_id,
        # workspace_id, profile_id, created_at) are excluded since they are set by the
        # server.
        metadata: nil,
        # Body param: Agent specification (user-provided configuration)
        spec: nil,
        # Body param: Fields to update
        update_mask: nil,
        request_options: {}
      )
      end

      # Lists all agents in the workspace
      sig do
        params(
          workspace_id: String,
          cursor: String,
          include_info: T::Boolean,
          labels: String,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          state: Cadenya::AgentListParams::State::OrSymbol,
          variation_selection_mode:
            Cadenya::AgentListParams::VariationSelectionMode::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::Agent])
      end
      def list(
        # Path param: Workspace ID.
        workspace_id: nil,
        # Query param: Pagination cursor from previous response
        cursor: nil,
        # Query param: When true, the `info` field on each returned agent is populated.
        # Requests with this flag count more against your rate limit.
        include_info: nil,
        # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
        # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
        # semantics).
        labels: nil,
        # Query param: Maximum number of results to return
        limit: nil,
        # Query param: Filter expression (query param: prefix)
        prefix: nil,
        # Query param: Free-form search query
        query: nil,
        # Query param: Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Query param: Filter by agent lifecycle state
        state: nil,
        # Query param: Filter by variation selection mode
        variation_selection_mode: nil,
        request_options: {}
      )
      end

      # Deletes an agent from the workspace
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
        # form.
        id,
        # Workspace ID.
        workspace_id: nil,
        request_options: {}
      )
      end

      # Transitions an agent to STATE_ARCHIVED. Archived agents are hidden from list
      # results and cannot be used for objectives; active schedules are paused.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Agent)
      end
      def archive(
        # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
        # form.
        id,
        # Workspace ID.
        workspace_id: nil,
        request_options: {}
      )
      end

      # Transitions an agent to STATE_PUBLISHED, making it available for objectives. The
      # agent must have at least one variation.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Agent)
      end
      def publish(
        # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
        # form.
        id,
        # Workspace ID.
        workspace_id: nil,
        request_options: {}
      )
      end

      # Transitions an archived agent back to STATE_DRAFT. Publish the agent again to
      # make it available for objectives.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Agent)
      end
      def unarchive(
        # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
        # form.
        id,
        # Workspace ID.
        workspace_id: nil,
        request_options: {}
      )
      end

      # Transitions a published agent back to STATE_DRAFT. Active schedules for the
      # agent are paused until it is published again.
      sig do
        params(
          id: String,
          workspace_id: String,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Agent)
      end
      def unpublish(
        # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
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
