# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      class WebhookDeliveryData < Cadenya::Internal::Type::BaseModel
        # @!attribute agent_id
        #   Related resources
        #
        #   @return [String]
        required :agent_id, String, api_name: :agentId

        # @!attribute attempt_count
        #
        #   @return [Integer]
        required :attempt_count, Integer, api_name: :attemptCount

        # @!attribute event_type
        #   The type of objective event that triggered this webhook delivery
        #
        #   @return [Symbol, Cadenya::Models::Agents::WebhookDeliveryData::EventType]
        required :event_type,
                 enum: -> {
                   Cadenya::Agents::WebhookDeliveryData::EventType
                 },
                 api_name: :eventType

        # @!attribute http_status_code
        #   Response details. The response body is not retained.
        #
        #   @return [Integer]
        required :http_status_code, Integer, api_name: :httpStatusCode

        # @!attribute last_attempt_at
        #
        #   @return [Time]
        required :last_attempt_at, Time, api_name: :lastAttemptAt

        # @!attribute latency_ms
        #
        #   @return [Integer]
        required :latency_ms, Integer, api_name: :latencyMs

        # @!attribute objective_event_id
        #
        #   @return [String]
        required :objective_event_id, String, api_name: :objectiveEventId

        # @!attribute objective_id
        #
        #   @return [String]
        required :objective_id, String, api_name: :objectiveId

        # @!attribute response_content_length
        #   Content length of the response body in bytes
        #
        #   @return [String]
        required :response_content_length, String, api_name: :responseContentLength

        # @!attribute status
        #
        #   @return [Symbol, Cadenya::Models::Agents::WebhookDeliveryData::Status]
        required :status, enum: -> { Cadenya::Agents::WebhookDeliveryData::Status }

        # @!attribute webhook_id
        #
        #   @return [String]
        required :webhook_id, String, api_name: :webhookId

        # @!attribute webhook_url
        #   Webhook delivery details
        #
        #   @return [String]
        required :webhook_url, String, api_name: :webhookUrl

        # @!attribute error_message
        #
        #   @return [String, nil]
        optional :error_message, String, api_name: :errorMessage

        # @!attribute response_headers
        #   Response headers received from the webhook endpoint
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :response_headers, Cadenya::Internal::Type::HashOf[String], api_name: :responseHeaders

        # @!method initialize(agent_id:, attempt_count:, event_type:, http_status_code:, last_attempt_at:, latency_ms:, objective_event_id:, objective_id:, response_content_length:, status:, webhook_id:, webhook_url:, error_message: nil, response_headers: nil)
        #   @param agent_id [String] Related resources
        #
        #   @param attempt_count [Integer]
        #
        #   @param event_type [Symbol, Cadenya::Models::Agents::WebhookDeliveryData::EventType] The type of objective event that triggered this webhook delivery
        #
        #   @param http_status_code [Integer] Response details. The response body is not retained.
        #
        #   @param last_attempt_at [Time]
        #
        #   @param latency_ms [Integer]
        #
        #   @param objective_event_id [String]
        #
        #   @param objective_id [String]
        #
        #   @param response_content_length [String] Content length of the response body in bytes
        #
        #   @param status [Symbol, Cadenya::Models::Agents::WebhookDeliveryData::Status]
        #
        #   @param webhook_id [String]
        #
        #   @param webhook_url [String] Webhook delivery details
        #
        #   @param error_message [String]
        #
        #   @param response_headers [Hash{Symbol=>String}] Response headers received from the webhook endpoint

        # The type of objective event that triggered this webhook delivery
        #
        # @see Cadenya::Models::Agents::WebhookDeliveryData#event_type
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
          OBJECTIVE_EVENT_TYPE_REASONING = :OBJECTIVE_EVENT_TYPE_REASONING

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Cadenya::Models::Agents::WebhookDeliveryData#status
        module Status
          extend Cadenya::Internal::Type::Enum

          WEBHOOK_DELIVERY_STATUS_UNSPECIFIED = :WEBHOOK_DELIVERY_STATUS_UNSPECIFIED
          WEBHOOK_DELIVERY_STATUS_PENDING = :WEBHOOK_DELIVERY_STATUS_PENDING
          WEBHOOK_DELIVERY_STATUS_COMPLETED = :WEBHOOK_DELIVERY_STATUS_COMPLETED
          WEBHOOK_DELIVERY_STATUS_FAILED = :WEBHOOK_DELIVERY_STATUS_FAILED
          WEBHOOK_DELIVERY_STATUS_DISABLED = :WEBHOOK_DELIVERY_STATUS_DISABLED

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
