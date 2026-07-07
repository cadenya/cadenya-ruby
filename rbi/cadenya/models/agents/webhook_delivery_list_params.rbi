# typed: strong

module Cadenya
  module Models
    module Agents
      class WebhookDeliveryListParams < Cadenya::Internal::Type::BaseModel
        extend Cadenya::Internal::Type::RequestParameters::Converter
        include Cadenya::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Cadenya::Agents::WebhookDeliveryListParams,
              Cadenya::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :workspace_id

        sig { returns(String) }
        attr_accessor :agent_id

        # Pagination cursor from previous response
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Optional filter by event type
        sig do
          returns(
            T.nilable(
              Cadenya::Agents::WebhookDeliveryListParams::EventType::OrSymbol
            )
          )
        end
        attr_reader :event_type

        sig do
          params(
            event_type:
              Cadenya::Agents::WebhookDeliveryListParams::EventType::OrSymbol
          ).void
        end
        attr_writer :event_type

        # Maximum number of results to return
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Optional filter by objective ID
        sig { returns(T.nilable(String)) }
        attr_reader :objective_id

        sig { params(objective_id: String).void }
        attr_writer :objective_id

        sig do
          params(
            workspace_id: String,
            agent_id: String,
            cursor: String,
            event_type:
              Cadenya::Agents::WebhookDeliveryListParams::EventType::OrSymbol,
            limit: Integer,
            objective_id: String,
            request_options: Cadenya::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          workspace_id:,
          agent_id:,
          # Pagination cursor from previous response
          cursor: nil,
          # Optional filter by event type
          event_type: nil,
          # Maximum number of results to return
          limit: nil,
          # Optional filter by objective ID
          objective_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              workspace_id: String,
              agent_id: String,
              cursor: String,
              event_type:
                Cadenya::Agents::WebhookDeliveryListParams::EventType::OrSymbol,
              limit: Integer,
              objective_id: String,
              request_options: Cadenya::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Optional filter by event type
        module EventType
          extend Cadenya::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Cadenya::Agents::WebhookDeliveryListParams::EventType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OBJECTIVE_EVENT_TYPE_UNSPECIFIED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_UNSPECIFIED,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_USER_MESSAGE =
            T.let(
              :OBJECTIVE_EVENT_TYPE_USER_MESSAGE,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TOOL_APPROVAL_REQUESTED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TOOL_APPROVAL_REQUESTED,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TOOL_APPROVED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TOOL_APPROVED,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TOOL_DENIED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TOOL_DENIED,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TOOL_CALLED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TOOL_CALLED,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_ERROR =
            T.let(
              :OBJECTIVE_EVENT_TYPE_ERROR,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_ASSISTANT_MESSAGE =
            T.let(
              :OBJECTIVE_EVENT_TYPE_ASSISTANT_MESSAGE,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TOOL_RESULT =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TOOL_RESULT,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TOOL_ERROR =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TOOL_ERROR,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_CONTEXT_WINDOW_COMPACTED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_CONTEXT_WINDOW_COMPACTED,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_MEMORY_READ =
            T.let(
              :OBJECTIVE_EVENT_TYPE_MEMORY_READ,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_CANCELLED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_CANCELLED,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_SUB_AGENT_SPAWNED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_SUB_AGENT_SPAWNED,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_SUB_AGENT_UPDATED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_SUB_AGENT_UPDATED,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_FINALIZED =
            T.let(
              :OBJECTIVE_EVENT_TYPE_FINALIZED,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_NOTICE =
            T.let(
              :OBJECTIVE_EVENT_TYPE_NOTICE,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )
          OBJECTIVE_EVENT_TYPE_TIMED_OUT =
            T.let(
              :OBJECTIVE_EVENT_TYPE_TIMED_OUT,
              Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Cadenya::Agents::WebhookDeliveryListParams::EventType::TaggedSymbol
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
