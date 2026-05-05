# frozen_string_literal: true

module Cadenya
  module Models
    class UnwrapWebhookEvent < Cadenya::Internal::Type::BaseModel
      # @!attribute data
      #   The webhook data payload with flat top-level keys for agent, variation,
      #   objective, and event.
      #
      #   @return [Cadenya::Models::UnwrapWebhookEvent::Data]
      required :data, -> { Cadenya::UnwrapWebhookEvent::Data }

      # @!attribute timestamp
      #
      #   @return [Time]
      required :timestamp, Time

      # @!attribute type
      #   The event type, prefixed with objective_event. (e.g.,
      #   objective_event.tool_result)
      #
      #   @return [String]
      required :type, String

      # @!method initialize(data:, timestamp:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::UnwrapWebhookEvent} for more details.
      #
      #   The envelope for an objective event webhook delivery. Contains timestamp, event
      #   type, and the webhook data payload.
      #
      #   @param data [Cadenya::Models::UnwrapWebhookEvent::Data] The webhook data payload with flat top-level keys for agent, variation, objectiv
      #
      #   @param timestamp [Time]
      #
      #   @param type [String] The event type, prefixed with objective_event. (e.g., objective_event.tool_resul

      # @see Cadenya::Models::UnwrapWebhookEvent#data
      class Data < Cadenya::Internal::Type::BaseModel
        # @!attribute agent
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata]
        required :agent, -> { Cadenya::ResourceMetadata }

        # @!attribute agent_variation
        #   Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @return [Cadenya::Models::ResourceMetadata]
        required :agent_variation, -> { Cadenya::ResourceMetadata }, api_name: :agentVariation

        # @!attribute objective
        #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
        #   runs)
        #
        #   @return [Cadenya::Models::OperationMetadata]
        required :objective, -> { Cadenya::OperationMetadata }

        # @!attribute objective_event
        #
        #   @return [Cadenya::Models::UnwrapWebhookEvent::Data::ObjectiveEvent]
        required :objective_event,
                 -> { Cadenya::UnwrapWebhookEvent::Data::ObjectiveEvent },
                 api_name: :objectiveEvent

        # @!method initialize(agent:, agent_variation:, objective:, objective_event:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::UnwrapWebhookEvent::Data} for more details.
        #
        #   The webhook data payload with flat top-level keys for agent, variation,
        #   objective, and event.
        #
        #   @param agent [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @param agent_variation [Cadenya::Models::ResourceMetadata] Standard metadata for persistent, named resources (e.g., agents, tools, prompts)
        #
        #   @param objective [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
        #
        #   @param objective_event [Cadenya::Models::UnwrapWebhookEvent::Data::ObjectiveEvent]

        # @see Cadenya::Models::UnwrapWebhookEvent::Data#objective_event
        class ObjectiveEvent < Cadenya::Internal::Type::BaseModel
          # @!attribute data
          #
          #   @return [Cadenya::Models::ObjectiveEventData]
          required :data, -> { Cadenya::ObjectiveEventData }

          # @!attribute metadata
          #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
          #   runs)
          #
          #   @return [Cadenya::Models::OperationMetadata]
          required :metadata, -> { Cadenya::OperationMetadata }

          # @!attribute context_window_id
          #
          #   @return [String, nil]
          optional :context_window_id, String, api_name: :contextWindowId

          # @!attribute info
          #
          #   @return [Cadenya::Models::ObjectiveEventInfo, nil]
          optional :info, -> { Cadenya::ObjectiveEventInfo }

          # @!method initialize(data:, metadata:, context_window_id: nil, info: nil)
          #   Some parameter documentations has been truncated, see
          #   {Cadenya::Models::UnwrapWebhookEvent::Data::ObjectiveEvent} for more details.
          #
          #   @param data [Cadenya::Models::ObjectiveEventData]
          #
          #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
          #
          #   @param context_window_id [String]
          #
          #   @param info [Cadenya::Models::ObjectiveEventInfo]
        end
      end
    end
  end
end
