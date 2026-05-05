# frozen_string_literal: true

module Cadenya
  module Models
    # @see Cadenya::Resources::Account#rotate_webhook_signing_key
    class RotateWebhookSigningKeyResponse < Cadenya::Internal::Type::BaseModel
      # @!attribute webhook_events_hmac_secret
      #
      #   @return [String, nil]
      optional :webhook_events_hmac_secret, String, api_name: :webhookEventsHmacSecret

      # @!method initialize(webhook_events_hmac_secret: nil)
      #   Response containing the newly generated webhook signing secret.
      #
      #   @param webhook_events_hmac_secret [String]
    end
  end
end
