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
        #   @return [String]
        required :challenge_token, String, api_name: :challengeToken

        # @!attribute webhook_events_hmac_secret
        #   The generated secret that will sign all webhooks that are sent to your
        #   configured Webhook URL. Formatted as "wh_asdf1234" per the
        #   https://www.standardwebhooks.com/ format.
        #
        #   @return [String]
        required :webhook_events_hmac_secret, String, api_name: :webhookEventsHmacSecret
      end

      # @!method initialize(challenge_token:, webhook_events_hmac_secret:)
      #   Some parameter documentations has been truncated, see
      #   {Cadenya::Models::AccountInfo} for more details.
      #
      #   Server-populated information about the account.
      #
      #   @param challenge_token [String] The challenge token Cadenya sends in the X-Cadenya-Challenge-Token header
      #
      #   @param webhook_events_hmac_secret [String] The generated secret that will sign all webhooks that are sent to your configure
    end
  end
end
