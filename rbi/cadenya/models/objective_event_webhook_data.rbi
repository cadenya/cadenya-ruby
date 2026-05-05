# typed: strong

module Cadenya
  module Models
    class ObjectiveEventWebhookData < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::ObjectiveEventWebhookData, Cadenya::Internal::AnyHash)
        end

      # The webhook data payload with flat top-level keys for agent, variation,
      # objective, and event.
      sig { returns(Cadenya::ObjectiveEventWebhookData::Data) }
      attr_reader :data

      sig do
        params(data: Cadenya::ObjectiveEventWebhookData::Data::OrHash).void
      end
      attr_writer :data

      sig { returns(Time) }
      attr_accessor :timestamp

      # The event type, prefixed with objective_event. (e.g.,
      # objective_event.tool_result)
      sig { returns(String) }
      attr_accessor :type

      # The envelope for an objective event webhook delivery. Contains timestamp, event
      # type, and the webhook data payload.
      sig do
        params(
          data: Cadenya::ObjectiveEventWebhookData::Data::OrHash,
          timestamp: Time,
          type: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The webhook data payload with flat top-level keys for agent, variation,
        # objective, and event.
        data:,
        timestamp:,
        # The event type, prefixed with objective_event. (e.g.,
        # objective_event.tool_result)
        type:
      )
      end

      sig do
        override.returns(
          {
            data: Cadenya::ObjectiveEventWebhookData::Data,
            timestamp: Time,
            type: String
          }
        )
      end
      def to_hash
      end

      class Data < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Cadenya::ObjectiveEventWebhookData::Data,
              Cadenya::Internal::AnyHash
            )
          end

        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        sig { returns(Cadenya::ResourceMetadata) }
        attr_reader :agent

        sig { params(agent: Cadenya::ResourceMetadata::OrHash).void }
        attr_writer :agent

        # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        sig { returns(Cadenya::ResourceMetadata) }
        attr_reader :agent_variation

        sig { params(agent_variation: Cadenya::ResourceMetadata::OrHash).void }
        attr_writer :agent_variation

        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        sig { returns(Cadenya::OperationMetadata) }
        attr_reader :objective

        sig { params(objective: Cadenya::OperationMetadata::OrHash).void }
        attr_writer :objective

        sig do
          returns(Cadenya::ObjectiveEventWebhookData::Data::ObjectiveEvent)
        end
        attr_reader :objective_event

        sig do
          params(
            objective_event:
              Cadenya::ObjectiveEventWebhookData::Data::ObjectiveEvent::OrHash
          ).void
        end
        attr_writer :objective_event

        # The webhook data payload with flat top-level keys for agent, variation,
        # objective, and event.
        sig do
          params(
            agent: Cadenya::ResourceMetadata::OrHash,
            agent_variation: Cadenya::ResourceMetadata::OrHash,
            objective: Cadenya::OperationMetadata::OrHash,
            objective_event:
              Cadenya::ObjectiveEventWebhookData::Data::ObjectiveEvent::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          agent:,
          # Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
          agent_variation:,
          # Metadata for ephemeral operations and activities (e.g., objectives, executions,
          # runs)
          objective:,
          objective_event:
        )
        end

        sig do
          override.returns(
            {
              agent: Cadenya::ResourceMetadata,
              agent_variation: Cadenya::ResourceMetadata,
              objective: Cadenya::OperationMetadata,
              objective_event:
                Cadenya::ObjectiveEventWebhookData::Data::ObjectiveEvent
            }
          )
        end
        def to_hash
        end

        class ObjectiveEvent < Cadenya::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Cadenya::ObjectiveEventWebhookData::Data::ObjectiveEvent,
                Cadenya::Internal::AnyHash
              )
            end

          sig { returns(Cadenya::ObjectiveEventData) }
          attr_reader :data

          sig { params(data: Cadenya::ObjectiveEventData::OrHash).void }
          attr_writer :data

          # Metadata for ephemeral operations and activities (e.g., objectives, executions,
          # runs)
          sig { returns(Cadenya::OperationMetadata) }
          attr_reader :metadata

          sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
          attr_writer :metadata

          sig { returns(T.nilable(String)) }
          attr_reader :context_window_id

          sig { params(context_window_id: String).void }
          attr_writer :context_window_id

          sig { returns(T.nilable(Cadenya::ObjectiveEventInfo)) }
          attr_reader :info

          sig { params(info: Cadenya::ObjectiveEventInfo::OrHash).void }
          attr_writer :info

          sig do
            params(
              data: Cadenya::ObjectiveEventData::OrHash,
              metadata: Cadenya::OperationMetadata::OrHash,
              context_window_id: String,
              info: Cadenya::ObjectiveEventInfo::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            data:,
            # Metadata for ephemeral operations and activities (e.g., objectives, executions,
            # runs)
            metadata:,
            context_window_id: nil,
            info: nil
          )
          end

          sig do
            override.returns(
              {
                data: Cadenya::ObjectiveEventData,
                metadata: Cadenya::OperationMetadata,
                context_window_id: String,
                info: Cadenya::ObjectiveEventInfo
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
