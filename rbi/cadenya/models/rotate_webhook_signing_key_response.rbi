# typed: strong

module Cadenya
  module Models
    class RotateWebhookSigningKeyResponse < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Cadenya::RotateWebhookSigningKeyResponse,
            Cadenya::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :webhook_events_hmac_secret

      sig { params(webhook_events_hmac_secret: String).void }
      attr_writer :webhook_events_hmac_secret

      # Response containing the newly generated webhook signing secret.
      sig do
        params(webhook_events_hmac_secret: String).returns(T.attached_class)
      end
      def self.new(webhook_events_hmac_secret: nil)
      end

      sig { override.returns({ webhook_events_hmac_secret: String }) }
      def to_hash
      end
    end
  end
end
