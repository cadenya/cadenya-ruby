# typed: strong

module Cadenya
  module Models
    class UnwrapWebhookEvent < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Cadenya::UnwrapWebhookEvent, Cadenya::Internal::AnyHash)
        end

      # The webhook data payload with flat top-level keys for agent, variation,
      # objective, and event.
      sig { returns(Cadenya::UnwrapWebhookEvent::Data) }
      attr_reader :data

      sig { params(data: Cadenya::UnwrapWebhookEvent::Data::OrHash).void }
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
          data: Cadenya::UnwrapWebhookEvent::Data::OrHash,
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
            data: Cadenya::UnwrapWebhookEvent::Data,
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
            T.any(Cadenya::UnwrapWebhookEvent::Data, Cadenya::Internal::AnyHash)
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

        sig { returns(Cadenya::ObjectiveEvent) }
        attr_reader :objective_event

        sig { params(objective_event: Cadenya::ObjectiveEvent::OrHash).void }
        attr_writer :objective_event

        # The webhook data payload with flat top-level keys for agent, variation,
        # objective, and event.
        sig do
          params(
            agent: Cadenya::ResourceMetadata::OrHash,
            agent_variation: Cadenya::ResourceMetadata::OrHash,
            objective: Cadenya::OperationMetadata::OrHash,
            objective_event: Cadenya::ObjectiveEvent::OrHash
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
              objective_event: Cadenya::ObjectiveEvent
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
