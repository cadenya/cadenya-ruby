# frozen_string_literal: true

module Cadenya
  module Resources
    class Agents
      # Manage recurring schedules attached to agents. Schedules trigger objectives on a
      # cadence defined by AgentScheduleSpec.Schedule.
      class Schedules
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::ScheduleCreateParams} for more details.
        #
        # Creates a new schedule for an agent
        #
        # @overload create(agent_id, workspace_id:, metadata:, spec:, request_options: {})
        #
        # @param agent_id [String] Path param: Agent ID. Accepts the canonical `agent_…` form or the `external_id:<
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param metadata [Cadenya::Models::CreateResourceMetadata] Body param: CreateResourceMetadata contains the user-provided fields for creatin
        #
        # @param spec [Cadenya::Models::Agents::AgentScheduleSpec] Body param: AgentScheduleSpec is the user-provided configuration for a schedule.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Agents::AgentSchedule]
        #
        # @see Cadenya::Models::Agents::ScheduleCreateParams
        def create(agent_id, params)
          parsed, options = Cadenya::Agents::ScheduleCreateParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["v1/workspaces/%1$s/agents/%2$s/schedules", workspace_id, agent_id],
            body: parsed,
            model: Cadenya::Agents::AgentSchedule,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::ScheduleRetrieveParams} for more details.
        #
        # Retrieves a schedule by ID from an agent
        #
        # @overload retrieve(id, workspace_id:, agent_id:, request_options: {})
        #
        # @param id [String] Schedule ID. Accepts the canonical `as_…` form or the `external_id:<value>` form
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param agent_id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Agents::AgentSchedule]
        #
        # @see Cadenya::Models::Agents::ScheduleRetrieveParams
        def retrieve(id, params)
          parsed, options = Cadenya::Agents::ScheduleRetrieveParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          agent_id =
            parsed.delete(:agent_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/agents/%2$s/schedules/%3$s", workspace_id, agent_id, id],
            model: Cadenya::Agents::AgentSchedule,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::ScheduleUpdateParams} for more details.
        #
        # Updates a schedule for an agent
        #
        # @overload update(id, workspace_id:, agent_id:, metadata: nil, spec: nil, update_mask: nil, request_options: {})
        #
        # @param id [String] Path param: Schedule ID. Accepts the canonical `as_…` form or the `external_id:<
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param agent_id [String] Path param: Agent ID. Accepts the canonical `agent_…` form or the `external_id:<
        #
        # @param metadata [Cadenya::Models::UpdateResourceMetadata] Body param: UpdateResourceMetadata contains the user-provided fields for updatin
        #
        # @param spec [Cadenya::Models::Agents::AgentScheduleSpec] Body param: AgentScheduleSpec is the user-provided configuration for a schedule.
        #
        # @param update_mask [String] Body param: Fields to update.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Agents::AgentSchedule]
        #
        # @see Cadenya::Models::Agents::ScheduleUpdateParams
        def update(id, params)
          parsed, options = Cadenya::Agents::ScheduleUpdateParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          agent_id =
            parsed.delete(:agent_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :patch,
            path: ["v1/workspaces/%1$s/agents/%2$s/schedules/%3$s", workspace_id, agent_id, id],
            body: parsed,
            model: Cadenya::Agents::AgentSchedule,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::ScheduleListParams} for more details.
        #
        # Lists all schedules for an agent
        #
        # @overload list(agent_id, workspace_id:, bundle_key: nil, cursor: nil, include_info: nil, limit: nil, prefix: nil, query: nil, sort_order: nil, request_options: {})
        #
        # @param agent_id [String] Path param: Agent ID. Accepts the canonical `agent_…` form or the `external_id:<
        #
        # @param workspace_id [String] Path param: Workspace ID.
        #
        # @param bundle_key [String] Query param: Filter by bundle_key — return only resources owned by this bundle.
        #
        # @param cursor [String] Query param: Pagination cursor from previous response.
        #
        # @param include_info [Boolean] Query param: When true, the `info` field on each returned schedule is populated.
        #
        # @param limit [Integer] Query param: Maximum number of results to return.
        #
        # @param prefix [String] Query param: Filter expression (query param: prefix).
        #
        # @param query [String] Query param: Free-form search query.
        #
        # @param sort_order [String] Query param: Sort order for results (asc or desc by creation time).
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Agents::AgentSchedule>]
        #
        # @see Cadenya::Models::Agents::ScheduleListParams
        def list(agent_id, params)
          parsed, options = Cadenya::Agents::ScheduleListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/agents/%2$s/schedules", workspace_id, agent_id],
            query: query.transform_keys(
              bundle_key: "bundleKey",
              include_info: "includeInfo",
              sort_order: "sortOrder"
            ),
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::Agents::AgentSchedule,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::ScheduleDeleteParams} for more details.
        #
        # Deletes a schedule from an agent
        #
        # @overload delete(id, workspace_id:, agent_id:, request_options: {})
        #
        # @param id [String] Schedule ID. Accepts the canonical `as_…` form or the `external_id:<value>` form
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param agent_id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Cadenya::Models::Agents::ScheduleDeleteParams
        def delete(id, params)
          parsed, options = Cadenya::Agents::ScheduleDeleteParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          agent_id =
            parsed.delete(:agent_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :delete,
            path: ["v1/workspaces/%1$s/agents/%2$s/schedules/%3$s", workspace_id, agent_id, id],
            model: NilClass,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::ScheduleArchiveParams} for more details.
        #
        # Transitions a schedule to STATE_ARCHIVED and removes its underlying timer.
        # Archiving is terminal: archived schedules never fire and cannot be reactivated;
        # create a new schedule instead.
        #
        # @overload archive(id, workspace_id:, agent_id:, request_options: {})
        #
        # @param id [String] Schedule ID. Accepts the canonical `as_…` form or the `external_id:<value>` form
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param agent_id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Agents::AgentSchedule]
        #
        # @see Cadenya::Models::Agents::ScheduleArchiveParams
        def archive(id, params)
          parsed, options = Cadenya::Agents::ScheduleArchiveParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          agent_id =
            parsed.delete(:agent_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["v1/workspaces/%1$s/agents/%2$s/schedules/%3$s:archive", workspace_id, agent_id, id],
            model: Cadenya::Agents::AgentSchedule,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::SchedulePauseParams} for more details.
        #
        # Transitions a schedule to STATE_PAUSED. Paused schedules retain history but do
        # not fire.
        #
        # @overload pause(id, workspace_id:, agent_id:, request_options: {})
        #
        # @param id [String] Schedule ID. Accepts the canonical `as_…` form or the `external_id:<value>` form
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param agent_id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Agents::AgentSchedule]
        #
        # @see Cadenya::Models::Agents::SchedulePauseParams
        def pause(id, params)
          parsed, options = Cadenya::Agents::SchedulePauseParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          agent_id =
            parsed.delete(:agent_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["v1/workspaces/%1$s/agents/%2$s/schedules/%3$s:pause", workspace_id, agent_id, id],
            model: Cadenya::Agents::AgentSchedule,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Agents::ScheduleResumeParams} for more details.
        #
        # Transitions a paused schedule back to STATE_ACTIVE so it fires on its cadence
        # again. Archived schedules cannot be resumed.
        #
        # @overload resume(id, workspace_id:, agent_id:, request_options: {})
        #
        # @param id [String] Schedule ID. Accepts the canonical `as_…` form or the `external_id:<value>` form
        #
        # @param workspace_id [String] Workspace ID.
        #
        # @param agent_id [String] Agent ID. Accepts the canonical `agent_…` form or the `external_id:<value>` form
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Agents::AgentSchedule]
        #
        # @see Cadenya::Models::Agents::ScheduleResumeParams
        def resume(id, params)
          parsed, options = Cadenya::Agents::ScheduleResumeParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          agent_id =
            parsed.delete(:agent_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["v1/workspaces/%1$s/agents/%2$s/schedules/%3$s:resume", workspace_id, agent_id, id],
            model: Cadenya::Agents::AgentSchedule,
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
