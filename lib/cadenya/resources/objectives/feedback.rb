# frozen_string_literal: true

module Cadenya
  module Resources
    class Objectives
      class Feedback
        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Objectives::FeedbackCreateParams} for more details.
        #
        # Submits feedback for an objective's execution. Feedback scores are used by the
        # agent variation scoring system to evaluate and rank variation performance.
        #
        # @overload create(objective_id, workspace_id:, data:, metadata:, request_options: {})
        #
        # @param objective_id [String] Path param: The ID of the objective. Supports "external_id:" prefix for external
        #
        # @param workspace_id [String] Path param
        #
        # @param data [Cadenya::Models::Objectives::ObjectiveFeedbackData] Body param
        #
        # @param metadata [Cadenya::Models::CreateOperationMetadata] Body param: CreateOperationMetadata contains the user-provided fields for creati
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Models::Objectives::ObjectiveFeedback]
        #
        # @see Cadenya::Models::Objectives::FeedbackCreateParams
        def create(objective_id, params)
          parsed, options = Cadenya::Objectives::FeedbackCreateParams.dump_request(params)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :post,
            path: ["v1/workspaces/%1$s/objectives/%2$s/feedback", workspace_id, objective_id],
            body: parsed,
            model: Cadenya::Objectives::ObjectiveFeedback,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Cadenya::Models::Objectives::FeedbackListParams} for more details.
        #
        # Lists all feedback submitted for an objective
        #
        # @overload list(objective_id, workspace_id:, cursor: nil, limit: nil, request_options: {})
        #
        # @param objective_id [String] Path param: The ID of the objective. Supports "external_id:" prefix for external
        #
        # @param workspace_id [String] Path param
        #
        # @param cursor [String] Query param: Pagination cursor from previous response
        #
        # @param limit [Integer] Query param: Maximum number of results to return
        #
        # @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Cadenya::Internal::CursorPagination<Cadenya::Models::Objectives::ObjectiveFeedback>]
        #
        # @see Cadenya::Models::Objectives::FeedbackListParams
        def list(objective_id, params)
          parsed, options = Cadenya::Objectives::FeedbackListParams.dump_request(params)
          query = Cadenya::Internal::Util.encode_query_params(parsed)
          workspace_id =
            parsed.delete(:workspace_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          @client.request(
            method: :get,
            path: ["v1/workspaces/%1$s/objectives/%2$s/feedback", workspace_id, objective_id],
            query: query,
            page: Cadenya::Internal::CursorPagination,
            model: Cadenya::Objectives::ObjectiveFeedback,
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
