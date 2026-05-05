# typed: strong

module Cadenya
  module Models
    module Agents
      class WebhookDeliveryData < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::WebhookDeliveryData,
              Cadenya::Internal::AnyHash
            )
          end

        # Related resources
        sig { returns(String) }
        attr_accessor :agent_id

        sig { returns(Integer) }
        attr_accessor :attempt_count

        # The type of objective event that triggered this webhook delivery
        sig do
          returns(Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol)
        end
        attr_accessor :event_type

        # Response details. The response body is not retained.
        sig { returns(Integer) }
        attr_accessor :http_status_code

        sig { returns(Time) }
        attr_accessor :last_attempt_at

        sig { returns(Integer) }
        attr_accessor :latency_ms

        sig { returns(String) }
        attr_accessor :objective_event_id

        sig { returns(String) }
        attr_accessor :objective_id

        # Content length of the response body in bytes
        sig { returns(String) }
        attr_accessor :response_content_length

        sig do
          returns(Cadenya::Agents::WebhookDeliveryData::Status::TaggedSymbol)
        end
        attr_accessor :status

        sig { returns(String) }
        attr_accessor :webhook_id

        # Webhook delivery details
        sig { returns(String) }
        attr_accessor :webhook_url

        sig { returns(T.nilable(String)) }
        attr_reader :error_message

        sig { params(error_message: String).void }
        attr_writer :error_message

        # Response headers received from the webhook endpoint
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :response_headers

        sig { params(response_headers: T::Hash[Symbol, String]).void }
        attr_writer :response_headers

        sig do
          params(
            agent_id: String,
            attempt_count: Integer,
            event_type:
              Cadenya::Agents::WebhookDeliveryData::EventType::OrSymbol,
            http_status_code: Integer,
            last_attempt_at: Time,
            latency_ms: Integer,
            objective_event_id: String,
            objective_id: String,
            response_content_length: String,
            status: Cadenya::Agents::WebhookDeliveryData::Status::OrSymbol,
            webhook_id: String,
            webhook_url: String,
            error_message: String,
            response_headers: T::Hash[Symbol, String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Related resources
          agent_id:,
          attempt_count:,
          # The type of objective event that triggered this webhook delivery
          event_type:,
          # Response details. The response body is not retained.
          http_status_code:,
          last_attempt_at:,
          latency_ms:,
          objective_event_id:,
          objective_id:,
          # Content length of the response body in bytes
          response_content_length:,
          status:,
          webhook_id:,
          # Webhook delivery details
          webhook_url:,
          error_message: nil,
          # Response headers received from the webhook endpoint
          response_headers: nil
        )
        end

        sig do
          override.returns(
            {
              agent_id: String,
              attempt_count: Integer,
              event_type:
                Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol,
              http_status_code: Integer,
              last_attempt_at: Time,
              latency_ms: Integer,
              objective_event_id: String,
              objective_id: String,
              response_content_length: String,
              status:
                Cadenya::Agents::WebhookDeliveryData::Status::TaggedSymbol,
              webhook_id: String,
              webhook_url: String,
              error_message: String,
              response_headers: T::Hash[Symbol, String]
            }
          )
        end
        def to_hash
        end

        # The type of objective event that triggered this webhook delivery
        module EventType
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::Agents::WebhookDeliveryData::EventType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OBJECTIVE_EVENT_TYPE_UNSPECIFIED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_UNSPECIFIED,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_USER_MESSAGE =
            T.let(
              :OBJECTIVE_EVENT_TYPE_USER_MESSAGE,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TOOL_APPROVAL_REQUESTED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TOOL_APPROVAL_REQUESTED,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TOOL_APPROVED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TOOL_APPROVED,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TOOL_DENIED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TOOL_DENIED,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TOOL_CALLED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TOOL_CALLED,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_SUB_OBJECTIVE_CREATED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_SUB_OBJECTIVE_CREATED,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_ERROR =
            T.let(
              :OBJECTIVE_EVENT_TYPE_ERROR,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_ASSISTANT_MESSAGE =
            T.let(
              :OBJECTIVE_EVENT_TYPE_ASSISTANT_MESSAGE,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TOOL_RESULT =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TOOL_RESULT,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TOOL_ERROR =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TOOL_ERROR,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_CONTEXT_WINDOW_COMPACTED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_CONTEXT_WINDOW_COMPACTED,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_MEMORY_READ =
            T.let(
              :OBJECTIVE_EVENT_TYPE_MEMORY_READ,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_CANCELLED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_CANCELLED,
              Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Agents::WebhookDeliveryData::EventType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Status
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Cadenya::Agents::WebhookDeliveryData::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WEBHOOK_DELIVERY_STATUS_UNSPECIFIED =
            T.let(
              :WEBHOOK_DELIVERY_STATUS_UNSPECIFIED,
              Cadenya::Agents::WebhookDeliveryData::Status::TaggedSymbol
            )
          WEBHOOK_DELIVERY_STATUS_PENDING =
            T.let(
              :WEBHOOK_DELIVERY_STATUS_PENDING,
              Cadenya::Agents::WebhookDeliveryData::Status::TaggedSymbol
            )
          WEBHOOK_DELIVERY_STATUS_COMPLETED =
            T.let(
              :WEBHOOK_DELIVERY_STATUS_COMPLETED,
              Cadenya::Agents::WebhookDeliveryData::Status::TaggedSymbol
            )
          WEBHOOK_DELIVERY_STATUS_FAILED =
            T.let(
              :WEBHOOK_DELIVERY_STATUS_FAILED,
              Cadenya::Agents::WebhookDeliveryData::Status::TaggedSymbol
            )
          WEBHOOK_DELIVERY_STATUS_DISABLED =
            T.let(
              :WEBHOOK_DELIVERY_STATUS_DISABLED,
              Cadenya::Agents::WebhookDeliveryData::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Agents::WebhookDeliveryData::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
