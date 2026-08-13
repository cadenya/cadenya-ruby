# typed: strong

module Cadenya
  module Models
    class AccountInfo < Cadenya::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Cadenya::AccountInfo, Cadenya::Internal::AnyHash) }

      # The challenge token Cadenya sends in the X-Cadenya-Challenge-Token header on
      # every MCP tools/list request. Server implementations can accept a valid
      # challenge token in place of per-user auth when listing tools, while still
      # requiring real auth on tools/call. Rotate with RotateChallengeToken; update any
      # servers validating the token before rotating.
      sig { returns(String) }
      attr_accessor :challenge_token

      # The generated secret that will sign all webhooks that are sent to your
      # configured Webhook URL. Formatted as "wh_asdf1234" per the
      # https://www.standardwebhooks.com/ format.
      sig { returns(String) }
      attr_accessor :webhook_events_hmac_secret

      # Server-populated information about the account.
      sig do
        params(
          challenge_token: String,
          webhook_events_hmac_secret: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The challenge token Cadenya sends in the X-Cadenya-Challenge-Token header on
        # every MCP tools/list request. Server implementations can accept a valid
        # challenge token in place of per-user auth when listing tools, while still
        # requiring real auth on tools/call. Rotate with RotateChallengeToken; update any
        # servers validating the token before rotating.
        challenge_token:,
        # The generated secret that will sign all webhooks that are sent to your
        # configured Webhook URL. Formatted as "wh_asdf1234" per the
        # https://www.standardwebhooks.com/ format.
        webhook_events_hmac_secret:
      )
      end

      sig do
        override.returns(
          { challenge_token: String, webhook_events_hmac_secret: String }
        )
      end
      def to_hash
      end
    end
  end
end
