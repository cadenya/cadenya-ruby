# typed: strong

module Cadenya
  module Resources
    class Agents
      # Manage variations of an agent and their tool, sub-agent, and memory layer
      # assignments.
      class Variations
        # Creates a new variation for an agent
        sig do
          params(
            agent_id: String,
            metadata: Cadenya::CreateResourceMetadata::OrHash,
            spec: Cadenya::Agents::AgentVariationSpec::OrHash,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Agents::AgentVariation)
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
          # Body param: AgentVariationSpec defines the operational configuration for a
          # variation
          spec:,
          # Path param: Workspace ID.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Retrieves a variation by ID from an agent
        sig do
          params(
            agent_id: String,
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Agents::AgentVariation)
        end
        def retrieve(
          # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
          # form.
          agent_id,
          # Variation ID. Accepts the canonical `agentvar_…` form or the
          # `external_id:<value>` form.
          id,
          # Workspace ID.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Updates a variation for an agent
        sig do
          params(
            agent_id: String,
            id: String,
            workspace_id: String,
            metadata: Cadenya::UpdateResourceMetadata::OrHash,
            spec: Cadenya::Agents::AgentVariationSpec::OrHash,
            update_mask: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Agents::AgentVariation)
        end
        def update(
          # Path param: Agent ID. Accepts the canonical `agent_…` form or the
          # `external_id:<value>` form.
          agent_id,
          # Path param: Variation ID. Accepts the canonical `agentvar_…` form or the
          # `external_id:<value>` form.
          id,
          # Path param: Workspace ID.
          workspace_id: nil,
          # Body param: UpdateResourceMetadata contains the user-provided fields for
          # updating a workspace-scoped resource. Read-only fields (id, account_id,
          # workspace_id, profile_id, created_at) are excluded since they are set by the
          # server.
          metadata: nil,
          # Body param: AgentVariationSpec defines the operational configuration for a
          # variation
          spec: nil,
          # Body param: Fields to update
          update_mask: nil,
          request_options: {}
        )
        end

        # Lists all variations for an agent
        sig do
          params(
            agent_id: String,
            workspace_id: String,
            cursor: String,
            include_info: T::Boolean,
            labels: String,
            limit: Integer,
            sort_order: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(
            Cadenya::Internal::CursorPagination[Cadenya::Agents::AgentVariation]
          )
        end
        def list(
          # Path param: Agent ID. Accepts the canonical `agent_…` form or the
          # `external_id:<value>` form.
          agent_id,
          # Path param: Workspace ID.
          workspace_id: nil,
          # Query param: Pagination cursor from previous response
          cursor: nil,
          # Query param: When true, the `info` field on each returned variation is
          # populated. Requests with this flag count more against your rate limit.
          include_info: nil,
          # Query param: Filters by metadata labels. Comma-separated key=value pairs, e.g.
          # "env=prod,team=ai". A resource matches only if every pair matches exactly (AND
          # semantics).
          labels: nil,
          # Query param: Maximum number of results to return
          limit: nil,
          # Query param: Sort order for results (asc or desc by creation time)
          sort_order: nil,
          request_options: {}
        )
        end

        # Deletes a variation from an agent
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
          # Variation ID. Accepts the canonical `agentvar_…` form or the
          # `external_id:<value>` form.
          id,
          # Workspace ID.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Assigns a tool, tool set, or sub-agent to a variation. Exactly one target ID
        # must be set.
        sig do
          params(
            agent_id: String,
            variation_id: String,
            workspace_id: String,
            sub_agent_id: String,
            tool_id: String,
            tool_set_id: String,
            type: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Agents::VariationAssignment)
        end
        def add_assignment(
          # Path param: Agent ID. Accepts the canonical `agent_…` form or the
          # `external_id:<value>` form.
          agent_id,
          # Path param: Variation ID. Accepts the canonical `agentvar_…` form or the
          # `external_id:<value>` form.
          variation_id,
          # Path param: Workspace ID.
          workspace_id: nil,
          # Body param
          sub_agent_id: nil,
          # Body param
          tool_id: nil,
          # Body param
          tool_set_id: nil,
          # Body param: The JSON name of the variant set in `target` (e.g. "toolId").
          # Required on input; drives the discriminated union in the generated OpenAPI.
          type: nil,
          request_options: {}
        )
        end

        # Attaches a memory layer to a variation at a given position in the variation's
        # baseline memory cascade.
        sig do
          params(
            agent_id: String,
            variation_id: String,
            memory_layer_id: String,
            workspace_id: String,
            position: Integer,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Agents::VariationMemoryLayerAssignment)
        end
        def add_memory_layer(
          # Path param: Agent ID. Accepts the canonical `agent_…` form or the
          # `external_id:<value>` form.
          agent_id,
          # Path param: Variation ID. Accepts the canonical `agentvar_…` form or the
          # `external_id:<value>` form.
          variation_id,
          # Body param: Layer to attach. Accepts the canonical `memlyr_…` form or the
          # `external_id:<value>` form.
          memory_layer_id:,
          # Path param: Workspace ID.
          workspace_id: nil,
          # Body param: Position in the baseline cascade (lower = more specific). If
          # omitted, the server appends at the most general end (max existing position + 1).
          position: nil,
          request_options: {}
        )
        end

        # Detaches an assignment from a variation, identified by the assignment ID
        # returned when it was added.
        sig do
          params(
            agent_id: String,
            variation_id: String,
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).void
        end
        def remove_assignment(
          # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
          # form.
          agent_id,
          # Variation ID. Accepts the canonical `agentvar_…` form or the
          # `external_id:<value>` form.
          variation_id,
          id,
          # Workspace ID.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Detaches a memory layer assignment from a variation, identified by the
        # assignment id.
        sig do
          params(
            agent_id: String,
            variation_id: String,
            id: String,
            workspace_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).void
        end
        def remove_memory_layer(
          # Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>`
          # form.
          agent_id,
          # Variation ID. Accepts the canonical `agentvar_…` form or the
          # `external_id:<value>` form.
          variation_id,
          id,
          # Workspace ID.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Updates the position of a memory layer assignment on a variation.
        sig do
          params(
            agent_id: String,
            variation_id: String,
            id: String,
            workspace_id: String,
            position: Integer,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(Cadenya::Agents::VariationMemoryLayerAssignment)
        end
        def update_memory_layer(
          # Path param: Agent ID. Accepts the canonical `agent_…` form or the
          # `external_id:<value>` form.
          agent_id,
          # Path param: Variation ID. Accepts the canonical `agentvar_…` form or the
          # `external_id:<value>` form.
          variation_id,
          # Path param
          id,
          # Path param: Workspace ID.
          workspace_id: nil,
          # Body param: New position. Only field currently updatable on an assignment.
          position: nil,
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
