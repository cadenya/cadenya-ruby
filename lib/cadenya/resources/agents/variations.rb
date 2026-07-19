# frozen_string_literal: true

module Cadenya
  module Resources
    class Agents
      # Manage variations of an agent and their tool, sub-agent, and memory layer
      # assignments.
      class Variations
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::VariationCreateParams} for more details.
        #
        # Creates a new variation for an agent
        #
        # @overload create(agent_id, metadata:, spec:, workspace_id: nil, request_options: {})
        #
        # @param agent_id [String] Path param: Agent ID. Accepts the canonical `agent_…` form or the `external_id:<
        #
        # @param metadata [Cadenya::Models::CreateResourceMetadata] Body param: CreateResourceMetadata contains the user-provided fields for creatin
        #
        # @param spec [Cadenya::Models::Agents::AgentVariationSpec] Body param: AgentVariationSpec defines the operational configuration for a varia
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Agents::AgentVariation]
        #
        # @see Cadenya::Models::Agents::VariationCreateParams
        def create(agent_id, params)
          parsed, options = Cadenya::Agents::VariationCreateParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              @client.workspace_id
            end
          @client.request(
            method: :post,
            path: ["v1/workspaces/%1$s/agents/%2$s/variations", workspace_id, agent_id],
            body: parsed,
            model: Cadenya::Agents::AgentVariation,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::VariationRetrieveParams} for more details.
        #
        # Retrieves a variation by ID from an agent
        #
        # @overload retrieve(agent_id, id, workspace_id: nil, request_options: {})
        #
        # @param agent_id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
        #
        # @param id [String] Variation ID. Accepts the canonical `agentvar_…` form or the `external_id:<value
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Agents::AgentVariation]
        #
        # @see Cadenya::Models::Agents::VariationRetrieveParams
        def retrieve(agent_id, id, params = {})
          parsed, options = Cadenya::Agents::VariationRetrieveParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              @client.workspace_id
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/agents/%2$s/variations/%3$s", workspace_id, agent_id, id],
            model: Cadenya::Agents::AgentVariation,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::VariationUpdateParams} for more details.
        #
        # Updates a variation for an agent
        #
        # @overload update(agent_id, id, workspace_id: nil, metadata: nil, spec: nil, update_mask: nil, request_options: {})
        #
        # @param agent_id [String] Path param: Agent ID. Accepts the canonical `agent_…` form or the `external_id:<
        #
        # @param id [String] Path param: Variation ID. Accepts the canonical `agentvar_…` form or the `extern
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param metadata [Cadenya::Models::UpdateResourceMetadata] Body param: UpdateResourceMetadata contains the user-provided fields for updatin
        #
        # @param spec [Cadenya::Models::Agents::AgentVariationSpec] Body param: AgentVariationSpec defines the operational configuration for a varia
        #
        # @param update_mask [String] Body param: Fields to update
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Agents::AgentVariation]
        #
        # @see Cadenya::Models::Agents::VariationUpdateParams
        def update(agent_id, id, params = {})
          parsed, options = Cadenya::Agents::VariationUpdateParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              @client.workspace_id
            end
          @client.request(
            method: :patch,
            path: ["v1/workspaces/%1$s/agents/%2$s/variations/%3$s", workspace_id, agent_id, id],
            body: parsed,
            model: Cadenya::Agents::AgentVariation,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::VariationListParams} for more details.
        #
        # Lists all variations for an agent
        #
        # @overload list(agent_id, workspace_id: nil, cursor: nil, include_info: nil, labels: nil, limit: nil, sort_order: nil, request_options: {})
        #
        # @param agent_id [String] Path param: Agent ID. Accepts the canonical `agent_…` form or the `external_id:<
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param cursor [String] Query param: Pagination cursor from previous response
        #
        # @param include_info [Boolean] Query param: When true, the `info` field on each returned variation is populated
        #
        # @param labels [String] Query param: Filters by metadata labels. Comma-separated key=value pairs,
        #
        # @param limit [Integer] Query param: Maximum number of results to return
        #
        # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time)
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Agents::AgentVariation>]
        #
        # @see Cadenya::Models::Agents::VariationListParams
        def list(agent_id, params = {})
          parsed, options = Cadenya::Agents::VariationListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              @client.workspace_id
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/agents/%2$s/variations", workspace_id, agent_id],
            query: query.transform_keys(include_info: "includeInfo", sort_order: "sortOrder"),
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::Agents::AgentVariation,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::VariationDeleteParams} for more details.
        #
        # Deletes a variation from an agent
        #
        # @overload delete(agent_id, id, workspace_id: nil, request_options: {})
        #
        # @param agent_id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
        #
        # @param id [String] Variation ID. Accepts the canonical `agentvar_…` form or the `external_id:<value
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Cadenya::Models::Agents::VariationDeleteParams
        def delete(agent_id, id, params = {})
          parsed, options = Cadenya::Agents::VariationDeleteParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              @client.workspace_id
            end
          @client.request(
            method: :delete,
            path: ["v1/workspaces/%1$s/agents/%2$s/variations/%3$s", workspace_id, agent_id, id],
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::VariationAddAssignmentParams} for more details.
        #
        # Assigns a tool, tool set, or sub-agent to a variation. Exactly one target ID
        # must be set.
        #
        # @overload add_assignment(agent_id, variation_id, body:, workspace_id: nil, request_options: {})
        #
        # @param agent_id [String] Path param: Agent ID. Accepts the canonical `agent_…` form or the `external_id:<
        #
        # @param variation_id [String] Path param: Variation ID. Accepts the canonical `agentvar_…` form or the `extern
        #
        # @param body [Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolID, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestToolSetID, Cadenya::Models::Agents::AddAgentVariationAssignmentRequestSubAgentID] Body param: Attach a single tool, tool set, or sub-agent to a variation. Exactly
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Agents::VariationAssignmentTool, Cadenya::Models::Agents::VariationAssignmentToolSet, Cadenya::Models::Agents::VariationAssignmentAgent]
        #
        # @see Cadenya::Models::Agents::VariationAddAssignmentParams
        def add_assignment(agent_id, variation_id, params)
          parsed, options = Cadenya::Agents::VariationAddAssignmentParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              @client.workspace_id
            end
          @client.request(
            method: :post,
            path: [
              "v1/workspaces/%1$s/agents/%2$s/variations/%3$s/assignments",
              workspace_id,
              agent_id,
              variation_id
            ],
            body: parsed[:body],
            model: Cadenya::Agents::VariationAssignment,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::VariationAddMemoryLayerParams} for more details.
        #
        # Attaches a memory layer to a variation at a given position in the variation's
        # baseline memory cascade.
        #
        # @overload add_memory_layer(agent_id, variation_id, memory_layer_id:, workspace_id: nil, position: nil, request_options: {})
        #
        # @param agent_id [String] Path param: Agent ID. Accepts the canonical `agent_…` form or the `external_id:<
        #
        # @param variation_id [String] Path param: Variation ID. Accepts the canonical `agentvar_…` form or the `extern
        #
        # @param memory_layer_id [String] Body param: Layer to attach. Accepts the canonical `memlyr_…` form or the `exter
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param position [Integer] Body param: Position in the baseline cascade (lower = more specific). If
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Agents::VariationMemoryLayerAssignment]
        #
        # @see Cadenya::Models::Agents::VariationAddMemoryLayerParams
        def add_memory_layer(agent_id, variation_id, params)
          parsed, options = Cadenya::Agents::VariationAddMemoryLayerParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              @client.workspace_id
            end
          @client.request(
            method: :post,
            path: [
              "v1/workspaces/%1$s/agents/%2$s/variations/%3$s/memory_layer_assignments",
              workspace_id,
              agent_id,
              variation_id
            ],
            body: parsed,
            model: Cadenya::Agents::VariationMemoryLayerAssignment,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::VariationRemoveAssignmentParams} for more details.
        #
        # Detaches an assignment from a variation, identified by the assignment ID
        # returned when it was added.
        #
        # @overload remove_assignment(agent_id, variation_id, id, workspace_id: nil, request_options: {})
        #
        # @param agent_id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
        #
        # @param variation_id [String] Variation ID. Accepts the canonical `agentvar_…` form or the `external_id:<value
        #
        # @param id [String]
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Cadenya::Models::Agents::VariationRemoveAssignmentParams
        def remove_assignment(agent_id, variation_id, id, params = {})
          parsed, options = Cadenya::Agents::VariationRemoveAssignmentParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              @client.workspace_id
            end
          @client.request(
            method: :delete,
            path: [
              "v1/workspaces/%1$s/agents/%2$s/variations/%3$s/assignments/%4$s",
              workspace_id,
              agent_id,
              variation_id,
              id
            ],
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::VariationRemoveMemoryLayerParams} for more details.
        #
        # Detaches a memory layer assignment from a variation, identified by the
        # assignment id.
        #
        # @overload remove_memory_layer(agent_id, variation_id, id, workspace_id: nil, request_options: {})
        #
        # @param agent_id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
        #
        # @param variation_id [String] Variation ID. Accepts the canonical `agentvar_…` form or the `external_id:<value
        #
        # @param id [String]
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Cadenya::Models::Agents::VariationRemoveMemoryLayerParams
        def remove_memory_layer(agent_id, variation_id, id, params = {})
          parsed, options = Cadenya::Agents::VariationRemoveMemoryLayerParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              @client.workspace_id
            end
          @client.request(
            method: :delete,
            path: [
              "v1/workspaces/%1$s/agents/%2$s/variations/%3$s/memory_layer_assignments/%4$s",
              workspace_id,
              agent_id,
              variation_id,
              id
            ],
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::VariationUpdateMemoryLayerParams} for more details.
        #
        # Updates the position of a memory layer assignment on a variation.
        #
        # @overload update_memory_layer(agent_id, variation_id, id, workspace_id: nil, position: nil, request_options: {})
        #
        # @param agent_id [String] Path param: Agent ID. Accepts the canonical `agent_…` form or the `external_id:<
        #
        # @param variation_id [String] Path param: Variation ID. Accepts the canonical `agentvar_…` form or the `extern
        #
        # @param id [String] Path param
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param position [Integer] Body param: New position. Only field currently updatable on an assignment.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Agents::VariationMemoryLayerAssignment]
        #
        # @see Cadenya::Models::Agents::VariationUpdateMemoryLayerParams
        def update_memory_layer(agent_id, variation_id, id, params = {})
          parsed, options = Cadenya::Agents::VariationUpdateMemoryLayerParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              @client.workspace_id
            end
          @client.request(
            method: :patch,
            path: [
              "v1/workspaces/%1$s/agents/%2$s/variations/%3$s/memory_layer_assignments/%4$s",
              workspace_id,
              agent_id,
              variation_id,
              id
            ],
            body: parsed,
            model: Cadenya::Agents::VariationMemoryLayerAssignment,
            options: options
          )
        end

        # @api private
        #
        # @param client [Cadenya::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
