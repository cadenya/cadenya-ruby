# frozen_string_literal: true

module Cadenya
  module Resources
    class Objectives
      class Tasks
        # Retrieves a task by ID from an objective
        #
        # @overload retrieve(id, workspace_id:, objective_id:, request_options: {})
        #
        # @param id [String] Task ID
        #
        # @param workspace_id [String]
        #
        # @param objective_id [String] The ID of the objective. Supports "external_id:" prefix for external IDs.
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Objectives::ObjectiveTask]
        #
        # @see Cadenya::Models::Objectives::TaskRetrieveParams
        def retrieve(id, params)
          parsed, options = Cadenya::Objectives::TaskRetrieveParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          objective_id =
            parsed.delete(:objective_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/objectives/%2$s/tasks/%3$s", workspace_id, objective_id, id],
            model: Cadenya::Objectives::ObjectiveTask,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Objectives::TaskListParams} for more details.
        #
        # Lists all tasks for an objective
        #
        # @overload list(objective_id, workspace_id:, cursor: nil, limit: nil, sort_order: nil, request_options: {})
        #
        # @param objective_id [String] Path param: The ID of the objective. Supports "external_id:" prefix for external
        #
        # @param workspace_id [String] Path param
        #
        # @param cursor [String] Query param: Pagination cursor from previous response
        #
        # @param limit [Integer] Query param: Maximum number of results to return
        #
        # @param sort_order [String] Query param: Sort order for results
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Objectives::ObjectiveTask>]
        #
        # @see Cadenya::Models::Objectives::TaskListParams
        def list(objective_id, params)
          parsed, options = Cadenya::Objectives::TaskListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/objectives/%2$s/tasks", workspace_id, objective_id],
            query: query.transform_keys(sort_order: "sortOrder"),
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::Objectives::ObjectiveTask,
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
