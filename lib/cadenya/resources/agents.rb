# frozen_string_literal: true

module Cadenya
  module Resources
    # Manage AI agents within a workspace. Agents define AI behavior and tool access.
    class Agents
      # Manage AI agents within a workspace. Agents define AI behavior and tool access.
      # @return [Cadenya::Resources::Agents::Feedback]
      attr_reader :feedback

      # Manage AI agents within a workspace. Agents define AI behavior and tool access.
      # @return [Cadenya::Resources::Agents::WebhookDeliveries]
      attr_reader :webhook_deliveries

      # Manage variations of an agent and their tool, sub-agent, and memory layer
      # assignments.
      # @return [Cadenya::Resources::Agents::Variations]
      attr_reader :variations

      # Manage recurring schedules attached to agents. Schedules trigger objectives on a
      # cadence defined by AgentScheduleSpec.Schedule.
      # @return [Cadenya::Resources::Agents::Schedules]
      attr_reader :schedules

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::AgentCreateParams} for more details.
      #
      # Creates a new agent in the workspace
      #
      # @overload create(workspace_id, metadata:, spec:, default_variation: nil, request_options: {})
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param metadata [Cadenya::Models::CreateResourceMetadata] CreateResourceMetadata contains the user-provided fields for creating
      #
      # @param spec [Cadenya::Models::AgentSpec] Agent specification (user-provided configuration)
      #
      # @param default_variation [Cadenya::Models::AgentCreateParams::DefaultVariation] Create agent variation request
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Agent]
      #
      # @see Cadenya::Models::AgentCreateParams
      def create(workspace_id, params)
        parsed, options = Cadenya::AgentCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/agents", workspace_id],
          body: parsed,
          model: Cadenya::Agent,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::AgentRetrieveParams} for more details.
      #
      # Retrieves an agent by ID from the workspace
      #
      # @overload retrieve(id, workspace_id:, request_options: {})
      #
      # @param id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Agent]
      #
      # @see Cadenya::Models::AgentRetrieveParams
      def retrieve(id, params)
        parsed, options = Cadenya::AgentRetrieveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/agents/%2$s", workspace_id, id],
          model: Cadenya::Agent,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::AgentUpdateParams} for more details.
      #
      # Updates an agent in the workspace
      #
      # @overload update(id, workspace_id:, metadata: nil, spec: nil, update_mask: nil, request_options: {})
      #
      # @param id [String] Path param: Agent ID. Accepts the canonical `agent_…` form or the `external_id:<
      #
      # @param workspace_id [String] Path param: Workspace ID.
      #
      # @param metadata [Cadenya::Models::UpdateResourceMetadata] Body param: UpdateResourceMetadata contains the user-provided fields for updatin
      #
      # @param spec [Cadenya::Models::AgentSpec] Body param: Agent specification (user-provided configuration)
      #
      # @param update_mask [String] Body param: Fields to update
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Agent]
      #
      # @see Cadenya::Models::AgentUpdateParams
      def update(id, params)
        parsed, options = Cadenya::AgentUpdateParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :patch,
          path: ["v1/workspaces/%1$s/agents/%2$s", workspace_id, id],
          body: parsed,
          model: Cadenya::Agent,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::AgentListParams} for more details.
      #
      # Lists all agents in the workspace
      #
      # @overload list(workspace_id, cursor: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, state: nil, variation_selection_mode: nil, request_options: {})
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param cursor [String] Pagination cursor from previous response
      #
      # @param include_info [Boolean] When true, the `info` field on each returned agent is populated. Requests
      #
      # @param limit [Integer] Maximum number of results to return
      #
      # @param prefix [String] Filter expression (query param: prefix)
      #
      # @param query [String] Free-form search query
      #
      # @param sort_order [String] Sort order for results (asc or desc by creation time)
      #
      # @param state [Symbol, Cadenya::Models::AgentListParams::State] Filter by agent lifecycle state
      #
      # @param variation_selection_mode [Symbol, Cadenya::Models::AgentListParams::VariationSelectionMode] Filter by variation selection mode
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Agent>]
      #
      # @see Cadenya::Models::AgentListParams
      def list(workspace_id, params = {})
        parsed, options = Cadenya::AgentListParams.dump_request(params)
        query = Cadenya::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["v1/workspaces/%1$s/agents", workspace_id],
          query: query.transform_keys(
            include_info: "includeInfo",
            sort_order: "sortOrder",
            variation_selection_mode: "variationSelectionMode"
          ),
          page: Cadenya::Internal::CursorPagination,
          model: Cadenya::Agent,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::AgentDeleteParams} for more details.
      #
      # Deletes an agent from the workspace
      #
      # @overload delete(id, workspace_id:, request_options: {})
      #
      # @param id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Cadenya::Models::AgentDeleteParams
      def delete(id, params)
        parsed, options = Cadenya::AgentDeleteParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :delete,
          path: ["v1/workspaces/%1$s/agents/%2$s", workspace_id, id],
          model: NilClass,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::AgentArchiveParams} for more details.
      #
      # Transitions an agent to STATE_ARCHIVED. Archived agents are hidden from list
      # results and cannot be used for objectives; active schedules are paused.
      #
      # @overload archive(id, workspace_id:, request_options: {})
      #
      # @param id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Agent]
      #
      # @see Cadenya::Models::AgentArchiveParams
      def archive(id, params)
        parsed, options = Cadenya::AgentArchiveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/agents/%2$s:archive", workspace_id, id],
          model: Cadenya::Agent,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::AgentPublishParams} for more details.
      #
      # Transitions an agent to STATE_PUBLISHED, making it available for objectives. The
      # agent must have at least one variation.
      #
      # @overload publish(id, workspace_id:, request_options: {})
      #
      # @param id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Agent]
      #
      # @see Cadenya::Models::AgentPublishParams
      def publish(id, params)
        parsed, options = Cadenya::AgentPublishParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/agents/%2$s:publish", workspace_id, id],
          model: Cadenya::Agent,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::AgentUnarchiveParams} for more details.
      #
      # Transitions an archived agent back to STATE_DRAFT. Publish the agent again to
      # make it available for objectives.
      #
      # @overload unarchive(id, workspace_id:, request_options: {})
      #
      # @param id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Agent]
      #
      # @see Cadenya::Models::AgentUnarchiveParams
      def unarchive(id, params)
        parsed, options = Cadenya::AgentUnarchiveParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/agents/%2$s:unarchive", workspace_id, id],
          model: Cadenya::Agent,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Cadenya::Models::AgentUnpublishParams} for more details.
      #
      # Transitions a published agent back to STATE_DRAFT. Active schedules for the
      # agent are paused until it is published again.
      #
      # @overload unpublish(id, workspace_id:, request_options: {})
      #
      # @param id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
      #
      # @param workspace_id [String] Workspace ID.
      #
      # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Cadenya::Models::Agent]
      #
      # @see Cadenya::Models::AgentUnpublishParams
      def unpublish(id, params)
        parsed, options = Cadenya::AgentUnpublishParams.dump_request(params)
        workspace_id =
          parsed.delete(:workspace_id) do
            raise ArgumentError.new("missing required path argument #{_1}")
          end
        @client.request(
          method: :post,
          path: ["v1/workspaces/%1$s/agents/%2$s:unpublish", workspace_id, id],
          model: Cadenya::Agent,
          options: options
        )
      end

      # @api private
      #
      # @param client [Cadenya::Client]
      def initialize(client:)
        @client = client
        @feedback = Cadenya::Resources::Agents::Feedback.new(client: client)
        @webhook_deliveries = Cadenya::Resources::Agents::WebhookDeliveries.new(client: client)
        @variations = Cadenya::Resources::Agents::Variations.new(client: client)
        @schedules = Cadenya::Resources::Agents::Schedules.new(client: client)
      end
    end
  end
end
