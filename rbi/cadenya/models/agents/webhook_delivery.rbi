# typed: strong

module Cadenya
  module Models
    module Agents
      class WebhookDelivery < Cadenya::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Cadenya::Agents::WebhookDelivery, Cadenya::Internal::AnyHash)
          end

        # Webhook delivery details.
        sig { returns(Cadenya::Agents::WebhookDeliveryData) }
        attr_reader :data

        sig { params(data: Cadenya::Agents::WebhookDeliveryData::OrHash).void }
        attr_writer :data

        # Metadata for ephemeral operations and activities (e.g., objectives, executions,
        # runs)
        sig { returns(Cadenya::OperationMetadata) }
        attr_reader :metadata

        sig { params(metadata: Cadenya::OperationMetadata::OrHash).void }
        attr_writer :metadata

        sig do
          params(
            data: Cadenya::Agents::WebhookDeliveryData::OrHash,
            metadata: Cadenya::OperationMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Webhook delivery details.
          data:,
          # Metadata for ephemeral operations and activities (e.g., objectives, executions,
          # runs)
          metadata:
        )
        end

        sig do
          override.returns(
            {
              data: Cadenya::Agents::WebhookDeliveryData,
              metadata: Cadenya::OperationMetadata
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
