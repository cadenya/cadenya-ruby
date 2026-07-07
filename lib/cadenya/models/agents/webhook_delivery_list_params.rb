# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::WebhookDeliveries#list
      class WebhookDeliveryListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!attribute agent_id
        #
        #   @return [String]
        required :agent_id, String

        # @!attribute cursor
        #   Pagination cursor from previous response
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute event_type
        #   Optional filter by event type
        #
        #   @return [Symbol, Cadenya::Models::Agents::WebhookDeliveryListParams::EventType, nil]
        optional :event_type, enum: -> { Cadenya::Agents::WebhookDeliveryListParams::EventType }

        # @!attribute limit
        #   Maximum number of results to return
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute objective_id
        #   Optional filter by objective ID
        #
        #   @return [String, nil]
        optional :objective_id, String

        # @!method initialize(workspace_id:, agent_id:, cursor: nil, event_type: nil, limit: nil, objective_id: nil, request_options: {})
        #   @param workspace_id [String]
        #
        #   @param agent_id [String]
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param event_type [Symbol, Cadenya::Models::Agents::WebhookDeliveryListParams::EventType] Optional filter by event type
        #
        #   @param limit [Integer] Maximum number of results to return
        #
        #   @param objective_id [String] Optional filter by objective ID
        #
        #   @param request_options [Cadenya::RequestOptions, Hash{Symbol=>Object}]

        # Optional filter by event type
        module EventType
          extend Cadenya::Internal::Type::Enum

          OBJECTIVE_EVENT_TYPE_UNSPECIFIED = :OBJECTIVE_EVENT_TYPE_UNSPECIFIED
          OBJECTIVE_EVENT_TYPE_USER_MESSAGE = :OBJECTIVE_EVENT_TYPE_USER_MESSAGE
          OBJECTIVE_EVENT_TYPE_TOOL_APPROVAL_REQUESTED = :OBJECTIVE_EVENT_TYPE_TOOL_APPROVAL_REQUESTED
          OBJECTIVE_EVENT_TYPE_TOOL_APPROVED = :OBJECTIVE_EVENT_TYPE_TOOL_APPROVED
          OBJECTIVE_EVENT_TYPE_TOOL_DENIED = :OBJECTIVE_EVENT_TYPE_TOOL_DENIED
          OBJECTIVE_EVENT_TYPE_TOOL_CALLED = :OBJECTIVE_EVENT_TYPE_TOOL_CALLED
          OBJECTIVE_EVENT_TYPE_ERROR = :OBJECTIVE_EVENT_TYPE_ERROR
          OBJECTIVE_EVENT_TYPE_ASSISTANT_MESSAGE = :OBJECTIVE_EVENT_TYPE_ASSISTANT_MESSAGE
          OBJECTIVE_EVENT_TYPE_TOOL_RESULT = :OBJECTIVE_EVENT_TYPE_TOOL_RESULT
          OBJECTIVE_EVENT_TYPE_TOOL_ERROR = :OBJECTIVE_EVENT_TYPE_TOOL_ERROR
          OBJECTIVE_EVENT_TYPE_CONTEXT_WINDOW_COMPACTED = :OBJECTIVE_EVENT_TYPE_CONTEXT_WINDOW_COMPACTED
          OBJECTIVE_EVENT_TYPE_MEMORY_READ = :OBJECTIVE_EVENT_TYPE_MEMORY_READ
          OBJECTIVE_EVENT_TYPE_CANCELLED = :OBJECTIVE_EVENT_TYPE_CANCELLED
          OBJECTIVE_EVENT_TYPE_SUB_AGENT_SPAWNED = :OBJECTIVE_EVENT_TYPE_SUB_AGENT_SPAWNED
          OBJECTIVE_EVENT_TYPE_SUB_AGENT_UPDATED = :OBJECTIVE_EVENT_TYPE_SUB_AGENT_UPDATED
          OBJECTIVE_EVENT_TYPE_FINALIZED = :OBJECTIVE_EVENT_TYPE_FINALIZED
          OBJECTIVE_EVENT_TYPE_NOTICE = :OBJECTIVE_EVENT_TYPE_NOTICE
          OBJECTIVE_EVENT_TYPE_TIMED_OUT = :OBJECTIVE_EVENT_TYPE_TIMED_OUT

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
