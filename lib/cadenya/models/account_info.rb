# frozen_string_literal: true

module Cadenya
  module Models
    class AccountInfo < Cadenya::Internal::Type::BaseModel
      response_only do
        # @!attribute challenge_token
        #   The challenge token Cadenya sends in the X-Cadenya-Challenge-Token header on
        #   every MCP tools/list request. Server implementations can accept a valid
        #   challenge token in place of per-user auth when listing tools, while still
        #   requiring real auth on tools/call. Rotate with RotateChallengeToken; update any
        #   servers validating the token before rotating.
        #
        #   @return [String, nil]
        optional :challenge_token, String, api_name: :challengeToken

        # @!attribute global_api_key
        #   An API key. Every key belongs to exactly one workspace and is managed via the
        #   workspace-scoped API key routes. The only exception is the system-managed global
        #   account key, which spans all workspaces and is managed via the account
        #   global_api_key routes.
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

      # @!method initialize(challenge_token: nil, global_api_key: nil, webhook_events_hmac_secret: nil)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AccountInfo} for more details.
      #
      #   Server-populated information about the account.
      #
      #   @param challenge_token [String] The challenge token Cadenya sends in the X-Cadenya-Challenge-Token header
      #
      #   @param global_api_key [Cadenya::Models::APIKey] An API key. Every key belongs to exactly one workspace and is managed via
      #
      #   @param webhook_events_hmac_secret [String] The generated secret that will sign all webhooks that are sent to your configure
    end
  end
end
