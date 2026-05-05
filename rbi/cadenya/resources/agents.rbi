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
          workspace_id: String,
          metadata: Cadenya::CreateResourceMetadata::OrHash,
          spec: Cadenya::AgentSpec::OrHash,
          default_variation:
            Cadenya::AgentCreateParams::DefaultVariation::OrHash,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Agent)
      end
      def create(
        # Workspace ID.
        workspace_id,
        # CreateResourceMetadata contains the user-provided fields for creating a
        # workspace-scoped resource. Read-only fields (id, account_id, workspace_id,
        # profile_id, created_at) are excluded since they are set by the server.
        metadata:,
        # Agent specification (user-provided configuration)
        spec:,
        # Create agent variation request
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
        workspace_id:,
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
        workspace_id:,
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
          bundle_key: String,
          cursor: String,
          include_info: T::Boolean,
          limit: Integer,
          prefix: String,
          query: String,
          sort_order: String,
          status: Cadenya::AgentListParams::Status::OrSymbol,
          variation_selection_mode:
            Cadenya::AgentListParams::VariationSelectionMode::OrSymbol,
          request_options: Cadenya::RequestOptions::OrHash
        ).returns(Cadenya::Internal::CursorPagination[Cadenya::Agent])
      end
      def list(
        # Workspace ID.
        workspace_id,
        # Filter by bundle_key — return only resources owned by this bundle.
        bundle_key: nil,
        # Pagination cursor from previous response
        cursor: nil,
        # When true, the `info` field on each returned agent is populated. Requests with
        # this flag count more against your rate limit.
        include_info: nil,
        # Maximum number of results to return
        limit: nil,
        # Filter expression (query param: prefix)
        prefix: nil,
        # Free-form search query
        query: nil,
        # Sort order for results (asc or desc by creation time)
        sort_order: nil,
        # Filter by agent publication status
        status: nil,
        # Filter by variation selection mode
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
        workspace_id:,
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
