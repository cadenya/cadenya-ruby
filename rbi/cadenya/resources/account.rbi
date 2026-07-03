# typed: strong

module Cadenya
  module Resources
    # Manage the authenticated account. Accounts are the top-level organizational unit
    # and contain one or more workspaces.
    class Account
      # Retrieves the current account for the token accessing the API. Useful to check
      # if the credentials are valid.
      sig do
        params(request_options: Cadenya::RequestOptions::OrHash).returns(
          Cadenya::AccountAPI
        )
      end
      def retrieve(request_options: {})
      end

      # Rotates the challenge token sent in the X-Cadenya-Challenge-Token header on MCP
      # tools/list requests. Returns only the new token.
      sig do
        params(request_options: Cadenya::RequestOptions::OrHash).returns(
          Cadenya::RotateChallengeTokenResponse
        )
      end
      def rotate_challenge_token(request_options: {})
      end

      # Rotates the webhook signing key for the account. Returns only the new key.
      sig do
        params(request_options: Cadenya::RequestOptions::OrHash).returns(
          Cadenya::RotateWebhookSigningKeyResponse
        )
      end
      def rotate_webhook_signing_key(request_options: {})
      end

      # @api private
      sig { params(client: Cadenya::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
