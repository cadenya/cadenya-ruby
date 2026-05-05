# frozen_string_literal: true

module Cadenya
  module Models
    module Agents
      # @see Cadenya::Resources::Agents::WebhookDeliveries#list
      class WebhookDelivery < Cadenya::Internal::Type::BaseModel
        # @!attribute data
        #   Webhook delivery details.
        #
        #   @return [Cadenya::Models::Agents::WebhookDeliveryData]
        required :data, -> { Cadenya::Agents::WebhookDeliveryData }

        # @!attribute metadata
        #   Metadata for ephemeral operations and activities (e.g., objectives, executions,
        #   runs)
        #
        #   @return [Cadenya::Models::OperationMetadata]
        required :metadata, -> { Cadenya::OperationMetadata }

        # @!method initialize(data:, metadata:)
        #   Some parameter documentations has been truncated, see
        #   {Cadenya::Models::Agents::WebhookDelivery} for more details.
        #
        #   @param data [Cadenya::Models::Agents::WebhookDeliveryData] Webhook delivery details.
        #
        #   @param metadata [Cadenya::Models::OperationMetadata] Metadata for ephemeral operations and activities (e.g., objectives, executions,
      end
    end
  end
end
