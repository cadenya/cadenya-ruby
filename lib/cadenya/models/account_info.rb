# frozen_string_literal: true

module Cadenya
  module Models
    class AccountInfo < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute global_api_key
        #   An API key for the account. Use workspace-association RPCs to grant the key
        #   access to specific workspaces; a key with zero workspaces is valid but cannot
        #   access workspace-scoped resources.
        #
        #   @return [Cadenya::Models::APIKey, nil]
        optional :global_api_key, -> { Cadenya::APIKey }, api_name: :globalApiKey

        # @!attribute webhook_events_hmac_secret
        #   The generated secret that will sign all webhooks that are sent to your
        #   configured Webhook URL. Formatted as "wh_asdf1234" per the
        #   https://www.standardwebhooks.com/ format.
        #
        #   @return [String, nil]
        optional :webhook_events_hmac_secret, String, api_name: :webhookEventsHmacSecret
      end

      # @!method initialize(global_api_key: nil, webhook_events_hmac_secret: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AccountInfo} for more details.
      #
      #   Server-populated information about the account.
      #
      #   @param global_api_key [Cadenya::Models::APIKey] An API key for the account. Use workspace-association RPCs to grant the
      #
      #   @param webhook_events_hmac_secret [String] The generated secret that will sign all webhooks that are sent to your configure
    end
  end
end
