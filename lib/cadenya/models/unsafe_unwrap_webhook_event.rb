# frozen_string_literal: true

module Cadenya
  module Models
    class UnsafeUnwrapWebhookEvent < Cadenya::Internal::Type::BaseModel
      # @!attribute data
      #   The webhook data payload with flat top-level keys for agent, variation,
      #   objective, and event.
      #
      #   @return [Cadenya::Models::UnsafeUnwrapWebhookEvent::Data]
      required :data, -> { Cadenya::UnsafeUnwrapWebhookEvent::Data }

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
      #   {Cadenya::Models::UnsafeUnwrapWebhookEvent} for more details.
      #
      #   The envelope for an objective event webhook delivery. Contains timestamp, event
      #   type, and the webhook data payload.
      #
      #   @param data [Cadenya::Models::UnsafeUnwrapWebhookEvent::Data] The webhook data payload with flat top-level keys for agent, variation, objectiv
      #
      #   @param timestamp [Time]
      #
      #   @param type [String] The event type, prefixed with objective_event. (e.g., objective_event.tool_resul

      # @see Cadenya::Models::UnsafeUnwrapWebhookEvent#data
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
        #   @return [Cadenya::Models::ObjectiveEvent]
        required :objective_event, -> { Cadenya::ObjectiveEvent }, api_name: :objectiveEvent

        # @!method initialize(agent:, agent_variation:, objective:, objective_event:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::UnsafeUnwrapWebhookEvent::Data} for more details.
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
        #   @param objective_event [Cadenya::Models::ObjectiveEvent]
      end
    end
  end
end
